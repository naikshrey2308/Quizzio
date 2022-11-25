from calendar import c
import copy
import email
from encodings import CodecRegistryError
from types import NoneType
from django.shortcuts import redirect, render
from django.contrib import messages
from matplotlib import markers
from pyparsing import Or
from User.forms import *
from quizApp.models import AttemptedOpt, AttemptedQue, CorrectOptions, Question, Quiz, Score
from .models import Student, Organizer, User
from quizApp.views import check_login
from ONLINE_QUIZ import settings
from pathlib import Path
import matplotlib.pyplot as plt
import urllib, base64
import io

def createUser(request):
    if request.method == "POST":
        profile_pic = request.FILES.get("u_dp")
        name = request.POST.get("u_name").strip()
        password = request.POST.get("u_pass").strip()
        cpassword = request.POST.get("u_c_pass").strip()
        email = request.POST.get("u_email").strip()
        institute = request.POST.get("u_institute").strip()
        userType = request.POST.get("u_type").strip()
        DOB = request.POST.get("u_dob")
        NLS_status = request.POST.get("u_NLS_status")

        if password != cpassword:
            messages.info(request, 'Passwords are not matching')
            return redirect("/")

        if name == "" or password == "" or email == "" or institute == "" or userType == "" or DOB == "":
            messages.info(request, "Please fill all the fields. Do not leave any field empty!")
            return redirect("/")

        user = Student() if userType == "Student" else Organizer()
        user.name = name
        user.password = password
        user.email = email
        user.institution = institute
        user.dob = DOB
        user.isNewsletterSubscribed = False if NLS_status == None else True

        if profile_pic != None:
            profile_pic.name = user.email + "." + profile_pic.name.split(".")[-1]
        user.profilePic = profile_pic
        print(profile_pic)

        user.save()
        if "user" in request.session:
            del request.session["user"]
        request.session["user"] = user.email

        messages.success(request, "Registration successful.")
        return redirect("/")

    else:
        return render(request, "index.html", {})
    
def loginUser(request):
    if request.method == 'POST':
        username = request.POST.get("u_email").strip()
        password = request.POST.get("u_password").strip()
        
        if Student.objects.filter(email=username).exists():
            user = Student.objects.get(email=username)
            if user.password != password:
                messages.error(request, "Incorrect password. Please retry.")
                redirect("/")
            else:
                if "user" in request.session:
                    del request.session["user"]
                request.session["user"] = user.email
                messages.info(request, "Logged in successfully!")

        elif Organizer.objects.filter(email=username).exists():
            user = Organizer.objects.get(email=username)
            if user.password != password:
                messages.error(request, "Incorrect password. Please retry.")
                redirect("/")
            else:
                if "user" in request.session:
                    del request.session["user"]
                request.session["user"] = user.email
                messages.info(request, "Logged in successfully!")

        else:
            messages.error(request, "No such user found.")

    return redirect("/")
    
def logoutUser(request):
    if "user" in request.session:
        del request.session["user"]
    return redirect("/")


def plot_graph(scores):
    if not scores:
        return None

    scores = list(scores)
    scores.reverse()
    ypoints = [(score.marks / score.quizId.marks * 100) for score in scores]

    fig = plt.figure()

    plt.plot(ypoints, marker="o", c="#3aafa9")
    plt.title("Your Progress Chart")
    plt.gca().axes.xaxis.set_visible(False)
    plt.ylim([-5,105])
    plt.ylabel("Percentage (%)")    


    fig = plt.gcf()

    buf = io.BytesIO()
    fig.savefig(buf, format="png")
    buf.seek(0)
    string = base64.b64encode(buf.read())
    uri = urllib.parse.quote(string)
    return uri

def pie_chart(scores):
    if not scores:
        return None

    labels = ["Total Correct", "Total Incorrect"]
    explode = [0.2, 0]
    colors = ["#3aafa9", "#ff6666"]
    correct = 0
    incorrect = 0

    for score in scores:
        attempts = AttemptedQue.objects.filter(scoreId=score)
        for attempt in attempts:
            if attempt.marks == 0:
                incorrect += 1
            else:
                correct += 1

    ypoints = [correct, incorrect]

    fig = plt.figure()

    plt.pie(ypoints, labels=labels, explode=explode, colors=colors, startangle=90)
    plt.title("Your Score Chart")
    plt.legend()

    fig = plt.gcf()

    buf = io.BytesIO()
    fig.savefig(buf, format="png")
    buf.seek(0)
    string = base64.b64encode(buf.read())
    uri = urllib.parse.quote(string)
    return uri

def me(request):
    context = dict()
    user = check_login(request)

    if user != None:
        context["user"] = user
        context["userType"] = type(user).__name__
        context["updateForm"] = UpdateUserForm(initial=user.__dict__)
        if context["userType"] == "Organizer":
            context["quizzes"] = Quiz.objects.filter(organizer=user.id).order_by("-creationTime")
            if len(context["quizzes"]) > 5:
                context["quizzes"] = context["quizzes"][:5]
        else:
            context["scores"] = Score.objects.filter(studentId=user).order_by("-id")[:5]
            scores = Score.objects.filter(studentId=user).order_by("-creationTime")
            context["per_graph"] = plot_graph(scores)
            context["pie_graph"] = pie_chart(scores)
        
        return render(request, 'user.html', context)
    else:
        return render(request, "no_access.html", context)

def updateUser(request):
    user = check_login(request)    

    if request.method == "POST" and user != None:
        form = UpdateUserForm(request.POST, request.FILES)
        if form.is_valid():
            user.name = form.cleaned_data.get("name")
            user.password = form.cleaned_data.get("password")
            user.email = form.cleaned_data.get("email")
            
            if form.data.get("profilePic") == "":
                pass
            else:
                user.deleteProfilePic()
                user.profilePic = form.cleaned_data.get("profilePic")
                if user.profilePic != None:
                    user.profilePic.name = user.email + "." + user.profilePic.name.split(".")[-1]

            user.institution = form.cleaned_data.get("institution")
            user.dob = form.cleaned_data.get("dob")
            user.save()
        else:
            messages.error(request, "Invalid Form Credentials.")
        return redirect("/accounts/me")
    else:
        return redirect("/accounts/me")
    
def deleteUser(request):
    user = check_login(request)

    if user != None:
        user.delete()
        del request.session["user"]

    return redirect("/")

def getUser(request):
    user = check_login(request)
    if request.method == "GET" and request.GET.get("search_email"):
        key = request.GET["search_email"].strip()
        key = key.lower()
        users = list()
        if Student.objects.filter(email__contains=key).exists():
            users += list(Student.objects.filter(email__contains=key))
        if Organizer.objects.filter(email__contains=key).exists():
            users += list(Organizer.objects.filter(email__contains=key))

        users2 = list()
        if "@" not in key:
            for i in users:
                if key in i.email[:i.email.index("@")].lower():
                    users2.append(i)

        if len(users2) > 25:
            users = users[:25]

        if len(users2) == 0:
            messages.info(request, "No user found with this email (" + key + ")")

        return render(request, "search_user.html", { "users": users2, "user": user })
    else:
        return render(request, "search_user.html", {"user": user})

def showUser(request):
    if request.method == "GET":
        email = request.GET["email"].strip()
        user = check_login(request)

        if user != None and user.email == email:
            return redirect("/accounts/me")

        req_user = None
        context = {"user": user, "userType": type(user).__name__}
        if Student.objects.filter(email=email).exists():
            req_user = Student.objects.get(email=email)
            context["scores"] = Score.objects.filter(studentId=req_user)
            context["per_graph"] = plot_graph(context["scores"])
            context["pie_graph"] = pie_chart(context["scores"])
        elif Organizer.objects.filter(email=email).exists():
            req_user = Organizer.objects.get(email=email)
            context["quizzes"] = Quiz.objects.filter(organizer=req_user.id).order_by("-creationTime")[:5]

        context["req_user"] = req_user
        context["req_userType"] = type(req_user).__name__
        
        if req_user != None:
            return render(request, "show_user.html", context)
        else:
            return redirect("/accounts/getUser")


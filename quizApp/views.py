from datetime import datetime
from django.forms import ImageField
from django.http import HttpResponse
from django.shortcuts import render
from User.models import User, Student, Organizer
from quizApp.models import Quiz, Question, Option, CorrectOptions, Score
from quizApp.forms import QuizzForm
from django.contrib import messages

from django.shortcuts import redirect, render

# Create your views here.

# Check if the user is logged in. If so, get details
def check_login(request):
    user = None
    if "user" in request.session:
        if Student.objects.filter(email=request.session["user"]).exists():
            user = Student.objects.get(email=request.session["user"])
        elif Organizer.objects.filter(email=request.session["user"]).exists():
            user = Organizer.objects.get(email=request.session["user"])
    return user


def index(request):
    user = check_login(request)
    return render(request, "index.html", { "user": user, "userType": type(user).__name__ })


def createQuiz(request):
    user = check_login(request)

    if type(user).__name__ == "Student":
        return redirect("/")

    if request.method == 'POST':
        quiz = QuizzForm(request.POST, request.FILES)

        for field in quiz:
            print("Field Error:", field.name,  field.errors)

        if quiz.is_valid() :
            name = quiz.cleaned_data['name']
            subject = quiz.cleaned_data['subject']
            quizPic = quiz.cleaned_data['quizPic']
            description = quiz.cleaned_data['description']
            organizer = quiz.cleaned_data['organizer']
            creationTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            quizTime = quiz.cleaned_data["quizTime"]

            if name != "" and subject != "" and description != "":
                newQuiz = Quiz(name=name, subject=subject, quizPic=quizPic, description=description, organizer=organizer, creationTime=creationTime, quizTime=quizTime)
                newQuiz.save()
                print("saved")
                return redirect("/questions/create?id=" + str(newQuiz.id))
            
            else :
                messages.error("Please fill all the fields of form")
                print("------------------")
                return redirect("/createQuiz")

        else:
            print("not valid quiz")
            return redirect("/")
    else :
        if user != None:
            print("user not none")
            print(user.id)
            cqf = QuizzForm()
            cqf.fields['organizer'].initial = user.id
            # cqf.fields['organizer'].widget.attrs['readonly'] = True
            # cqf.instance.organizer = user.id
        else :
            cqf = None
            print("user none")
        return render(request, "createQuiz.html", {"user": user, 'fm':cqf})


def showAllQuiz(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    if request.method == "GET":
        user = check_login(request)
        key = request.GET.get("id")
        OrgAllquiz = Quiz.objects.filter(organizer=key)
        if Organizer.objects.filter(id=key).exists():
            context["req_user"] = Organizer.objects.get(id=key)
        context["quizzes"] = OrgAllquiz
        return render(request, "showAllQuiz.html", context)
    else:
        return redirect("/")

def showAllStuQuiz(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    if request.method == "GET":
        user = check_login(request)
        key = request.GET["id"]

        if Score.objects.filter(studentId=key).exists():
            allQuizIds = Score.objects.filter(studentId=key)
        else:
            return redirect("/")

        if Student.objects.filter(id=key).exists():
            context["req_user"] = Student.objects.get(id=key)
        elif Organizer.objects.filter(id=key).exists():
            return redirect("/showAllQuiz?id=" + str(key))
        else:
            return redirect("/")
        
        context["quizzes"] = allQuizIds
        return render(request, "showAllStuQuiz.html", context)
    else:
        return redirect("/")

def viewQuiz(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    if request.method == "GET":
        user = check_login(request)
        quizIdForView = request.GET.get("id")
        quizForViewQuiz = Quiz.objects.get(id=quizIdForView)
        quizQues = Question.objects.filter(quizId=quizIdForView) 
        context["quiz"] = quizForViewQuiz
        context["ques"] = quizQues
        return render(request, "viewQuiz.html", context)


def viewQuestion(request):
    user = check_login(request)
    
    if request.method == "GET":
        queForViewQue = request.GET.get("id")
        question = Question.objects.get(id=queForViewQue)
        options = Option.objects.filter(questionId=queForViewQue)
        correctOpts = CorrectOptions.objects.filter(questionId=queForViewQue)
        correctOptsIds = []
        for i in correctOpts:
            correctOptsIds.append(i.optionId.id)

        context = {"user": user, "userType": type(user).__name__, "question": question, "options": options, "correctOpts" : correctOptsIds}
        return render(request, "viewQuestion.html", context)


def giveQuiz(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    if request.method == "GET":
        findquiz = request.GET.get("id")
        QuestionsUI = Question.objects.filter(quizId__id=findquiz)
        context["quiz"] = Quiz.objects.get(id=findquiz)
        qdata = list()
        for que in QuestionsUI:
            opts = Option.objects.filter(questionId=que)
            qdata.append({"question": que, "choices": opts})

        context["data"] = qdata   
        print(qdata)
    return render(request, "quiz.html", context)


def giveQuizHelper(request):
    user = check_login(request)
    if request.method == "GET":
        if user is not None:
            findquiz = request.GET.get("id")
            quizId = Quiz.objects.get(id=findquiz)
            marks = 0
            studentId = user

            if Score.objects.filter(studentId=studentId, quizId=quizId).exists():
                return redirect("/scorecard?id=" + str(findquiz))

            initialscore = Score(studentId=studentId, quizId=quizId, marks=marks)
            initialscore.creationTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            initialscore.save()

            return redirect("/giveQuiz?id=" + str(findquiz))
        else:
            return redirect("/")
    else:
        return redirect("/")

def Leaderboard(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}
    context["students"] = Student.objects.all().order_by("-rating")[:100]
    return render(request, "leaderboard.html", context)

def LockQuiz(request):
    user = check_login(request)
    if user == None:
        return HttpResponse("Error!")
    if request.method == "GET":
        quizId = request.GET.get("id")
        if Quiz.objects.filter(id=quizId).exists():
            quiz = Quiz.objects.get(id=quizId)
            quiz.isLocked = True
            quiz.save()
            return HttpResponse("Done")
        else:
            return HttpResponse("No quiz found!")
    else:
        return HttpResponse("No id found")
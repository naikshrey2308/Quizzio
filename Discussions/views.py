import re
from tabnanny import check
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.contrib import messages
from Discussions.forms import postDoubtForm, postReplyForm
from Discussions.models import Doubt, Reply
from User.views import check_login

# Create your views here.

def showDiscussions(request):
    user = check_login(request)
    context = dict()
    context["user"] = user
    context["userType"] = type(user).__name__

    if request.method == "POST":
        form = postDoubtForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("/discuss/")
        else:
            messages.error(request, "Invalid Form Data Supplied. Please try again!")
            return redirect("/discuss/")
    else:
        doubt_list = Doubt.objects.all()
        if len(doubt_list) > 25:
            doubt_list = doubt_list[:25]
        if user != None:
            form = postDoubtForm({"creator": user.id})
            context["postDoubtForm"] = form
        context["doubt_list"] = doubt_list
    
    return render(request, "discussions.html", context)

def viewDoubt(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    if request.method == "GET":
        key = request.GET["id"].strip()
        if Doubt.objects.filter(id=key).exists():
            doubt = Doubt.objects.get(id=key)
            context["doubt"] = doubt    

            user_cat = "trustedCreator" if type(user).__name__ == "Organizer" else "creator"
            if user != None:
                form = postReplyForm(initial={user_cat: user.id, "doubt": key}, use_required_attribute=False)
                context["form"] = form

            replies = list(Reply.objects.filter(doubt=doubt));
            if len(replies) > 25:
                replies = replies[:25]

            context["replies"] = replies
            
            return render(request, "show_discussion.html", context)
        else:
            messages.error(request, "Request Doubt does not exist!")
            return redirect("/discuss")

    return redirect("/discuss")

def postReply(request):
    if request.method == "POST":
        form = postReplyForm(request.POST)
        if form.is_valid():
            form.save()
        else:
            messages.error(request, "Invalid Form Details")
    return redirect("/discuss/view?id=" + str(form.cleaned_data["doubt"].id))
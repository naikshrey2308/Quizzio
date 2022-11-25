from mimetypes import init
from tabnanny import check
from django.forms import formset_factory
from django.shortcuts import redirect, render
from django.contrib import messages
from User.models import Organizer
from User.views import check_login
from quizApp.forms import OptionForm, QuestionForm
from quizApp.models import CorrectOptions, Option, Question, Quiz

def check_quiz(request):
    user = check_login(request=request)
    if user == None:
        return None, None

    quiz = None
    if request.method == "GET":
        key = request.GET["id"]
        if Quiz.objects.filter(id=key).exists():
            quiz = Quiz.objects.get(id=key)
            print("Hello " + str(quiz.organizer.id) + " " + str(user.id))
            if quiz.organizer.id != user.id:
                quiz = None
    return user, quiz

def createQuestion(request):
    user, quiz = check_quiz(request)

    if not (user != None and quiz != None):
        print(str(user == None) + " " + str(quiz == None))
        return redirect("/")

    if user.id != quiz.organizer.id or type(user).__name__ != "Organizer":
        return redirect("/")

    context = {"user": user, "userType": type(user).__name__}
    if request.method == "POST":
        form = QuestionForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("/questions?id=" + quiz.id)
    else:
        form = QuestionForm(initial={"quizId": quiz.id})
        context["form"] = form
        context["quiz"] = quiz
        optionForms = formset_factory(OptionForm, extra=10)
        context["optionForms"] = optionForms
    return render(request, "create_question.html", context)

def createQuestionSubmit(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}
        
    # If form is submitted
    if request.method == "POST":
        questionForm = QuestionForm(request.POST)
        question = None
        if questionForm.is_valid():
            if questionForm.cleaned_data["marks"] < 0:
                questionForm.fields["marks"] = 0
            question = questionForm.save()
            
            # Add the saved question's marks to the quiz
            quiz = Quiz.objects.get(id=question.quizId.id)
            quiz.marks += question.marks
            if quiz.marks < 0:
                quiz.marks = 0
            quiz.save()
            
            context["question"] = question
            context["form"] = questionForm
            return redirect("/createQuestion/options?id=" + str(question.id))
        else:
            for i in questionForm:
                print(i.name, i.errors)
            messages.error(request, "Invalid Form Data")
            return redirect("/")

    # If form is not submitted
    return redirect("/")

def createQuestionOptions(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}
    
    if request.method == "GET":
        key = request.GET.get("id")
        question = Question.objects.get(id=key)
        context["question"] = question
        form = OptionForm(initial={"questionId": question})
        context["form"] = form

        # retrieve the options for the question
        options = Option.objects.filter(questionId=key)
        context["options"] = options
        correctoptions = CorrectOptions.objects.filter(questionId=key)
        correctoptionsOption = list()
        for i in correctoptions:
            correctoptionsOption.append(i.optionId)
        context["correctoptions"] = correctoptionsOption

    return render(request, "create-option.html", context)

def createOptionSubmit(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    # if form is submitted
    if request.method == "POST":
        form = OptionForm(request.POST)
        isTrue = request.POST.get("isTrue")
        if form.is_valid():
            opt = form.save()
            if isTrue != None:
                copt = CorrectOptions()
                copt.optionId = opt
                copt.questionId = opt.questionId
                copt.save()
        else:
            messages.error(request, "Error adding the option!")
        return redirect("/createQuestion/options?id=" + str(form.cleaned_data.get("questionId").id))
            
    return redirect("/")

def deleteOption(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}
    
    # Student cannot alter the quiz
    if type(user).__name__ == "Student":
        return redirect("/")

    if request.method == "GET":
        key = request.GET["id"]
        option = Option.objects.get(id=key)
        question = Question.objects.get(id=option.questionId.id)
        quiz = question.quizId
        organizer = Quiz.objects.get(id=quiz.id).organizer

        # Only the creator of the quiz can alter the quiz
        if user.id != organizer.id:
            return redirect("/")
        # Delete the option
        else:
            option.delete()
            return redirect("/createQuestion/options?id=" + str(question.id))
    return redirect("/")

def deleteQuestion(request):
    user = check_login(request)

    # Student cannot alter the quiz
    if type(user).__name__ == "Student":
        return redirect("/")
    
    if request.method == "GET":
        key = request.GET["id"]
        question = Question.objects.get(id=key)
        quiz = question.quizId
        organizer = Quiz.objects.get(id=quiz.id).organizer

        # Only the creator of the quiz can alter the quiz
        if user.id != organizer.id:
            return redirect("/")
        # Delete the question
        else:
            # Delete the deleted question's marks from the quiz
            quiz.marks -= question.marks
            if quiz.marks < 0:
                quiz.marks = 0
            quiz.save()

            question.delete()
            return redirect("/viewQuiz?id=" + str(quiz.id))
    return redirect("/")

def deleteQuiz(request):
    user = check_login(request)

    # students cannot delete the quiz
    if type(user).__name__ == "Student":
        return redirect("/")
    
    if request.method == "GET":
        key = request.GET["id"]
        quiz = Quiz.objects.get(id=key)

        # only the organizer who created the quiz can delete it
        if user.id != quiz.organizer.id:
            return redirect("/")
        # delete the quiz
        else:
            quiz.delete()
            quiz.deleteProfilePic()
            return redirect("/showAllQuiz?id=" + str(user.id))
    return redirect("/")
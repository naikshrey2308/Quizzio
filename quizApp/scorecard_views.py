from django.shortcuts import redirect, render
from User.models import Student
from quizApp.models import AttemptedOpt, AttemptedQue, CorrectOptions, Option, Question, Quiz, Score
from quizApp.views import check_login

def scorecard(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    if user == None:
        return redirect("/")

    if request.method == "GET":
        findquiz = request.GET.get("id")

        # if organizer asks for the quiz
        req_user = None
        if context["userType"] == "Organizer" and Quiz.objects.get(id=findquiz).organizer == user:
            req_user = request.GET.get("sid")
            req_user = Student.objects.get(id=req_user)
        else:
            req_user = user

        QuestionsUI = Question.objects.filter(quizId__id=findquiz)
        if Score.objects.filter(quizId__id=findquiz, studentId=req_user).exists():
            score = Score.objects.filter(quizId__id=findquiz, studentId=req_user)
            context["score"] = score[0]
        context["quiz"] = Quiz.objects.get(id=findquiz)
        qdata = list()
        for que in QuestionsUI:
            opts = Option.objects.filter(questionId=que)
            
            copts = list(CorrectOptions.objects.filter(questionId=que))
            for i in range(len(copts)):
                copts[i] = copts[i].optionId.id
            aopts = list(AttemptedOpt.objects.filter(score__studentId=req_user, questionId=que))
            for i in range(len(aopts)):
                aopts[i] = aopts[i].optionId.id
            qdata.append({"question": que, "choices": opts, "correct": copts, "attempted": aopts})

        context["data"] = qdata   
        context["req_user"] = req_user
    return render(request, "scorecard.html", context)

def analyzeQuiz(request):
    user = check_login(request)
    userType = type(user).__name__
    context = {"user": user, "userType": userType}
    
    if userType == "Student" or user == None:
        return redirect("/")

    if request.method == "GET":
        key =  request.GET.get("id")
        quiz = Quiz.objects.get(id=key)
        context["quiz"] = quiz
        scores = Score.objects.filter(quizId__id=key)
        context["scores"] = scores
        context["total_attempts"] = len(scores)

        # calculate the accuracy of the quiz attempts
        totalCorrect = 0
        totalQuestion = 0
        for i in scores:
            totalCorrect += i.marks
            totalQuestion += i.quizId.marks
        if totalQuestion != 0:
            context["accuracy"] = totalCorrect / totalQuestion
        else:
            context["accuracy"] = 0

        return render(request, "analyzeQuiz.html", context)
    else:
        return redirect("viewQuiz?id=" + key)
from django.shortcuts import redirect, render
from User.models import Organizer
from User.views import check_login
from quizApp.models import AttemptedOpt, AttemptedQue, CorrectOptions, Option, Question, Quiz, Score

def quizHome(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    latestQuizzes = list(Quiz.objects.all().order_by("-creationTime"))[:5]
    context["latest"] = latestQuizzes

    trendingQuizzes = list(Quiz.objects.all().order_by("-attempts")[:10])
    context["trending"] = trendingQuizzes

    return render(request, "quiz-home.html", context)

def searchQuiz(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    if request.method == "GET":
        key = request.GET["quiz_name"].strip()
        quizzes = Quiz.objects.filter(name__icontains=key)[:20]
        quizzes = quizzes.union(Quiz.objects.filter(organizer__name__icontains=key))[:20]
        quizzes = quizzes.union(Quiz.objects.filter(id__icontains=key))[:20]
        context["quizzes"] = quizzes
    return render(request, "search_quiz.html", context)

def giveQuizSubmit(request):
    user = check_login(request)
    context = {"user": user, "userType": type(user).__name__}

    # if form is submitted:
    if request.method == "POST":
        uid = request.POST.get("u_id")
        qid = request.POST.get("q_id")

        # if user is not the same
        if str(uid).strip() != str(user.id):
            print("uid != user.id")
            print(uid, user.id)
            return redirect("/")

        # if the url is changed
        if not Quiz.objects.filter(id=qid).exists():
            print("no wxisting quiz..................")
            return redirect("/")

        quiz = Quiz.objects.get(id=qid)
        questions = Question.objects.filter(quizId=quiz)
        score = Score.objects.filter(quizId=quiz, studentId=user)[0]

        total_marks = 0
        for i in questions:
            opts = Option.objects.filter(questionId=i)
            attemptedOpts = list()
            
            # get the list of ids of correct options
            copts = list(CorrectOptions.objects.filter(questionId=i))
            copts_id = list()
            for opt in copts:
                copts_id.append(opt.optionId.id)

            marks = 0
            isWrong = False
            for opt in opts:
                attempt = request.POST.get("val-" + str(i.id) + "-" + str(opt.id))
                if attempt is not None:
                    attemptedOpts.append(attempt)
                    status = False

                    attempt = int(attempt)
                    if attempt not in copts_id:
                        marks = 0
                        isWrong = True
                        status = False
                    else:
                        status = True
                        copts_id.remove(attempt)

                    # save option in the database
                    attemptObj = AttemptedOpt(questionId=i, optionId=opt, isCorrect=status, score=score)
                    attemptObj.save()

            # if the student missed some correct options
            if len(copts_id) > 0 or isWrong == True:
                marks = 0
            else:
                marks = i.marks
                
            total_marks += marks
            # save the question in the database
            ques = AttemptedQue(scoreId=score, questionId=i, marks=marks)
            ques.save()

        # update the score and save it to the database
        score.marks = total_marks
        score.save()

        # Increase the number of quiz submissions
        quiz.attempts += 1
        quiz.save()

        # Update the user's quiz rating
        if context["userType"] == "Student":
            user.rating += 1
            user.save()
        
        return redirect("/scorecard?id=" + str(quiz.id))
    # else redirect to home page (unusual behaviour)
    else:
        print("No request method......................")
        return redirect("/")
        
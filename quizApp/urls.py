from django.urls import include, path
from quizApp import question_views
from . import views
from .import attempt_views
from . import scorecard_views

urlpatterns = [
    path("", views.index, name="index"),
    path("questions/create", question_views.createQuestion, name="createQuestion"),
    path("createQuestion", question_views.createQuestionSubmit, name="createQuestionSubmit"),
    path("createQuestion/options", question_views.createQuestionOptions, name="createOptions"),
    path("createOptionSubmit", question_views.createOptionSubmit, name="createOptionSubmit"),
    path("deleteOption", question_views.deleteOption, name="deleteOption"),
    path("deleteQuestion", question_views.deleteQuestion, name="deleteQuestion"),
    path("deleteQuiz", question_views.deleteQuiz, name="deleteQuiz"),

    path("createQuiz", views.createQuiz, name="createQuiz"),
    path("showAllQuiz", views.showAllQuiz, name="showAllQuiz"),
    path("showAllStuQuiz", views.showAllStuQuiz, name="showAllStuQuiz"),
    
    path("viewQuiz", views.viewQuiz, name="viewQuiz"),
    path("viewQuestion", views.viewQuestion, name="viewQuestion"),
    path("Leaderboard", views.Leaderboard, name="Leaderboard"),
]

# User attempts
urlpatterns += [
    path("quizHome", attempt_views.quizHome, name="quizHome"),
    path("searchQuiz", attempt_views.searchQuiz, name="searchQuiz"),
    path("giveQuiz", views.giveQuiz, name="giveQuiz"),
    path("giveQuizHelper", views.giveQuizHelper, name="giveQuizHelper"),
    path("giveQuiz/submit", attempt_views.giveQuizSubmit, name="giveQuizSubmit"),

    path("scorecard", scorecard_views.scorecard, name="scorecard"),
    path("analyzeQuiz", scorecard_views.analyzeQuiz, name="analyzeQuiz"),

    path("quizzes/lock", views.LockQuiz, name="LockQuiz"),
]
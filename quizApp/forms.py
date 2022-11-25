from logging import PlaceHolder
from django import forms
from pyparsing import OneOrMore

from quizApp.models import Quiz, Question, Option, CorrectOptions, Score, AttemptedQue, AttemptedOpt


class QuizzForm(forms.ModelForm):
    class Meta:
        model = Quiz
        fields=['name', 'subject', 'description', 'quizPic', 'organizer', 'quizTime']
        widgets = {
            "organizer": forms.HiddenInput(),
            "name": forms.TextInput(attrs={"class": "form-control input-control"}),
            "subject": forms.TextInput(attrs={"class": "form-control input-control"}),
            "description": forms.Textarea(attrs={"class":"form-control"}),
            "quizPic": forms.FileInput(attrs={"class": "form-control input-control", "id" : "quizPic"}),            
            "quizTime": forms.TimeInput(attrs={"class": "form-control input-control", "placeholder": 'HH:MM'})
        }


class QuestionForm(forms.ModelForm):
    class Meta:
        model = Question
        fields=['quizId', 'marks', 'statement', 'solution']
        widgets={
            "quizId": forms.HiddenInput(),
            "marks": forms.NumberInput(attrs={"class": "form-control d-inline input-control", "min": 0, "style": "width: auto !important;"}),
            "statement": forms.Textarea(attrs={"class": "form-control border-1 input-control", "rows": 2}),
            "solution": forms.Textarea(attrs={"class": "form-control bg-transparent border-1 input-control", "rows": 2}),          
        }


class OptionForm(forms.ModelForm):
    class Meta:
        model = Option
        fields=['questionId', 'statement']

        widgets={
            "questionId": forms.HiddenInput(),
            "statement": forms.Textarea(attrs={"class": "form-control input-control", "rows": 1})
        }


# for give quiz

class ScoreForm(forms.ModelForm):
    class Meta:
        model = Score
        fields = ['studentId', 'quizId', 'marks']

        widgets= {
            "studentId": forms.HiddenInput(),
            "quizId": forms.HiddenInput(),
            "marks": forms.HiddenInput()
        }


class AttemptedQueForm(forms.ModelForm):
    class Meta:
        model = AttemptedQue
        fields = ['scoreId', 'questionId', 'marks'] 

        widgets={
            "scoreId": forms.HiddenInput(),
            "questionId": forms.HiddenInput(),
            "marks" : forms.HiddenInput()
        }

class AttemptedOptForm(forms.ModelForm):
    class Meta:
        model = AttemptedOpt
        fields = ['questionId', 'optionId']

        widgets = {
            "questionId" : forms.HiddenInput(),
            "optionId"  : forms.HiddenInput()
        } 
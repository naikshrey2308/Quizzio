from django.db import models

from User.models import Organizer
from User.models import Student

# Create your models here.
class Quiz(models.Model):
    name = models.CharField(max_length=100)
    subject = models.CharField(max_length=100)
    marks = models.IntegerField(default=0)
    description = models.TextField(blank=True, null=True)
    quizPic = models.ImageField(upload_to="images/quizzes/", blank=True)
    organizer = models.ForeignKey(Organizer, on_delete=models.CASCADE)
    creationTime = models.DateTimeField(null=True)
    attempts = models.IntegerField(default=0)
    isLocked = models.BooleanField(default=False)
    quizTime = models.TimeField(null=True)

    def deleteProfilePic(self):
        self.quizPic.storage.delete(self.quizPic.name)

class Question(models.Model):
    quizId = models.ForeignKey(Quiz, on_delete=models.CASCADE)
    marks = models.IntegerField(default=0)
    statement = models.TextField()
    solution = models.TextField(blank=True)

class Option(models.Model):
    questionId = models.ForeignKey(Question, on_delete=models.CASCADE)
    statement = models.TextField()

class CorrectOptions(models.Model):
    questionId = models.ForeignKey(Question, on_delete=models.CASCADE)
    optionId = models.ForeignKey(Option, on_delete=models.CASCADE, null=True)


# for user attempts
class Score(models.Model):
    studentId = models.ForeignKey(Student, on_delete=models.CASCADE)
    quizId = models.ForeignKey(Quiz, on_delete=models.CASCADE)
    marks = models.IntegerField()
    creationTime = models.DateTimeField(null=True)


class AttemptedQue(models.Model):
    scoreId = models.ForeignKey(Score, on_delete=models.CASCADE)
    questionId = models.ForeignKey(Question, on_delete=models.CASCADE)
    marks = models.IntegerField()


class AttemptedOpt(models.Model):
    score = models.ForeignKey(Score, on_delete=models.CASCADE)
    questionId = models.ForeignKey(Question, on_delete= models.CASCADE)
    optionId = models.ForeignKey(Option, on_delete=models.CASCADE)
    isCorrect = models.BooleanField(default=False)

from django.db import models
from User.models import *

# Create your models here.
class Doubt(models.Model):
    creator = models.ForeignKey(Student, on_delete=models.CASCADE)
    heading = models.CharField(max_length=255, default="")
    statement = models.TextField()

class Reply(models.Model):
    creator = models.ForeignKey(Student, on_delete=models.CASCADE, blank=True, null=True)
    trustedCreator = models.ForeignKey(Organizer, on_delete=models.CASCADE, blank=True, null=True)
    doubt = models.ForeignKey(Doubt, on_delete=models.CASCADE)
    statement = models.TextField()

class Discussions(models.Model):
    doubts = models.ForeignKey(Doubt, on_delete=models.CASCADE)

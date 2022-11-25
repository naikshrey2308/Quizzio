from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    email = models.EmailField(default="")
    profilePic = models.ImageField(upload_to="images/users/")
    institution = models.CharField(max_length=50)
    dob = models.DateField(default="")
    isNewsletterSubscribed = models.BooleanField(default=True)

    class Meta:
        abstract = True
        ordering = ["name"]

    def deleteProfilePic(self):
        self.profilePic.storage.delete(self.profilePic.name)

class Student(User):
    rating = models.IntegerField(default=0)
    totalQuizzesGiven = models.IntegerField(default=0)
    totalCorrectAnswers = models.IntegerField(default=0)
    totalWrongAnswers = models.IntegerField(default=0)

    class Meta(User.Meta):
        ordering = ["-name"]

class Organizer(User):
    totalQuizzesOrganized = models.IntegerField(default=0)
    
    class Meta(User.Meta):
        ordering = ["-name"]

    

    



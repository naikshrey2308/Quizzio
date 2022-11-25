from fileinput import FileInput
from django import forms
from .models import User, Student, Organizer

class UpdateUserForm(forms.Form):
        name = forms.CharField(max_length=50, widget=forms.TextInput(attrs={"class": "form-control input-control"}))
        password = forms.CharField(max_length=50, widget=forms.TextInput(attrs={"class": "form-control input-control"}))
        email = forms.EmailField(widget=forms.EmailInput(attrs={"class": "form-control input-control"}))
        profilePic = forms.ImageField(widget=forms.FileInput(attrs={"class": "form-control input-control"}), required=False)
        institution = forms.CharField(max_length=100, widget=forms.TextInput(attrs={"class": "form-control input-control"}))
        dob = forms.DateField(widget=forms.DateInput(attrs={"type": "date", "class": "form-control input-control"}))
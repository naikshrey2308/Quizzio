from pyexpat import model
from attr import fields
from django import forms
from matplotlib import widgets
from .models import Doubt, Reply

class postDoubtForm(forms.ModelForm):
        class Meta:
            model = Doubt
            fields = ["creator", "heading", "statement"]
            widgets = {
                "creator": forms.HiddenInput(),
                "heading": forms.TextInput(attrs={"class": "input-control form-control", "placeholder": "Heading for Doubt"}),
                "statement": forms.Textarea(attrs={"class": "input-control form-control", "placeholder": "Statement for Doubt", "required": True}),
            }

class postReplyForm(forms.ModelForm):
    class Meta:
        model = Reply
        fields = ["creator", "trustedCreator", "doubt", "statement"]
        widgets = {
            "creator": forms.HiddenInput(),
            "trustedCreator": forms.HiddenInput(),
            "statement": forms.Textarea(attrs={"class": "input-control form-control", "placeholder": "Post your reply here...", "required": True}),
            "doubt": forms.HiddenInput()
        }
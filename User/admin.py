from django.contrib import admin
from .models import User, Student, Organizer

# Register your models here.
admin.site.register(Student)
admin.site.register(Organizer)
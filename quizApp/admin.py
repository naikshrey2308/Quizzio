from django.contrib import admin
from quizApp.models import *
# Register your models here.

admin.site.register(Quiz)
admin.site.register(Option)
admin.site.register(CorrectOptions)
admin.site.register(Question)
admin.site.register(Score)
admin.site.register(AttemptedQue)
admin.site.register(AttemptedOpt)

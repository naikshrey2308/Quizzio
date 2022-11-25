from django.urls import path
from . import views
from . import json_views

urlpatterns = [
    path("", views.showDiscussions, name="showDiscussions"),
    path("view", views.viewDoubt, name="viewDoubt"),
    path("postReply", views.postReply, name="postReply"),
]
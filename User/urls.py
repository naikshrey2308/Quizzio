from django.urls import path
from . import views

urlpatterns = [
    path("createUser", views.createUser, name="createUser"),
    path("loginUser", views.loginUser, name="loginUser"),
    path("logoutUser", views.logoutUser, name="logoutUser"),
    path("me/updateUser", views.updateUser, name="updateUser"),
    path("deleteUser", views.deleteUser, name="deleteUser"),
    path("getUser", views.getUser, name="getUser"),
    path("showUser", views.showUser, name="showUser"),
    path("me/", views.me, name="me"),
]
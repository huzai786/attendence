from django.urls import path
from .views import addReplace, login, matchUser, update_encoding, change_password, getUsers

urlpatterns = [
    path('add_replacement/', addReplace.as_view()),
    path('login/', login),
    path('match_user/', matchUser),
    path('update_encoding/', update_encoding),
    path('change_password/', change_password),
    path('getUsers/', getUsers),
]

from django.urls import path
from .views import addReplace, LoginView

urlpatterns = [
    # path('sign_in/', Register.as_view()),
    path('add_replacement/', addReplace.as_view()),
    path('sign_in/', LoginView.as_view()),
]

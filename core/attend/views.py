from django.shortcuts import render
from django.http import JsonResponse

def home(request):
    ctx = {}
    return JsonResponse("this is json responce", safe=False)
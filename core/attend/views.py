from rest_framework.decorators import api_view
from .models import AdminUsers
from rest_framework.response import Response
from rest_framework.authtoken.serializers import AuthTokenSerializer
from rest_framework.views import APIView
# from .serializers import 
from django.http import JsonResponse
from django.contrib.auth import get_user_model
import boto3
import os
import cv2
import botocore
import face_recognition
from pathlib import Path
BUCKET_NAME = 'fms-pics'

BASE_DIR = Path(__file__).resolve().parent.parent


# class Register(APIView):
#     def post(self, request):
#         serializer = UserSerializer(data= request.data)
#         serializer.is_valid(raise_exception=True)
#         serializer.save()
#         return Response(serializer.data)


# class addReplace(APIView):
#     def post(self, request):
#         serializer = addReplacementSerializer(data= request.data)
#         serializer.is_valid(raise_exception=True)
#         serializer.save()
#         return Response(serializer.data)

# def update_encoding(request):
#     base_url = "https://fms-pics.s3.us-west-2.amazonaws.com/"
#     target = os.path.join(BASE_DIR, 'userImages/')

#     if request.get('emp_id'):
#         emp_id = int(request.get('emp_id'))
    
#     if request.get('pic'):
#         KEY = int(request.get('pic'))

#     destination = base_url + KEY
#     s3 = boto3.resource('s3')
#     try:
#         s3.Bucket(BUCKET_NAME).download_file(KEY, 'userImages/' + KEY)
#         img = face_recognition.load_image_file('userImages/' + KEY)
#         img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
#         encodeImg = face_recognition.face_encodings(img)[0]

#         lists = encodeImg.tolist()
#         json_str = ';'.join([str(i) for i in lists])
#         # set employing encoding
#         result = {
#             "message": 'True',
#             "status": 201
#         }
#         return JsonResponse(result)
#     except botocore.exceptions.ClientError as e:
#         if e.response['Error']['Code'] == "404":
#             return {"res": "The object does not exist."}

def login(request):
    if request.method == 'POST':
        if request['username']:
            username = request.POST.get('username')
            

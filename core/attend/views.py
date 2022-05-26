from .models import AdminUsers, Employee, EmployeeAttendance
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import TempEmployeesSerializer
from django.http import JsonResponse
from rest_framework import status
import boto3
from packages.utils import decode_auth_token, encode_auth_token, arry_t_byt, byt_t_arry
import os
import cv2
import botocore
import hashlib
from datetime import datetime

import face_recognition
from pathlib import Path
BUCKET_NAME = 'fms-pics'

BASE_DIR = Path(__file__).resolve().parent.parent


# class Register(APIView):
#     def post(self, request):
#         serializer = UserSerializer(data = request.data)
#         serializer.is_valid(raise_exception=True)
#         serializer.save()
#         return Response(serializer.data)


class addReplace(APIView):
    def post(self, request):
        serializer = TempEmployeesSerializer(data= request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


def update_encoding(request):
    base_url = "https://fms-pics.s3.us-west-2.amazonaws.com/"
    target = os.path.join(BASE_DIR, 'userImages/')

    if request.get('emp_id'):
        emp_id = int(request.get('emp_id'))
    
    if request.get('pic'):
        KEY = int(request.get('pic'))

    destination = base_url + KEY
    s3 = boto3.resource('s3')
    try:
        s3.Bucket(BUCKET_NAME).download_file(KEY, 'userImages/' + KEY)
        img = face_recognition.load_image_file('userImages/' + KEY)
        img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
        encodeImg = face_recognition.face_encodings(img)[0]
        emp = Employee.objects.get(emp_id=emp_id)
        emp.emp_encoding = arry_t_byt(encodeImg)
        result = {
            "message": 'True',
            "status": 201
        }

        return JsonResponse(result)
    except botocore.exceptions.ClientError as e:
        if e.response['Error']['Code'] == "404":
            return {"res": "The object does not exist."}


class LoginView(APIView):
    def post(self, request, format=None):
        data = request.data

        username = data.get('username')
        password = hashlib.md5(data.get('password').encode('UTF-8')).hexdigest()
        user = AdminUsers.objects.get(user_name=username, pwd=password)
        if user is not None:
            data = {
            'full_name' : user.full_name,
            'email' : user.email,
            'phone' : user.phone,
            'role_title' : user.role_title,
            }
            auth_token = encode_auth_token(data)
            responseObject = {
                "status": 'success',
                "message": "Successfully logged in",
                "user_data": data,
                "auth_token": auth_token.decode()
            }
            return Response({'result': responseObject}, status=status.HTTP_200_OK)
        else:
            return Response({'status':'Username or Password not correct'},status=status.HTTP_404_NOT_FOUND)


def getUsers(request):
    auth_header = request.headers.get('Authorization')
    if auth_header:
        try:
            auth_token = auth_header.split(" ")[1]
        except IndexError:
            responseObject = {
                'status': 'fail',
                'message': 'Bearer token malformed.'
            }
            return JsonResponse(responseObject, safe=False)
    else:
        auth_token = ''
    if auth_token:
        payload = decode_auth_token(auth_token)
        if not isinstance(payload, str):
            emp = Employee.objects.get(emp_id = str(payload['sub']['emp_id']))


def change_password(request):
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        oldPassword = hashlib.md5(
            request.form['oldPassword'].encode('UTF-8')).hexdigest()
        NewPassword = hashlib.md5(
            request.form['password'].encode('UTF-8')).hexdigest()
        user = AdminUsers.objects.get(email=email)
        if user:
            password = user.pwd
            if password == oldPassword:
                user.pwd = NewPassword
                user.save()
                return JsonResponse({"result": 'Password has been successfully changed'})
            else:
                return JsonResponse({"result": 'Password did not matched!'})
        else:
            return JsonResponse({"result": 'This email address is not in our database'}, status= 400)
    else:
        return JsonResponse({"result": 'Post method allowed'}, status= 400)


def matchUser(request):
    if 'pic' in request.args:
        KEY = request.args['pic']
    try:
        s3 = boto3.resource('s3')
        s3.Bucket(BUCKET_NAME).download_file(KEY, 'matchImages/' + KEY)
        img = face_recognition.load_image_file('matchImages/' + KEY)
        encodeImg = face_recognition.face_encodings(img)[0]
        emps = Employee.objects.filter(emp_is_active=1, emp_is_delete=0)
        for emp in emps:
            if emp.emp_encoding == None:
                continue
            encoding = byt_t_arry(emp.emp_encoding)

            result = face_recognition.compare_faces(encoding, encodeImg)
            if result:
                nowtime = datetime.datetime.now()
                timeTOMatch = nowtime.strftime('%H:%M:%S')
                nowdate = nowtime.strftime('%Y-%M-%d')
                emp_attendence = EmployeeAttendance.objects.get(ea_employee_id =emp.emp_id, ea_date= nowtime)


    except botocore.exceptions.ClientError as e:
        if e.response['Error']['Code'] == "404":
            return {"res": "The object does not exist."}
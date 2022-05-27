from .models import AdminUsers, Employee, EmployeeAttendance, SiteSettings, UserRole
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import TempEmployeesSerializer
from django.http import JsonResponse
import boto3
from packages.utils import decode_auth_token, encode_auth_token, arry_t_byt, byt_t_arry
import cv2
import botocore
import hashlib
from datetime import datetime
import os
import face_recognition
from pathlib import Path

BUCKET_NAME = "fms-pics"

BASE_DIR = Path(__file__).resolve().parent.parent



class addReplace(APIView):
    def post(self, request):
        serializer = TempEmployeesSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


def update_encoding(request):
    base_url = "https://fms-pics.s3.us-west-2.amazonaws.com/"
    target = os.path.join(BASE_DIR, "userImages/")

    if request.get("emp_id"):
        emp_id = int(request.get("emp_id"))

    if request.get("pic"):
        KEY = int(request.get("pic"))

    destination = base_url + KEY
    s3 = boto3.resource("s3")
    try:
        s3.Bucket(BUCKET_NAME).download_file(KEY, "userImages/" + KEY)
        img = face_recognition.load_image_file("userImages/" + KEY)
        img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
        encodeImg = face_recognition.face_encodings(img)[0]
        emp = Employee.objects.get(emp_id=emp_id)
        emp.emp_encoding = arry_t_byt(encodeImg)
        emp.save()
        result = {
            "message": "True",
        }

        return JsonResponse(result)
    except botocore.exceptions.ClientError as e:
        if e.response["Error"]["Code"] == "404":
            return {"res": "The object does not exist."}


def login(request):
    if request.method == "POST":
        if not request.POST.get("username") or not request.POST.get("password"):
            print(request.POST.get("username"), request.POST.get("password"))
            return JsonResponse({"result": "username or password missing!"})

        username = request.POST.get("username")
        password = request.POST.get("password")
        try:
            user = AdminUsers.objects.get(user_name=username, pwd=password)
            user_role = UserRole.objects.get(page_id=user.user_role_id)
            data = {
                "full_name": user.full_name,
                "email": user.email,
                "phone": user.phone,
                "role_title": user_role.role_title,
            }
            auth_token = encode_auth_token(data)
            print(auth_token)
            responseObject = {
                "status": "success",
                "message": "Successfully logged in",
                "user_data": data,
                "auth_token": auth_token,
            }
            print(responseObject)
            return JsonResponse({"result": responseObject})
        except AdminUsers.DoesNotExist:
            return JsonResponse({"result": "Invalid username or password"}, status=404)
    else:
        return JsonResponse({"result": "Only POST method allowed!"}, status=401)


def getUsers(request):
    auth_header = request.headers.get("Authorization")
    if auth_header:
        try:
            auth_token = auth_header.split(" ")[1]
        except IndexError:
            responseObject = {"status": "fail", "message": "Bearer token malformed."}
            return JsonResponse(responseObject, safe=False, status=401)
    else:
        auth_token = ""
    if auth_token:
        payload = decode_auth_token(auth_token)
        if not isinstance(payload, str):
            emps = Employee.objects.filter(emp_is_active=1, emp_is_delete=0)
            emps_data = [
                {
                    "id": e.emp_id,
                    "cnic": e.emp_cnic,
                    "full_name": f"{e.emp_first_name} + {e.emp_last_name}",
                }
                for e in emps
            ]
            return JsonResponse({"result": emps_data})


def change_password(request):
    if request.method == "POST":
        username = request.form["username"]
        email = request.form["email"]
        oldPassword = hashlib.md5(
            request.form["oldPassword"].encode("UTF-8")
        ).hexdigest()
        NewPassword = hashlib.md5(request.form["password"].encode("UTF-8")).hexdigest()
        user = AdminUsers.objects.get(email=email)
        if user:
            password = user.pwd
            if password == oldPassword:
                user.pwd = NewPassword
                user.save()
                return JsonResponse(
                    {"result": "Password has been successfully changed"}
                )
            else:
                return JsonResponse({"result": "Password did not matched!"})
        else:
            return JsonResponse(
                {"result": "This email address is not in our database"}, status=400
            )
    else:
        return JsonResponse({"result": "Post method allowed"}, status=400)


def matchUser(request):
    if "pic" in request.args:
        KEY = request.args["pic"]
    try:
        s3 = boto3.resource("s3")
        s3.Bucket(BUCKET_NAME).download_file(KEY, "matchImages/" + KEY)
        img = face_recognition.load_image_file("matchImages/" + KEY)
        encodeImg = face_recognition.face_encodings(img)[0]
        emps = Employee.objects.filter(emp_is_active=1, emp_is_delete=0)
        for emp in emps:
            if emp.emp_encoding == None:
                continue
            encoding = byt_t_arry(emp.emp_encoding)

            result = face_recognition.compare_faces(encoding, encodeImg)[0]
            if result:
                nowtime = datetime.datetime.now()
                timeTOMatch = nowtime.strftime("%H:%M:%S")
                nowdate = nowtime.strftime("%Y-%M-%d")
                emp_attendence_today = EmployeeAttendance.objects.filter(
                    ea_employee_id=emp.emp_id, ea_date=nowtime
                )
                if len(emp_attendence_today) < 1:
                    site = SiteSettings.objects.get(id=1)
                    late_attendance_time = site.late_attendance_time
                    last_attendance_time = site.last_attendance_time
                    present = "P"
                    absent = "A"
                    is_late = "0"
                    is_late1 = "1"
                    absent_reason = ""
                    currentemp = emp.emp_id
                    if timeTOMatch < late_attendance_time:
                        EmployeeAttendance.objects.create(
                            ea_employee_id=currentemp,
                            ea_checkin=nowtime,
                            ea_attendance=present,
                            ea_is_late=is_late,
                            ea_absent_reason=absent_reason,
                            ea_date=nowdate,
                        )
                        return JsonResponse(
                            {"data": "true", "msg": "Attendance Marked."}
                        )
                    elif (
                        timeTOMatch > late_attendance_time
                        and timeTOMatch <= last_attendance_time
                    ):
                        EmployeeAttendance.objects.create(
                            ea_employee_id=currentemp,
                            ea_checkin=nowtime,
                            ea_attendance=absent,
                            ea_is_late=is_late1,
                            ea_absent_reason=absent_reason,
                            ea_date=nowdate,
                        )
                        return JsonResponse(
                            {"data": "true", "msg": "Late attendance Marked."}
                        )
                    elif timeTOMatch > last_attendance_time:
                        return JsonResponse(
                            {"data": "false", "msg": "attendance time is over"}
                        )

                else:
                    return JsonResponse({"msg": "already marked"})

        return {"data": "false"}

    except botocore.exceptions.ClientError as e:
        if e.response["Error"]["Code"] == "404":
            return {"res": "The object does not exist."}

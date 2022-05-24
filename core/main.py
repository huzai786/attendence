from flask import Flask, jsonify, request, json, abort, make_response
import mysql.connector
import os
import boto3
import botocore
import hashlib
import datetime
import cv2
import face_recognition
from packages.utils import encode_auth_token, decode_auth_token


db = mysql.connector.connect(host="127.0.0.1", user="root",
                             password="0341218870703192057092", database="snap_check", port=3306)
mycursor = db.cursor()
BUCKET_NAME = 'fms-pics'
app = Flask(__name__)
app.secret_key = "secret key"
SECRET_KEY = "\xf9\xe4p(\xa9\x12\x1a!\x94\x8d\x1c\x99l\xc7\xb7e\xc7c\x86\x02MJ\xa0"
app.config['MAX_CONTENT_LENGTH'] = 1024 * 1024
app.config['UPLOAD_EXTENSIONS'] = ['.jpg', '.png', '.gif', '.jpeg']
APP_ROOT = os.path.dirname(os.path.abspath(__file__))


# RESET PASSWORD FUNCTIONS
# app.config['MAIL_SERVER'] = 'smtp@gmail.com'
# app.config['MAIL_PORT'] = 465
# app.config['MAIL_USE_SSL'] = True
# app.config['MAIL_USERNAME'] = "machoticspakistan@gmail.com"
# app.config['MAIL_PASSWORD'] = "VvNm4aFqt2%Ee^1d!1z8#%"
# mail = Mail(app)
#
# msg = Message()
# msg.subject = "Password Reset Link"
# msg.recipients = 'useremail@gmail.com'
# msg.sender = 'machoticspakistan@gmail.com'
# msg.body = 'This is ur Reset password link, rest ur password by clicking on this link.'
# mail.send(msg)


# def get_reset_token(self, expires=500):
#     return jwt.encode({'reset_password': self.username, 'exp': time() + expires}, key=os.getenv('SECRET_KEY_FLASK'))
#
#
# def send_email(user):
#     token = user.get_reset_token()
#     msg = Message()
#     msg.subject = "Flask App Password Reset"
#     msg.sender = os.getenv('MAIL_USERNAME')
#     msg.recipients = [user.email]
#     msg.html = render_template('reset_email.html', user=user, token=token)
#
# def verify_reset_token(token):
#     try:
#         username = jwt.decode(token, key=os.getenv('SECRET_KEY_FLASK'))['reset_password']
#     except Exception as e:
#         print(e)
#         return
#     return {"result": "Verify hogya"}


@app.route('/login', methods=['POST'])
def login():
    if 'username' not in request.form and 'password' not in request.form:
        abort(400)
    else:
        account = None
        username = request.form['username']
        password = hashlib.md5(
            request.form['password'].encode('UTF-8')).hexdigest()
        mycursor = db.cursor()
        mycursor.execute("""SELECT au.id, au.full_name, au.email, au.phone, ur.role_title FROM admin_users au
                            LEFT JOIN user_role ur
                                ON ur.page_id = au.user_role_id
                                    WHERE au.user_name = %s
                                        AND au.pwd = %s""", (username, password))
        account = mycursor.fetchone()
        if account == None:
            return make_response(jsonify({"result": 'Invalid username or password'})), 400
        else:
            data = {
                "full_name": account[1],
                "phone": account[3],
                "designation": account[4],
                "email": account[2],
                "emp_id": account[0]
            }
            auth_token = encode_auth_token(data)
            responseObject = {
                "status": 'success',
                "message": "Successfully logged in",
                "user_data": data,
                "auth_token": auth_token.decode()
            }
            return make_response((jsonify({"result": responseObject})))


@app.route('/users')
def getUsers():
    auth_header = request.headers.get('Authorization')
    if auth_header:
        try:
            auth_token = auth_header.split(" ")[1]
        except IndexError:
            responseObject = {
                'status': 'fail',
                'message': 'Bearer token malformed.'
            }
            return make_response(jsonify(responseObject)), 401
    else:
        auth_token = ''
    if auth_token:
        payload = decode_auth_token(auth_token)
        if not isinstance(payload, str):
            mycursor = db.cursor()
            mycursor.execute("select e.emp_id, e.emp_cnic, concat(e.emp_first_name, ' ',e.emp_last_name) from employee e "
                             "LEFT JOIN facility f ON f.facility_id = e.emp_facility_id "
                             "where e.emp_is_active = 1 AND e.emp_is_delete = 0 AND facility_supervisor_id = " + str(payload['sub']['emp_id']))
            return {"result": mycursor.fetchall()}


@app.route('/updateEncoding', methods=["GET"])
def updateEncoding():
    base_url = "https://fms-pics.s3.us-west-2.amazonaws.com/"
    target = os.path.join(APP_ROOT, 'userImages/')

    if 'emp_id' in request.args:
        emp_id = int(request.args['emp_id'])

    if 'pic' in request.args:
        KEY = request.args['pic']

    destination = base_url + KEY

    s3 = boto3.resource('s3')
    try:
        s3.Bucket(BUCKET_NAME).download_file(KEY, 'userImages/' + KEY)
        img = face_recognition.load_image_file('userImages/' + KEY)
        img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
        encodeImg = face_recognition.face_encodings(img)[0]

        lists = encodeImg.tolist()
        json_str = ';'.join([str(i) for i in lists])
        mycursor = db.cursor()
        mycursor.execute("UPDATE employee SET emp_encoding = '" +
                         json.dumps(json_str) + "' WHERE emp_id = '" + str(emp_id) + "'")
        db.commit()
        result = {
            "message": 'True',
            "status": 201
        }
        return result
    except botocore.exceptions.ClientError as e:
        if e.response['Error']['Code'] == "404":
            return {"res": "The object does not exist."}


@app.route('/matchUser', methods=["GET"])
def matchUser():
    if 'pic' in request.args:
        KEY = request.args['pic']
    try:
        s3 = boto3.resource('s3')
        s3.Bucket(BUCKET_NAME).download_file(KEY, 'matchImages/' + KEY)
        img = face_recognition.load_image_file('matchImages/' + KEY)
        encodeImg = face_recognition.face_encodings(img)[0]
        mycursor = db.cursor()
        mycursor.execute(
            "select emp_id, emp_encoding from employee WHERE emp_is_active = 1 AND emp_is_delete = 0")
        users = mycursor.fetchall()
        for emp in users:
            if emp[1] == None:
                continue
            encode = emp[1][1:-1]
            emp_encodings = list(encode.split(';'))
            ind = 0
            for i in emp_encodings:
                emp_encodings[ind] = float(emp_encodings[ind])
                ind += 1

            faceDis = face_recognition.face_distance(
                [emp_encodings], encodeImg)

            if (faceDis <= 0.54):
                nowtime = datetime.datetime.now()
                timeTOMatch = nowtime.strftime('%H:%M:%S')
                nowdate = nowtime.strftime('%Y-%M-%d')

                db = mysql.connector.connect(host="147.135.92.202", user="admin_exacthrms", password="slQ60z0wGc",
                                             database="admin_exacthrms", port=3306)
                mycursor = db.cursor()
                mycursor.execute(
                    "SELECT * FROM employee_attendance WHERE ea_employee_id = %s AND ea_date = %s", (str(emp[0]), nowdate))
                alreadyExist = mycursor.fetchall()
                if len(alreadyExist) < 1:
                    db = mysql.connector.connect(host="147.135.92.202", user="admin_exacthrms", password="slQ60z0wGc",
                                                 database="admin_exacthrms", port=3306)
                    mycursor = db.cursor()
                    mycursor.execute(
                        "SELECT late_attandance_time, last_attandance_time FROM site_settings WHERE id=1")
                    result = mycursor.fetchall()
                    late_attendance_time = str(result[0][0])
                    last_attendance_time = str(result[0][1])
                    currentemp = emp[0]
                    present = 'P'
                    absent = 'A'
                    is_late = '0'
                    is_late1 = '1'
                    absent_reason = ''

                    if timeTOMatch < late_attendance_time:
                        db = mysql.connector.connect(host="147.135.92.202", user="admin_exacthrms",
                                                     password="slQ60z0wGc",
                                                     database="admin_exacthrms", port=3306)
                        mycursor = db.cursor()
                        mycursor.execute("INSERT INTO `employee_attendance`(`ea_employee_id`,`ea_checkin`,`ea_attendance`,`ea_is_late`,"
                                         "`ea_absent_reason`,`ea_date`)VALUES(%s, %s, %s, %s, %s, %s)", (currentemp, nowtime, present, is_late, absent_reason, nowdate))
                        db.commit()
                        return {"data": "true", "msg": "Attendance Marked."}
                        # return {"data": "true", "emp_id": str(emp[0]), "name": str(emp[2])}

                    elif timeTOMatch > late_attendance_time and timeTOMatch <= last_attendance_time:
                        db = mysql.connector.connect(host="147.135.92.202", user="admin_exacthrms",
                                                     password="slQ60z0wGc",
                                                     database="admin_exacthrms", port=3306)
                        mycursor = db.cursor()
                        mycursor.execute("INSERT INTO `employee_attendance`(`ea_employee_id`,`ea_checkin`,`ea_attendance`,`ea_is_late`,"
                                         "`ea_absent_reason`,`ea_date`)VALUES(%s, %s, %s, %s, %s, %s)", (currentemp, nowtime, absent, is_late1, absent_reason, nowdate))
                        db.commit()
                        return {"data": "true", "msg": "Late attendance Marked."}
                        # return {"data": "true", "emp_id": str(emp[0]), "name": str(emp[2])}

                    elif timeTOMatch > last_attendance_time:
                        return {"data": "false", "msg": "attendance time is over"}
                else:
                    return {"msg": "already marked"}
        return {"data": "false"}
    except botocore.exceptions.ClientError as e:
        if e.response['Error']['Code'] == "404":
            return {"res": "The object does not exist."}


@app.route('/changePassword', methods=['POST'])
def changePassword():
    if request.method == 'POST':
        username = request.form['username']
        oldPassword = hashlib.md5(
            request.form['oldPassword'].encode('UTF-8')).hexdigest()
        NewPassword = hashlib.md5(
            request.form['password'].encode('UTF-8')).hexdigest()
        mycursor = db.cursor()
        result = mycursor.execute(
            "SELECT * FROM admin_users WHERE email = %s", [username])
        if result != 0:
            user = mycursor.fetchone()
            userpassword = user[2]
            if userpassword == oldPassword:
                db = mysql.connector.connect(host="147.135.92.202", user="admin_exacthrms", password="slQ60z0wGc",
                                             database="admin_exacthrms", port=3306)
                mycursor = db.cursor()
                mycursor.execute(
                    "UPDATE admin_users SET pwd = %s WHERE email = %s", (NewPassword, username))
                db.commit()
                mycursor.close()
                return {"result": 'Password has been successfully changed'}
            else:
                return {"result": "Sorry Password didnt match, try again with correct password."}
        return {"result": "This email address is not in our database"}
    return {"result": False}


@app.route('/addReplacement', methods=['GET'])
def addReplacement():
    if request.method == 'GET':
        imgKey = request.args['key']
        firstName = request.args['firstName']
        lastName = request.args['lastName']
        cnicNumber = request.args['cnicNumber']
        dailyWage = request.args['dailyWage']
        designation = request.args['designation']
        shift = request.args['shift']
        shiftTiming = request.args['shiftTiming']
        phone = request.args['phone']

        mycursor.execute("INSERT INTO `temp_employees`(`te_first_name`, `te_last_name`,`te_cnic`, `te_designation`, `te_shift`, "
                         "`te_shift_timing`, `te_phone`, `te_image`, `te_salary`) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)",
                         (firstName, lastName, cnicNumber, designation, shift, shiftTiming, phone, imgKey, dailyWage))
        db.commit()
        return {"result": "Data inserted"}
    else:
        return {"result": "data not entered in database"}


# RESET PASSWORD
# @app.route('/resetPassword', methods=['GET'])
# def resetPassword():
#     if request.method == 'GET':
#         email = request.args['email']
#
#         mycursor = db.cursor()
#         result = mycursor.execute("SELECT * FROM admin_users WHERE email = %s", [email])
#         if result != 0:
#             user = mycursor.fetchone()
#             useremail = user[5]
#             token = uuid.uuid4().hex.upper()
#             mycursor.execute("UPDATE admin_users SET activation_key = %s WHERE email = %s",(token,useremail))
#             db.commit()
#
#
#
#             msg = Message()
#             msg.subject = "Password Reset Link"
#             msg.recipients = [useremail]
#             msg.sender = 'machoticspakistan@gmail.com'
#             msg.body = 'This is ur Reset password link, rest ur password by clicking on this link.'
#             Thread(target=send_email, args=(app, msg)).start()
#             mail.send(msg)
#
#
#             link = url_for('conf_email', token=token, _external=True)
#             msg.body = render_template('sentmail.html', token=token, link=link)
#             mail.send(msg)
#             flash('Link sent to your Email')
#             return True
#         else:
#             msg = Message(subject='Password Reset', sender='machoticspakistan@gmail.com',
#                           recipients=[request.args['email']])
#             msg.body = "This email does not exist in our system, " \
#                        "if you not the one who entered this mail ignore this message"
#             mail.send(msg)
#             flash('Email does not exist or wrong username or password!', 'danger')
#             return False
#
#
#     return {"result": "if CONDITION DO NOT WORK"}


if __name__ == '__main__':
    app.run()

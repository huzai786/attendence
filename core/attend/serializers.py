from rest_framework import serializers
from .models import Facility, EmployeeFacility, EmployeeAttendance, Employee, AdminUsers, TempEmployees


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = AdminUsers
        fields = ['id', 'fullname', 'email', 'phone', 'role_title']


class TempEmployeesSerializer(serializers.ModelSerializer):
    class Meta:
        model = TempEmployees
        fields = ['te_first_name', 'te_last_name', 'te_cnic', 'te_designation', 'te_shift', 
                  'te_shift_timing', 'te_phone', 'te_image', 'te_salary']
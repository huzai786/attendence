from django.contrib import admin
from .models import (
    Employee,
    EmployeeAttendance,
    EmployeeFacility,
    Facility,
    UserRole
)

admin.site.register(Employee)
admin.site.register(EmployeeAttendance)
admin.site.register(EmployeeFacility)
admin.site.register(Facility)
admin.site.register(UserRole)




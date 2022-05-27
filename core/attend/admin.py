from django.contrib import admin
from django.contrib.auth.models import Group
from .models import (
    Employee,
    EmployeeAttendance,
    EmployeeFacility,
    Facility,
    UserRole,
    AdminUsers,
    SiteSettings
)


admin.site.register(Employee)
admin.site.register(EmployeeAttendance)
admin.site.register(EmployeeFacility)
admin.site.register(Facility)
admin.site.register(UserRole)
admin.site.unregister(Group)
admin.site.register(AdminUsers)
admin.site.register(SiteSettings)
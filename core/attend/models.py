from django.db import models
# from django.contrib.auth.models import AbstractUser

# class CustomUser(AbstractUser):
#     emp_id = models.CharField(primary_key=True, max_length=200)
#     email = models.EmailField(null=True, blank=True)
#     designation = models.CharField(null=True, blank=True, max_length=200) 
#     phone = models.CharField(null=True, blank=True, max_length=200)

#     def __str__(self):
#         return str(self.emp_id)

class addReplacement(models.Model):
    imgKey = models.URLField(null=True, blank=True)
    firstName = models.CharField(null=True, blank=True, max_length=200)
    lastName = models.CharField(null=True, blank=True, max_length=200)
    cnicNumber = models.IntegerField(null=True, blank=True)
    dailyWage = models.IntegerField(null=True, blank=True)
    designation = models.CharField(null=True, blank=True, max_length=200)
    shift = models.CharField(null=True, blank=True, max_length=200)
    shiftTiming = models.CharField(null=True, blank=True, max_length=200)
    phone = models.IntegerField(null=True, blank=True)

    def __str__(self):
        return str(self.firstName + self.lastName)

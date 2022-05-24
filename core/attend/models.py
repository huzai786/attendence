from django.db import models




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

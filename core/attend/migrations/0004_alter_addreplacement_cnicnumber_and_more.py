# Generated by Django 4.0.3 on 2022-05-25 08:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('attend', '0003_alter_addreplacement_cnicnumber_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addreplacement',
            name='cnicNumber',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='addreplacement',
            name='firstName',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='addreplacement',
            name='imgKey',
            field=models.URLField(),
        ),
        migrations.AlterField(
            model_name='addreplacement',
            name='phone',
            field=models.IntegerField(),
        ),
    ]
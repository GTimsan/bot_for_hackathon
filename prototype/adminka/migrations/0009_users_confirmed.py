# Generated by Django 3.2 on 2022-08-16 22:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminka', '0008_alter_users_group'),
    ]

    operations = [
        migrations.AddField(
            model_name='users',
            name='confirmed',
            field=models.BooleanField(default=False, null=True, verbose_name='Подтвержден'),
        ),
    ]

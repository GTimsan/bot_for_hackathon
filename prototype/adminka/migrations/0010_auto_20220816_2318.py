# Generated by Django 3.2 on 2022-08-16 23:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('adminka', '0009_users_confirmed'),
    ]

    operations = [
        migrations.RenameField(
            model_name='bookings',
            old_name='object_id',
            new_name='object',
        ),
        migrations.RenameField(
            model_name='bookings',
            old_name='user_id',
            new_name='user',
        ),
        migrations.RenameField(
            model_name='objects',
            old_name='campus_id',
            new_name='campus',
        ),
        migrations.RenameField(
            model_name='users',
            old_name='campus_id',
            new_name='campus',
        ),
    ]

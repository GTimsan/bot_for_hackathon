# Generated by Django 3.2 on 2022-08-16 10:51

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('group', models.CharField(max_length=100, verbose_name='Группа')),
                ('school_login', models.CharField(max_length=100, verbose_name='Логин в школе')),
                ('username', models.CharField(max_length=100, verbose_name='Username в Telegram')),
                ('phone_number', models.CharField(max_length=100, verbose_name='Номер телефона')),
                ('telegram_id', models.BigIntegerField(default=1, unique=True, verbose_name='ID Пользователя в Telegram ')),
                ('campus_id', models.IntegerField(verbose_name='ID Кампуса')),
            ],
            options={
                'verbose_name': 'Пользователя',
                'verbose_name_plural': 'Пользователи',
            },
        ),
    ]

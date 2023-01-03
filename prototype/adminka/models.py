from django.db import models
from django.template.defaultfilters import truncatechars

class Campuses(models.Model):
    class Meta:
        verbose_name = "Кампус"
        verbose_name_plural = "Кампусы"
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100, null=True, verbose_name="Название")

    def __str__(self):
        return f"ID{self.id} ({self.name})"


class Users(models.Model):
    class Meta:
        verbose_name = "Пользователя"
        verbose_name_plural = "Пользователи"
        
    GROUP = (
        ('1', "Гость"),
        ('2', "Абитуриент"),
        ('3', "Студент"),
        ('4', "Саппорт"),
        ('5', "Админушка"),
    )

    id = models.AutoField(primary_key=True)
    group = models.CharField(max_length=3, choices=GROUP, default='1', null=True, verbose_name="Группа")
    school_login = models.CharField(max_length=100, null=True, verbose_name="Логин в школе")
    full_name = models.CharField(max_length=100, null=True, verbose_name="Fullname в Telegram")
    username = models.CharField(max_length=100, verbose_name="Username в Telegram")
    phone_number = models.CharField(max_length=100, null=True, verbose_name="Номер телефона")
    confirmed = models.BooleanField(null=True, default=False, verbose_name="Подтвержден")
    telegram_id = models.BigIntegerField(unique=True, default=1, verbose_name="ID Пользователя в Telegram ")
    campus = models.ForeignKey(Campuses, on_delete=models.SET(0), null=True, verbose_name="ID Кампуса")
    
    def __str__(self):
        return f"ID{self.id} ({self.school_login} {self.phone_number})"
    

class ObjectTypes(models.Model):
    class Meta:
        verbose_name = "Тип Объекта"
        verbose_name_plural = "Типы объекта"

    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100, null=True, verbose_name="Название типа объекта")
    campus = models.ForeignKey(Campuses, on_delete=models.SET(0), null=True, verbose_name="ID Кампуса")
    def __str__(self):
        return f"ID{self.id} ({self.name})"

class Objects(models.Model):
    class Meta:
        verbose_name = "Объект"
        verbose_name_plural = "Объекты"

    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100, null=True, verbose_name="Название")
    object_type = models.ForeignKey(ObjectTypes, on_delete=models.SET(0), max_length=100, null=True, verbose_name="Тип")
    desc = models.CharField(max_length=500, null=True, verbose_name="Описание")
    image = models.CharField(max_length=200, null=True, default="no", verbose_name="Картинка")
    floor = models.IntegerField(null=True, verbose_name="Этаж'")
    room_number = models.IntegerField(null=True, verbose_name="Номер комнаты")
    campus = models.ForeignKey(Campuses, on_delete=models.SET(0), null=True, verbose_name="ID Кампуса")

    @property
    def short_description(self):
        return truncatechars(self.desc, 15)
    def short_image(self):
        return truncatechars(self.image, 15)

    def __str__(self):
        return f"ID{self.id} ({self.name})"


class Bookings(models.Model):
    class Meta:
        verbose_name = "Бронирование"
        verbose_name_plural = "Бронирование"
    STATUS = (
        ('1', "Занят"),
        ('2', "Свободен"),
        ('3', "Недоступен"),
    )

    id = models.AutoField(primary_key=True)
    status = models.CharField(max_length=3, null=True, choices=STATUS, default='1', verbose_name="Статус")
    start_time = models.DateTimeField(null=True, verbose_name="Время начала")
    fin_time = models.DateTimeField(null=True, verbose_name="Время окончания")
    user = models.ForeignKey(Users, on_delete=models.SET(0), null=True, verbose_name="ID пользователя")
    object = models.ForeignKey(Objects, on_delete=models.SET(0), null=True, verbose_name="ID объекта")
    campus = models.ForeignKey(Campuses, on_delete=models.SET(0), null=True, verbose_name="ID Кампуса")
    # def __unicode__(self):
    #         return "%s (%s : %s)" % (self.title, self.start_time.strftime('%m/%d/%Y'), self.fin_time)
    def __str__(self):
        return f"ID{self.id} ({self.status} - {self.user_id} - {self.object_id} - {self.start_time} - {self.fin_time} - {self.campus})"






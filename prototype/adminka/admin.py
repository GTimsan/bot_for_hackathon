from django.contrib import admin

# Register your models here.
from .models import Users, Bookings, Objects, Campuses, ObjectTypes
from django.conf.locale.es import formats as es_formats


es_formats.DATETIME_FORMAT = "d M Y H"
admin.site.site_header = 'School_21 Super Booking Bot'


@admin.register(Bookings)
class BookingsAdmin(admin.ModelAdmin):
    list_display = ("id", "status", "object", "user", "start_time", "fin_time", "campus")
    list_filter = ("status", "campus", "object", "user", "start_time")
    search_fields = ("user", "object", "id", "start_time",)
    list_display_links = ("status", "id", "object") # при нажатии проваливаемся внутрь объекта

@admin.register(Users)
class UsersAdmin(admin.ModelAdmin):
    list_display = ("id", "group", "school_login", "phone_number", "campus", "full_name", "confirmed")
    list_display_links = ("id", "group", "school_login")
    list_filter = ("confirmed", "group", "campus")
    
@admin.register(Objects)
class ObjectsAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "object_type", "short_description", "campus", "short_image")
    list_display_links = ("name", "short_description")
    list_filter = ("object_type", "campus")

@admin.register(Campuses)
class CampusesAdmin(admin.ModelAdmin):
    list_display = ("id", "name")

@admin.register(ObjectTypes)
class ObjectTypesAdmin(admin.ModelAdmin):
    list_display_links = ("name",)
    list_display = ("id", "name", "campus")

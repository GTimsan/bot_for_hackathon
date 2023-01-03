from django.urls import path
from . import views


urlpatterns = [
    path('', views.campuses_list, name="campuses"),
    path('type/<int:campus_id>', views.chooce_type, name="chooce_type"),
    path('chooce_object/<int:type_id>/<int:campus_id>', views.chooce_object, name="chooce_object"),
    path('chooce_time/<int:object_id>', views.chooce_time, name="chooce_time"),
    path('campus/<int:campus_id>', views.campus, name="campus"),
    path('ajax_url', views.ajax, name='ajax'),
    path('forajax', views.forajax, name='forajax'),
    # path('obgects',views.objects_list, name="obgects"),
    # path('uitel',views.uitel, name="uitel"),

]
from gc import get_objects
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect, HttpResponsePermanentRedirect
from adminka.models import Bookings, Campuses, ObjectTypes, Objects, Users
from .forms import BookingsForm
# # Create your views here.

# # Create your views here.
def objects_list(request):
    objects = Objects.objects.all()
    return render(request, 'webui/objects_list.html', {'objects': objects})

def uitel(request):
    return render(request, 'webui/uitel.html')

def campuses_list(request):
    campuses = Campuses.objects.all()
    return render(request, 'webui/campuses_list.html', {'campuses': campuses})

def campus(request, campus_id):
    campus = get_object_or_404(Campuses, pk=campus_id)
    objects = Objects.objects.filter(campus_id_id=campus_id)
    return render(request, 'webui/campus.html', { 'campus': campus, 'objects': objects})

def chooce_type(request, campus_id):
    types_object = ObjectTypes.objects.filter(campus_id=campus_id)
    return render(request, 'webui/chooce_type.html', { 'campus': campus, 'types_object': types_object})

def chooce_object(request, type_id, campus_id):
    type_object = ObjectTypes.objects.get(pk=type_id)
    objects = Objects.objects.raw('SELECT * FROM adminka_objects WHERE object_type_id=%s AND campus_id=%s', [type_id, campus_id])
    return render(request, 'webui/chooce_object.html', {'type_object': type_object, 'objects': objects})

def chooce_time(request, object_id):
    selected_object = get_object_or_404(Objects, pk=object_id)
    # campus = get_object_or_404(Campuses, pk=selected_object.campus)
    if request.method == 'POST':
        form = BookingsForm(request.POST)
        if form.is_valid():
            booking = form.save(commit=False)
            booking.status = 1
            booking.campus = selected_object.campus
            booking.school_login = 'site'
            booking.full_name = 'site'
            booking.phone_number = 'site'
            booking.confirmed = 'site'
            booking.telegram_id = 'site'
            booking.telegram_id = 'site'

            #Пока удалил дату публикации чтобы создать черновик
            # post.published_date = timezone.now()
            booking.save()
            return redirect('')
    form = BookingsForm()
    return render(request, 'webui/chooce_time.html', { 'object': selected_object, 'form': form})

# def bookings(request, object_id):
#     # campus = get_object_or_404(Campuses, pk=campus_id)
#     objects = Objects.objects.filter(campus_id_id=campus_id)
#     booking = Bookings.objects.filter(object_id=object_id)
# #     return render(request, 'webui/campus.html', { 'campus': campus, 'objects': objects})

# def post_new(request):
#     if request.method == 'POST':
#         form = PostForm(request.POST)
#         if form.is_valid():
#             post = form.save(commit=False)
#             post.author = request.user
#             #Пока удалил дату публикации чтобы создать черновик
#             # post.published_date = timezone.now()
#             post.save()
#             return redirect('post_detail', pk = post.pk)
#     form = PostForm()
#     return render(request, 'blog/post_new.html', {'form': form})

def ajax(request):
    return HttpResponse('<p>Here will be your HTML page</p>')

def forajax(request):
    return render(request, 'webui/forajax.html')
    
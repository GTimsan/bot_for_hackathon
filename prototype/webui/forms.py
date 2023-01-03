from django import forms

from adminka.models import Bookings

class BookingsForm(forms.ModelForm):

    class Meta:
        model = Bookings
        fields = ('start_time', 'fin_time')
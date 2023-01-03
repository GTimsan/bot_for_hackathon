# from .booking_kb import clock_smile
import pytest

def clock_smile(time):
    if time in ["12:00", "0:00"]:
        img = "🕛"
    elif time in ["12:30", "0:30"]:
        img = "🕧"
    elif time in ["13:00", "1:00"]:
        img = "🕐"
    elif time in ["13:30", "1:30"]:
        img = "🕜"
    elif time in ["14:00", "2:00"]:
        img = "🕑"
    elif time in ["14:30", "2:30"]:
        img = "🕝"
    elif time in ["15:00", "3:00"]:
        img = "🕒"
    elif time in ["15:30", "3:30"]:
        img = "🕞"
    elif time in ["16:00", "4:00"]:
        img = "🕓"
    elif time in ["16:30", "4:30"]:
        img = "🕟"
    elif time in ["17:00", "5:00"]:
        img = "🕔"
    elif time in ["17:30", "5:30"]:
        img = "🕠"
    elif time in ["18:00", "6:00"]:
        img = "🕕"
    elif time in ["18:30", "6:30"]:
        img = "🕡"
    elif time in ["19:00", "7:00"]:
        img = "🕖"
    elif time in ["19:30", "7:30"]:
        img = "🕢"
    elif time in ["20:00", "8:00"]:
        img = "🕗"
    elif time in ["20:30", "8:30"]:
        img = "🕣"
    elif time in ["21:00", "9:00"]:
        img = "🕘"
    elif time in ["21:30", "9:30"]:
        img = "🕤"
    elif time in ["22:00", "10:00"]:
        img = "🕙"
    elif time in ["22:30", "10:30"]:
        img = "🕥"
    elif time in ["23:00", "11:00"]:
        img = "🕚"
    elif time in ["23:30", "11:30"]:
        img = "🕦"
    return img

@pytest.mark.parametrize("time, rezult", [("12:00", "🕛"), ("12:30", "🕧"), ("1:00", "🕐")])
def test_clock(time, rezult):
  assert clock_smile(time) == rezult


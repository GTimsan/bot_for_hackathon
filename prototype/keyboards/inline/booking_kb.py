from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton
from loader import db
import datetime
from utils.logging import logging


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

NSK_TIME = datetime.timedelta(hours=0)

def time_until_end_of_day(dt=None):
    NSK_TIME = datetime.timedelta(hours=0)
    if dt is None:
        dt = datetime.datetime.now() + NSK_TIME
    tomorrow = dt + datetime.timedelta(days=1)
    return datetime.datetime.combine(tomorrow, datetime.time.min) - dt


async def booking_keyboard_gen(objects: list, flag):
    main_keyboard = InlineKeyboardMarkup(row_width=2)
    list_buttons = []
    for object in objects:
        text = object["name"]
        if flag == 1:
            callback = "choice_type_" + str(object["id"])
        else:
            object_type = object["object_type_id"]
            callback = "choice_object_" + str(object["id"])
        button = InlineKeyboardButton(text=text, callback_data=callback)
        list_buttons.append(button)
        
    main_keyboard.add(*list_buttons)
    if flag == 1:
        back_button = InlineKeyboardButton(text="Вернуться в меню ↩️",
                                            callback_data="menu_menu")
    elif flag == 2:
        back_button = InlineKeyboardButton(text="Назад ↩️",
                                            callback_data="booking")
    main_keyboard.add(back_button)

    return main_keyboard

async def main_booking_keyboard(object_id: str, booking_list: list, user_id, book_date=None):
    main_keyboard = InlineKeyboardMarkup(row_width=4)
    check_list = []
    self_list = []
    for i in range(len(booking_list)):
        if user_id == booking_list[i]["user_id"]:
            x = ':'.join(str(booking_list[i]["start_time"]).split(' ')[1].split(':')[:2])
            if x[0] == '0':
                x = x[1:]
            self_list.append(x)
        y = ':'.join(str(booking_list[i]["start_time"]).split(' ')[1].split(':')[:2])
        if y[0] == '0':
            y = y[1:]
        check_list.append(y)

    if book_date:
        step_count = 48
        fifnished = datetime.timedelta(days=0)

    else:
        left = time_until_end_of_day()
        tdelta_30min = datetime.timedelta(minutes=30)
        step_count = left // tdelta_30min
        remainder = left % tdelta_30min
        rounded = left - remainder
        fifnished = datetime.timedelta(days=1) - rounded
    
    buttons = []
    # logging.info(self_list)
    # logging.info(check_list)
    # logging.info(fifnished)
    
    for i in range(step_count):
        after_split = ':'.join(str(fifnished).split(':')[:2])
        # logging.info(after_split)
        if book_date:
            call_data = "super_" + object_id + "_" + after_split + "_" + str(book_date).split(' ')[0]
        else:
            call_data = "reserv_" + object_id + "_" + after_split
        if after_split in self_list:
            after_split += "🔰"
            call_data += "_self" 
        elif after_split in check_list:
            after_split += "🛑"
            call_data += "_stop"
        else:
            img = clock_smile(after_split)
            after_split += img
        button = InlineKeyboardButton(text=after_split, callback_data=call_data)
        fifnished += datetime.timedelta(minutes=30)
        buttons.append(button)
        
    calendar_image = [InlineKeyboardButton(text="🗓 Календарь", callback_data="calendar_" + str(object_id)), \
                      InlineKeyboardButton(text="🏞 Изображение", callback_data="image_object_" + object_id)]
    object = await db.get_object_by_id(int(object_id))
    
    back_button = InlineKeyboardButton(text="Назад ↩️",
                                    callback_data="choice_type_" + str(object["object_type_id"]))

    main_keyboard.add(*buttons).row(*calendar_image).add(back_button)
    campus = await db.get_campus_by_id(object["campus_id"])
    type = await db.get_type_by_id(object["object_type_id"])

    type = type["name"]
    campus = campus["name"]
    name = object["name"] 
    desc = object["desc"]
    floor = object["floor"]
    room_number = object["room_number"]
    text = f'┌ 🔊 Информация об объекте: <b>{name}</b>\n' \
           f'├ 📍 Тип: <b>{type}</b>\n' \
           f'├ 📝 Описание: <b>{desc}</b>\n' \
           f'├  🧗‍♂️Этаж: <b>{floor}</b>\n' \
           f'├ 🚪 Номер комнаты: <b>{room_number}</b>\n' \
           f'└ 🏪 Кампус: <b>{campus}</b>\n' \

    return text, main_keyboard

from unicodedata import name
from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton
# from keyboards.inline.booking_kb import clock_smile
from loader import db
from utils.logging import logging


async def my_bookings_key_gen(bookings: list):
    
    my_bookings_keyboard = InlineKeyboardMarkup(row_width=1)
    for i in range(len(bookings)):
        object_id = bookings[i]["object_id"]
        booking_id = bookings[i]["id"]
        obj = await db.get_object_by_id(object_id)
        name = obj["name"]
        start_date = bookings[i]["start_time"].strftime('%d-%m-%Y')
        start_time = bookings[i]["start_time"].strftime('%H:%M')
        text = f"{name} 📆{start_date} 🕗{start_time}"
        button = InlineKeyboardButton(text=text, callback_data="заглушка")
        my_bookings_keyboard.add(button)
        del_button = InlineKeyboardButton(text="❌ Отменить бронирование ⬆️",
                                          callback_data="book_delete_" + str(booking_id))
        my_bookings_keyboard.add(del_button)
    back_button = InlineKeyboardButton(text="Вернуться в меню ↩️",
                                        callback_data="menu_menu")
    my_bookings_keyboard.add(back_button)
    return my_bookings_keyboard


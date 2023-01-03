from loader import dp, db
from aiogram import types
from keyboards.inline.my_bookings_kb import my_bookings_key_gen
from utils.logging import logging
from datetime import datetime, date, time, timedelta


@dp.callback_query_handler(text=["my_booking", "заглушка"])
async def my_booking(call: types.CallbackQuery):
    user = await db.select_user(telegram_id=call.from_user.id)
    bookings = await db.select_for_my_bookings(user["id"])
    text = "📎 Ваши бронирования: "
    await call.answer()
    await call.message.edit_text(text=text, reply_markup=await my_bookings_key_gen(bookings))
    
@dp.callback_query_handler(text_contains="book_delete_")
async def my_booking(call: types.CallbackQuery):
    booking_id = call.data.split('_')[2]
    await db.del_booking_by_id(int(booking_id))
    text = "📎 Ваши бронирования:: "
    await call.answer()
    user = await db.select_user(telegram_id=call.from_user.id)
    bookings = await db.select_for_my_bookings(user["id"])
    await call.message.edit_text(text=text, reply_markup=await my_bookings_key_gen(bookings))

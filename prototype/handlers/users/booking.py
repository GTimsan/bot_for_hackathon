from loader import dp, db
from aiogram import types
# from aiogram.dispatcher.filters import Text
from keyboards.inline.booking_kb import booking_keyboard_gen, main_booking_keyboard, NSK_TIME
from utils.logging import logging
from datetime import datetime, date, time, timedelta


@dp.callback_query_handler(text="booking")
async def main_menu(call: types.CallbackQuery):
    flag = 1
    user = await db.select_user(telegram_id=call.from_user.id)
    object_types = await db.get_types_by_campus(user["campus_id"])
    # logging.info(call.data)
    # logging.info("33333333333333")
    # logging.info(object_types[0]["name"])
    # await call.message.answer(object_types[0])
    # await db.update_campus(telegram_id=call.from_user.id, campus_id=campus_id)
    # text = "⚠️ Вы можете продолжить пользоваться ботом как гость или зарегистрироваться ⚠️\
    # Для пользователей без регистарции, доступна бронь всего на 🕥 30 минут, студенты после регистрации получают возможность бронировать на 🕝 120 минут"
    # group = await db.get_user_group(call.from_user.id)
    text = "🔍 Выберите тип объекта для бронирования 📚"
    await call.message.edit_text(text=text, reply_markup=await booking_keyboard_gen(object_types, flag=flag))


@dp.callback_query_handler(text_contains="choice_type_")
async def main_menu(call: types.CallbackQuery):
    flag = 2
    # logging.info(call.data)
    # logging.info("222222222222222222")
    object_type_id = int(call.data.split('_')[2])
    user = await db.select_user(telegram_id=call.from_user.id)
    objects = await db.get_objects(object_type_id=object_type_id, campus_id=user["campus_id"])

    text = "🔍 Выберите объект для бронирования"

    await call.message.edit_text(text=text, reply_markup=await booking_keyboard_gen(objects, flag=flag))


@dp.callback_query_handler(text_contains="choice_object_")
async def main_menu(call: types.CallbackQuery):
    object_id = int(call.data.split('_')[2])
    user = await db.select_user(telegram_id=call.from_user.id)
    booking_list = await db.select_all_bookings_objects(object_id=object_id, status='1')
    text, markup = await main_booking_keyboard(object_id=str(object_id),
                                         booking_list=booking_list,
                                         user_id=user["id"])
    await call.message.edit_text(text=text, reply_markup=markup)

@dp.callback_query_handler(text_contains="extra_object_")
async def main_menu(call: types.CallbackQuery):
    object_id = int(call.data.split('_')[2])
    user = await db.select_user(telegram_id=call.from_user.id)
    booking_list = await db.select_all_bookings_objects(object_id=object_id, status='1')
    text, markup = await main_booking_keyboard(object_id=str(object_id),
                                         booking_list=booking_list,
                                         user_id=user["id"])
    await call.message.answer(text=text, reply_markup=markup)
    await call.message.delete()
    
@dp.callback_query_handler(text_contains="reserv_")
async def main_menu(call: types.CallbackQuery):
    string_time = call.data.split('_')[2]
    user = await db.select_user(telegram_id=call.from_user.id)
    object_id = int(call.data.split('_')[1])
    start_time = datetime.strptime(str(datetime.now() + NSK_TIME).split(' ')[0] + string_time, "%Y-%m-%d%H:%M")
    fin_time = start_time + timedelta(minutes=30)
    logging.info(call.data)
    # logging.info(00000000000000000000000000000)

    if len(call.data.split('_')) == 4:
        if call.data.split('_')[3] == "stop":
            await call.answer("📢 Это время занято ⛔️", show_alert=True)
        elif call.data.split('_')[3] == "self":
            await db.del_booking(start_time=start_time,
                                 user_id=user["id"],
                                 object_id=object_id,
                                 campus_id=user["campus_id"])
            await call.answer("📢 Ваша бронь удалена ✅")
            booking_list = await db.select_all_bookings_objects(object_id=object_id, status='1')
            text, markup = await main_booking_keyboard(object_id=str(object_id),
                                                                     booking_list=booking_list,
                                                                     user_id=user["id"])
            await call.message.edit_text(text=text, reply_markup=markup)

    elif len(call.data.split('_')) == 3:
        await db.add_booking(start_time=start_time,
                            fin_time=fin_time,
                            user_id=user["id"],
                            object_id=object_id,
                            campus_id=user["campus_id"])

        booking_list = await db.select_all_bookings_objects(object_id=object_id, status='1')
        text, markup = await main_booking_keyboard(object_id=str(object_id),
                                                   booking_list=booking_list,
                                                   user_id=user["id"])
        await call.message.edit_text(text=text, reply_markup=markup)


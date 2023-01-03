from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton, ReplyKeyboardMarkup, Message, CallbackQuery
from loader import dp, db
# from loader import db
from utils.lib_calendar import calendar_callback, SimpleCalendar
from aiogram.dispatcher.filters import Text
from utils.logging import logging
from keyboards.inline.booking_kb import booking_keyboard_gen, main_booking_keyboard, NSK_TIME
from keyboards.inline.menu_kb import menu_keyboard_gen
import datetime

start_kb = ReplyKeyboardMarkup(resize_keyboard=True,)
start_kb.row('Navigation Calendar', 'Dialog Calendar')

# starting bot when user sends `/start` command, answering with inline calendar
# @dp.message_handler(commands=["calendar"])
@dp.callback_query_handler(text_contains="calendar_")
async def cmd_start(call: CallbackQuery):
    logging.info(call)
    logging.info(11111111111111111111111)

    object_id=call.data.split('_')[1]
    # await call.message.edit('Pick a calendar', reply_markup=start_kb)
    await call.message.edit_text("🗓 Выберите интересующую вас дату:", reply_markup=await SimpleCalendar().start_calendar(object_id))


# @dp.message_handler(Text(equals=['Navigation Calendar'], ignore_case=True))
# async def nav_cal_handler(message: Message):
#     await message.answer("Please select a date: ", reply_markup=await SimpleCalendar().start_calendar())


# simple calendar usage
@dp.callback_query_handler(calendar_callback.filter())
async def process_simple_calendar(call: CallbackQuery, callback_data: dict):
    selected, date = await SimpleCalendar().process_selection(call, callback_data)
    logging.info(call)
    logging.info(callback_data)
    logging.info(22222222222222222222222)
    # logging.info(type(date))
    # str(date).split(' ')[0]
    user = await db.select_user(telegram_id=call.from_user.id)
    object_id = callback_data.get("object_id")
    # logging.info(booking_list)
    
    
    if selected:
        logging.info(33333333333333333333333333)

        booking_list = await db.bookings_by_date(date=str(date).split(' ')[0],
                                                object_id=int(object_id)) # функцию дописать по дате будет чекать
        # logging.info(date)
        # logging.info("111111")
        # logging.info(callback_data)
        
        # test = test
        text, markup = await main_booking_keyboard(object_id=object_id,
                                                    booking_list=booking_list,
                                                    user_id=user["id"],
                                                    book_date=date)
        await call.message.edit_text(text=text, reply_markup=markup)
        
        # await call.message.answer(text="fsdfsdfsdf", reply_markup=await menu_keyboard_gen(group='1'))
        #     f'You selected {date.strftime("%d/%m/%Y")}',
        #     # reply_markup=start_kb
        # )
        # r"(\d+.*?\d+.*?\d+)"

@dp.callback_query_handler(text_contains="super_")
async def process_calendar(call: CallbackQuery):

    # logging.info(call.data)
    
    object_id = int(call.data.split('_')[1])
    cal_time = call.data.split('_')[3]
    timt_time = call.data.split('_')[2]
    user = await db.select_user(telegram_id=call.from_user.id)
    
    
    cal_date = datetime.datetime.strptime(cal_time + " 00:00", "%Y-%m-%d %H:%M")
    # logging.info(cal_date)
    # logging.info(" 222222222222")
    start_time = datetime.datetime.strptime(cal_time + timt_time, "%Y-%m-%d%H:%M")
    fin_time = start_time + datetime.timedelta(minutes=30)
    
    if len(call.data.split('_')) > 4:
        if call.data.split('_')[4] == "stop":
            await call.answer("📢 Это время занято ⛔️", show_alert=True)
        elif call.data.split('_')[4] == "self":
            await db.del_booking(start_time=start_time,
                        user_id=user["id"],
                        object_id=object_id,
                        campus_id=user["campus_id"])
            await call.answer("📢 Ваша бронь удалена ✅")
            booking_list = await db.bookings_by_date(date=cal_time,
                                                    object_id=int(object_id))
            text, markup = await main_booking_keyboard(object_id=str(object_id),
                                                        booking_list=booking_list,
                                                        user_id=user["id"],
                                                        book_date=cal_date)
            await call.message.edit_text(text=text, reply_markup=markup)

    elif len(call.data.split('_')) == 4:
        await db.add_booking(start_time=start_time,
                    fin_time=fin_time,
                    user_id=user["id"],
                    object_id=object_id,
                    campus_id=user["campus_id"])

        booking_list = await db.bookings_by_date(date=cal_time,
                                                object_id=int(object_id))
        text, markup = await main_booking_keyboard(object_id=str(object_id),
                                                    booking_list=booking_list,
                                                    user_id=user["id"],
                                                    book_date=cal_date)
        await call.message.edit_text(text=text, reply_markup=markup)
# @dp.inline_handler(regexp=r"[0-9a-zA-Z ]{3,}")
# @dp.callback_query_handler(calendar_callback.filter(), text_contains="2022")
# # @dp.callback_query_handler(regexp=r"[\d+\-*?\d+\-*?\d+]")
# async def process_calendar(call: CallbackQuery, callback_data: dict):
#         logging.info("salam")
    
#         logging.info(call.data)
#         logging.info(callback_data)
        
    
    # text, markup = await main_booking_keyboard(object_id=object_id,
    #                                             booking_list=booking_list,
    #                                             user_id=call.from_user.id,
    #                                             book_date=date)
    # await call.message.answer(text=text, markup=markup)

# @dp.message_handler(Text(equals=['Dialog Calendar'], ignore_case=True))
# async def simple_cal_handler(message: Message):
#     await message.answer("Please select a date: ", reply_markup=await DialogCalendar().start_calendar())


# # dialog calendar usage
# @dp.callback_query_handler(dialog_cal_callback.filter())
# async def process_dialog_calendar(callback_query: CallbackQuery, callback_data: dict):
#     selected, date = await DialogCalendar().process_selection(callback_query, callback_data)
#     if selected:
#         await callback_query.message.answer(
#             f'You selected {date.strftime("%d/%m/%Y")}',
#             # reply_markup=start_kb
#         )

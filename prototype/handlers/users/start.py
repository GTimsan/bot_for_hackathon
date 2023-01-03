import asyncpg
from aiogram import types
from aiogram.dispatcher.filters.builtin import CommandStart
from keyboards.inline.start_kb import city_choice
from keyboards.inline.menu_kb import menu_keyboard_gen
from loader import dp, db


# @dp.message_handler(commands="start")
@dp.message_handler(CommandStart())
async def bot_start(message: types.Message):
    try:
        if message.from_user.username is None:
            username = "Username"
        else:
            username = message.from_user.username

        user = await db.add_user(
            full_name=message.from_user.full_name,
            username=username,
            telegram_id=message.from_user.id,
            group="1"
        )
    # id_text = user["id"]
    except asyncpg.exceptions.UniqueViolationError:
        user = await db.select_user(telegram_id=message.from_user.id)
        print("не добавил")

    await message.answer(text="Выберите ваш кампус", reply_markup=city_choice)
    
    
    
# @dp.message_handler()
# async def botinok(message: types.Message):
#     text = message.text

#     await message.answer(text=text)
@dp.callback_query_handler(text=["nsk", "msk", "kzn"])
async def main_menu(call: types.CallbackQuery):
    if call:
        if call.data == "nsk":
            campus_id = 1
        elif call.data == "msk":
            campus_id = 2
        elif call.data == "kzn":
            campus_id = 3
        await db.update_campus(telegram_id=call.from_user.id, campus_id=campus_id)
    text = "⚠️ Вы можете продолжить пользоваться ботом как гость или зарегистрироваться ⚠️\
    Для пользователей без регистарции, доступна бронь всего на 🕥 30 минут, студенты после регистрации получают возможность бронировать на 🕝 120 минут"
    group = await db.get_user_group(call.from_user.id)
 
    await call.message.edit_text(text=text, reply_markup=await menu_keyboard_gen(group=group))

@dp.message_handler(commands="menu")
async def menu(message: types.Message):
    text = "📢 Основное меню:"
    group = await db.get_user_group(message.from_user.id)
 
    await message.answer(text=text, reply_markup=await menu_keyboard_gen(group=group))
    
@dp.callback_query_handler(text="menu_menu")
async def menu_clon(call: types.CallbackQuery):
    text = "📢 Основное меню:"
    group = await db.get_user_group(call.from_user.id)
    await call.message.edit_text(text=text, reply_markup=await menu_keyboard_gen(group=group))
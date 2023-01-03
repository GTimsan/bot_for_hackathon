from aiogram import types
from loader import dp, db
from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton

@dp.callback_query_handler(text=["reg", "support"])
async def menu_clon(call: types.CallbackQuery):
    await call.answer("⚠️У нас обед!\n📢По всем вопросам регистрации или помощи обращаться к\n @Botoplav ", show_alert=True)
from aiogram import types
from loader import dp, db
from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton

@dp.callback_query_handler(text_contains="image_object_")
async def menu_clon(call: types.CallbackQuery):
    object = await db.get_object_by_id(int(call.data.split('_')[2]))
    back_button = InlineKeyboardButton(text="Назад ↩️",
                                callback_data="extra_object_" + call.data.split('_')[2])
    markup = InlineKeyboardMarkup(row_width=1)
    markup.add(back_button)
    await call.message.answer_photo(photo=object["image"],
                                               caption=object["name"],
                                               reply_markup=markup
                                               )
    await call.message.delete()

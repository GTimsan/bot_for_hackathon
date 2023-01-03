from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton

async def menu_keyboard_gen(group):
    if group == '1':
        button = InlineKeyboardButton(text="🖌 Регистрация", callback_data="reg")
    else:
        button = InlineKeyboardButton(text="🔑 Профиль", callback_data="profile")

    menu_keyboard = InlineKeyboardMarkup(row_width=2)
    buttons = [InlineKeyboardButton(text="📌 Забронировать", callback_data="booking"), \
            InlineKeyboardButton(text="🗂 Мои бронирования", callback_data="my_booking"), \
            button, \
            InlineKeyboardButton(text="❔ Обратная связь", callback_data="support"),]
    menu_keyboard.add(*buttons)
    
    return menu_keyboard

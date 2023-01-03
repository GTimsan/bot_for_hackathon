from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton

# from loader import db

city_choice = InlineKeyboardMarkup(row_width=1)
cities = [InlineKeyboardButton(text="🏢 Новосибирск", callback_data="nsk"), \
          InlineKeyboardButton(text="🏫 Москва", callback_data="msk"), \
          InlineKeyboardButton(text="🏬 Казань", callback_data="kzn")]
for i in range(len(cities)):
    city_choice.add(cities[i])


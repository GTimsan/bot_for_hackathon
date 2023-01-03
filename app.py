from loader import db
from utils.logging import logging

async def on_startup(dp):
    await db.create()
    from utils.set_default_commands import set_default_commands
    await set_default_commands(dp)

    from utils.notify_admins import on_startup_notify


if __name__ == '__main__':
    from aiogram import executor
    from handlers import dp

    executor.start_polling(dp, skip_updates=True, on_startup=on_startup)

# docker exec ef07e936c5eb ./manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('user','asdfghj@mail.ru', 'user')"
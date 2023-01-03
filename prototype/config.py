import os

from dotenv import load_dotenv

load_dotenv()

BOT_TOKEN = str(os.getenv("BOT_TOKEN"))

ADMINS = str(os.getenv("ADMINS")).split(",")


DB_PORT = str(os.getenv("DB_PORT"))
DB_USER = str(os.getenv("DB_USER"))
DB_PASS = str(os.getenv("DB_PASS"))
DB_NAME = str(os.getenv("DB_NAME"))
DB_HOST = str(os.getenv("DB_HOST"))

POSTGRES_URI = f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}/{DB_NAME}"

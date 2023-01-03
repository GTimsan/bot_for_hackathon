## Инструкции запуска

copy .env

docker-compose build

docker-compose run web python manage.py makemigrations

docker-compose run web python manage.py migrate
docker-compose run web python manage.py createsuperuser
nick
nik@email.ru
password

docker-compose up

ngrok http 8888

localhost:8888/admin

### Подключение кнопки в боте на webui
@botfather

/setmenubutton

имя бота

вводим сайт ngrok

назвние кнопки

docker-compose run web bash
docker-compose run school bash
docker-compose run db bash
docker-compose run web rm -rf /etc/localtime
docker-compose run web ln -s /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime
docker-compose run web date

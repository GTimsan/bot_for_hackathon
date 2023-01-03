#!/bin/bash


docker exec web python manage.py makemigrations
# docker-compose run web python manage.py makemigrations
docker exec web python manage.py migrate
# docker-compose run web python manage.py migrate

docker exec web ./manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('user','asdfghj@mail.ru', 'user')"

# останавливает и удаляет все контейнеры
# docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
# удаляет все образы
# docker rmi $(docker images -a -q)
# дамп
# docker exec -t school_db  pg_dump -U school school > test.sql

# шляпа
# docker exec -i $(docker-compose ps -q postgres) psql exampledb < exampledump.sql
# pg_restore -h hostname -U username -F format -d dbname dumpfile
# psql -U school -d school <test.sql
# docker cp test.sql school_db:/
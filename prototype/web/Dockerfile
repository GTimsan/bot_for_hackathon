FROM python:3.8

# ENV PYTHONUNBUFFERED 1

RUN mkdir /web_django
WORKDIR /web_django
COPY requirements.txt /web_django/
RUN pip install --upgrade pip && pip install -r requirements.txt
ADD . /web_django/ 
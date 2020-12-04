FROM python:3.6.12

ENV APP_APTHa=app
RUN python -m pip install --upgrade pip
RUN pip install git+git://github.com/Falldog/django-migration-checker

ENTRYPOINT ["django-find-conflicts", "${APP_PATH}"]

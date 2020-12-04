FROM python:3.6.12

ENV APP_PATH=app
RUN python -m pip install --upgrade pip
RUN pip install git+git://github.com/Falldog/django-migration-checker

ENTRYPOINT /bin/sh -c "pwd && ls -al && django-find-conflicts $APP_PATH"

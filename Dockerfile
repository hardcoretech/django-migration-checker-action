FROM python:3.6.12-alpine3.12

RUN apk add --no-cache git
RUN python -m pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir git+git://github.com/Falldog/django-migration-checker

ENTRYPOINT ["django-find-conflicts"]

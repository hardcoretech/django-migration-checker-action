FROM python:3.11.9-alpine
ARG VERSION=""

RUN apk add --no-cache git
RUN python -m pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir django-migration-checker==${VERSION}

ENTRYPOINT ["django-find-conflicts"]

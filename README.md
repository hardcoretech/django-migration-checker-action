django-migration-checker-action
===========
Github actions for django app migrations checker. To fix multiple develop commit 
django migration in different Pull Request at the same time, and then cause 
conflict migration issue.

## Detail
Use python package [django-migration-checker](https://github.com/tonyo/django-migration-checker) 
to do migration validation. The package will not install any django related package. 
Check migration by read file, not python import. So may not perfect solution, but good enough.


## Usage

Workflow example:
```
name: Django Migration Checker
on: pull_request

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout the latest code
        uses: actions/checkout@v2
        with:
          fetch-depth: 1

      - name: Django Migration Checker
        uses: hardcoretech/django-migration-checker-action@v2
        with:
          app-path: app
          docker-image-tag: 0.8.0
```

#### parameter
inputs
* `app-path`: django app folder path. after `action/checkout`, the working dir would be repository root.
  * default: `app`
* `docker-image`: docker image name. you are able to change the image hub to private source.
  * default: `docker://hardcoretech/django-migration-checker`
* `docker-image-tag` docker image tag, it should represent version of `django-migration-checker` (python package)
  * default: `latest`


## Develop
Why do we need to maintain docker image rather than build it directly in github action?
* Provide the capability for CI environment to use the image to do the checking as well.

If django-migration-checker package upgraded, need to update and push docker image. Doesn't need to release new github action version. And the version should match with python package version.
* `make push-to-aws-ecr DMC_VERSION=<new version> IMAGE_TAG=<new version> AWS_ACCOUNT_ID=<aws account id>`
* `make push-to-docker-hub DMC_VERSION=<new version> IMAGE_TAG=<new version>`

Only upgrade the version of github action when you change the content of `action.yml`.


## Resource
* Docker Hub - [django-migration-checker](https://hub.docker.com/r/hardcoretech/django-migration-checker)
* Github - python package - [django-migration-checker](https://github.com/tonyo/django-migration-checker)


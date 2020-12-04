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
        uses: hardcoretech/django-migration-checker-action@v1
        with:
          app-path: app
```

#### parameter
inputs
* `app-path`: django app folder path. after `action/checkout`, the working dir would be repository root.


## Resource
* Docker Hub - [django-migration-checker](https://hub.docker.com/r/hardcoretech/django-migration-checker)
* Github - python package - [django-migration-checker](https://github.com/tonyo/django-migration-checker)


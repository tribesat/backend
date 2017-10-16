# Backend

[![Build Status](https://travis-ci.org/tribesat/backend.svg?branch=master)](https://travis-ci.org/tribesat/backend) [![codecov](https://codecov.io/gh/tribesat/backend/branch/master/graph/badge.svg)](https://codecov.io/gh/tribesat/backend)


Tribesat server

### Dependencies

- Python 3.6
- [virtualenv](https://virtualenv.pypa.io/en/stable/)
- [PostgreSQL](https://www.postgresql.org/)

### Developing

First time setup

```sh
virtualenv -p python3.6 .pyenv # create virtualenv
source .pyenv/bin/activate     # activate virtualenv
make develop                   # install requirements
./bin/server                   # start the server
```

After this, whenever you are developing, you simply need to activate your virtual env and then start the server

```sh
source .pyenv/bin/activate # activate virtualenv
./bin/server               # start the server
```

The server will restart automatically whenever you edit a file.

### Running

To run in production, use [gunicorn](http://gunicorn.org/)

```sh
make                         # install
gunicorn tribesat.server:app # run
```

### Database

We use a [PostgreSQL](https://www.postgresql.org/)

To set up the database install PostgreSQL and then run

```sh
make setup-db
```

There must be a user `postgres` in the database

The database will be named `tribesat`

### Testing

```
make test
```

# Backend

[![Build Status](https://travis-ci.org/tribesat/backend.svg?branch=master)](https://travis-ci.org/tribesat/backend) [![codecov](https://codecov.io/gh/tribesat/backend/branch/master/graph/badge.svg)](https://codecov.io/gh/tribesat/backend)


Tribesat server

### Dependencies

- Python 3.6
- virtualenv
- nose

### Running

```sh
virtualenv -p python3.6 .pyenv # create virtualenv
source .pyenv/bin/activate     # activate virtualenv
make                           # install requirements and set up environment
./bin/server                   # start the server
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

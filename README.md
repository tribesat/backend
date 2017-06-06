# Backend

[![Build Status](https://travis-ci.org/tribesat/backend.svg?branch=master)](https://travis-ci.org/tribesat/backend)

Tribesat server

### Dependencies

- Python3
- virtualenv
- nose

### Running

```
virtualenv -p python3 .pyenv # create virtualenv
source .pyenv/bin/activate   # activate virtualenv
make                         # install requirements and set up environment
flask run                    # start the server
```

### Testing

```
make test
```

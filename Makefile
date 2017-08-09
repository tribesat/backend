ifndef CI
ifndef VIRTUAL_ENV
	$(error Please use virtualenv)
endif
endif

PACKAGE_NAME := "tribesat"

all:
	pip install -r requirements.txt

lint:
	pylint tribesat

unit-test:
	nosetests \
		--verbose \
		--nocapture \
		--with-coverage \
		--cover-tests \
		--cover-erase \
		--cover-package=$(PACKAGE_NAME) \
		tests

type-check:
	mypy tribesat

test:
	make lint && make unit-test && make type-check

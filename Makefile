ifndef CI
ifndef VIRTUAL_ENV
	$(error Please use virtualenv)
endif
endif

PACKAGE_NAME := "backend"

all:
	pip install -r requirements.txt

test:
	nosetests \
		--verbose \
		--nocapture \
		--with-coverage \
		--cover-tests \
		--cover-erase \
		--cover-package=$(PACKAGE_NAME) \
		tests

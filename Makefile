ifndef CI
ifndef VIRTUAL_ENV
$(error Please use virtualenv)
endif
endif

PACKAGE_NAME := "tribesat"

all: requirements
	python setup.py install

develop: requirements
	python setup.py develop

.PHONY: requirements
requirements:
	pip install -r requirements.txt

test: requirements
	make lint && make unit-test && make type-check && make style-review

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

setup-db:
	./db/build.sh

pretty:
	yapf --in-place --recursive --parallel tribesat tests

style-review:
	@output="$$(yapf --parallel --diff --recursive nodelib tests)"; \
	if [ -n "$$output" ]; then \
		echo "$$output"; \
		echo "run 'make pretty'"; \
		exit 1; \
	fi
	@echo "Looks good"

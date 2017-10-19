ifndef CI
ifndef VIRTUAL_ENV
$(error Please use virtualenv)
endif
endif

PACKAGE_NAME := "tribesat_backend"

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
	pylint $(PACKAGE_NAME)

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
	mypy $(PACKAGE_NAME) \
		--ignore-missing-imports

setup-db:
	./scripts/build.sh

pretty:
	yapf \
		--in-place \
		--recursive \
		--parallel \
		$(PACKAGE_NAME) tests

style-review:
	@output="$$(yapf --parallel --diff --recursive nodelib tests)"; \
	if [ -n "$$output" ]; then \
		echo "$$output"; \
		echo "run 'make pretty'"; \
		exit 1; \
	fi
	@echo "Looks good"

ifndef CI
ifndef VIRTUAL_ENV
	$(error Please use virtualenv)
endif
endif

PACKAGE_NAME := "tribesat"

all:
	pip install -r requirements.txt

test:
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

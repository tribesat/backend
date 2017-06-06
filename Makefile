ifndef CI
ifndef VIRTUAL_ENV
	$(error Please use virtualenv)
endif
endif

all:
	pip install -r requirements.txt

test:
	nosetests -v -s tests

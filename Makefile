ifndef VIRTUAL_ENV
	$(error Use virtualenv)
endif

all:
	pip install -r requirements.txt
	export FLASK_APP = server.py

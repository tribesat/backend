from random import randint
from tribesat_backend.db import session, Temperature

NUMBER_OF_ROWS_TO_ADD = 50
MIN_TEMP = 10   # units TBD
MAX_TEMP = 100  # when we have units i'll put in more realistic values

for i in range(NUMBER_OF_ROWS_TO_ADD):
    session.add(Temperature(temperature=randint(MIN_TEMP, MAX_TEMP)))
session.commit()

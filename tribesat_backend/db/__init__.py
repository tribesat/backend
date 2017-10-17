"""This module defines our database tables and the data structures stored
   therein
"""

import os
from datetime import datetime
from typing import Any
from sqlalchemy import create_engine, Column, Integer, Float, DateTime
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

DATABASE_URL = os.environ.get("DATABASE_URL",
                              "postgres://postgres:@localhost/tribesat")

engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()  # type: Any


class Temperature(Base):  # pylint: disable=too-few-public-methods
    """Represents temperature table in database
    """
    __tablename__ = "temperature"

    id = Column(Integer, primary_key=True)  # pylint: disable=C0103
    timestamp = Column(DateTime(timezone=True), default=datetime.now)
    temperature = Column(Float)

    def __repr__(self):
        return "<Temperature(id={} time={} temperature={})>".format(
            self.id, self.timestamp, self.temperature)


# create all tables that don't already exist
Base.metadata.create_all(engine)

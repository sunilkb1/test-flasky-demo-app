"""!
Class DemoApp
Description:
This class hold the data specific to demo_app endpoints
As part of initialisations, the demo_app.json file from resources/demo_app.json is read and populated
Also constants are read and populated into the demo_app object.
This will be used in conjunction with api_services to run the rest api calls
Requirements: None
"""
# pylint: disable=too-many-instance-attributes
# Instances are required for this use-case
# pylint: disable=too-few-public-methods
# Sufficient for this use case

import json
import uuid
import time
from resources.demo_app import URL, USERNAME_ROUTE, \
    USERS_ROUTE, TOKEN_ROUTE, VALID_TEST_PASSWORD, \
    TEST_PHONE, TEST_FIRSTNAME, TEST_LASTNAME


class DemoApp:
    """
    DemoApp Class which holds the template as per the demo_app api data
    """
    def __init__(self, username=None, password=None, firstname=None, lastname=None, phone=None):
        """
        init will initialise the object by reading the json and constants data
        """

        # Generate a username if username is not passed
        # For this project, we will generate a unique username as no delete method available
        # use epoch time and uuid module in python to generate unique name
        # uuid modules created UUID objects according to RFC 4122
        self.username = uuid.uuid1(clock_seq=int(time.time())).hex if username is None else username
        self.password = VALID_TEST_PASSWORD if password is None else password
        self.firstname = TEST_FIRSTNAME if firstname is None else firstname
        self.lastname = TEST_LASTNAME if lastname is None else lastname
        self.phone = TEST_PHONE if phone is None else phone
        self.url = URL
        self.create_url = self.url + USERS_ROUTE
        self.token_url = self.url + TOKEN_ROUTE
        self.get_all_url = self.url + USERS_ROUTE
        self.get_url = self.url + USERNAME_ROUTE.format(username=self.username)
        self.update_url = self.url + USERNAME_ROUTE.format(username=self.username)
        self.session = None
        self.token = None

        self.header = {'Content-Type': 'application/json'}
        self.create_payload = {
            'username': self.username,
            'password': self.password,
            'firstname': self.firstname,
            'lastname': self.lastname,
            'phone': self.phone
        }

        self.update_payload = {
            'firstname': self.firstname,
            'lastname': self.lastname,
            'phone': self.phone
        }

    def update_new_details(self, firstname=None, lastname=None, phone=None):
        payload = dict()

        if firstname is not None:
            payload.update({"firstname": firstname})

        if lastname is not None:
            payload.update({"lastname": lastname})

        if phone is not None:
            payload.update({"phone": phone})

        self.update_payload = payload
        return True

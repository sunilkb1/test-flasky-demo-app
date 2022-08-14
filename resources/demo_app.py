"""!
demo_app data
Description:
This file holds the data specific to demo_app like URL details
These are not expected to change frequently.
This will be shared by both API and UI/Robotframework tests
Requirements: None
"""
# pylint: disable=too-many-instance-attributes
# Instances are required for this use-case
# pylint: disable=too-few-public-methods
# Sufficient for this use case


"""
Any changes in endpoint api should be done here and not hardcoded in tests
"""

import time
import uuid

# Variables used by both pytest/API and robot/UI tests
URL = 'http://127.0.0.1:8080'

# We use the epoch time to generate a unique uuid which we are using as username.
# Both API and UI does not have the capability to delete a user.
# Hence, we are generating unique username which can be used to run tests multiple times,
# without encountering - User Already Exists error.
UNIQUE_USERNAME = uuid.uuid1(clock_seq=int(time.time())).hex

# Dummy password to be used for all the new users created in this test.
# It's not good idea to store the password in files
# Future enhancement: Get password from ENV variable which test user can set before starting the test
VALID_TEST_PASSWORD = 'dummy!password@123'
INVALID_TEST_PASSWORD = 'INVALID_PASSWORD'
TEST_FIRSTNAME='TestFirstName'
TEST_LASTNAME='TestLastName'
TEST_PHONE='+358123456789'


# API Endpoints
TOKEN_ROUTE = '/api/auth/token'
USERS_ROUTE = '/api/users'
USERNAME_ROUTE = '/api/users/{username}'







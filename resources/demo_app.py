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

URL = 'http://127.0.0.1:8080'
TOKEN_ROUTE = '/api/auth/token'
USERS_ROUTE = '/api/users'
USERNAME_ROUTE = '/api/users/{username}'

# Dummy password to be used for all the new users created in this test.
# It's not good idea to store the password in files
# Future enhancement:
## Get the password from secret file or
## Get password from ENV variable which test user can set before starting the test
VALID_TEST_PASSWORD = 'dummy!password@123'
INVALID_TEST_PASSWORD = 'INVALID_PASSWORD'

TEST_FIRSTNAME='TestFirstName'
TEST_LASTNAME='TestLastName'
TEST_PHONE='+358123456789'
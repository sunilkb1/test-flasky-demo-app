"""!
Class APIServices
Description:
This class handles the API services i.e. CRUD operations and other common functionalities
This is not tied to specific API and is re-usable for other API end-points
Requirements: None
"""
import json
import requests


class APIService:
    """
    This service is designed to handle all the CRUD operations for endpoints
    """

    def create(self, context):
        """
        creates new record.
        :param context: API/Endpoint object
        :return: resp data in json format
        """
        response = requests.post(context.create_url, json=context.create_payload)
        return response

    def login(self, context, username=None, password=None):
        """
        login/In context of RestAPI, get the token using basic auth
        Set the token to the API object i.e context.token
        Create a request session and update the header to use the token in subsequent request calls
        :param context: API/Endpoint object
        :param username: credentials required for generating token
        :param password: password of user to generate token
        :return: response data
        """
        if username is None:
            username = context.username
        if password is None:
            password = context.password
        response = requests.get(context.token_url, auth=(username, password))
        context.token = response.json()['token']
        context.session = requests.Session()
        context.session.headers.update({'token': f'{context.token}', 'Content-Type': 'application/json'})
        return response

    def get(self, context, username=None):
        """
        get the record for particular username
        :param context: API/Endpoint object
        :param username: Optional username. Else the username associated with context will be used
        :return: response
        """
        if username is not None:
            context.get_url = context.get_all_url + '/' + username
        return context.session.get(context.get_url)

    def get_all(self, context):
        """
        Get all the users registred in demo app
        :param context: API/Endpoint object
        :return:
        """
        return context.session.get(context.get_all_url)

    def update(self, context, update_payload=None):
        """
        Updates the existing record
        :param context: API/Endpoint object
        :param update_payload: payload which contains the new data to be updated
                                If none, updated_payload from context will be used
        :return: response
        """
        data = context.update_payload
        if update_payload is not None:
            data = json.dumps(update_payload)
        response = context.session.put(context.update_url, data=data)
        return response

    def delete(self):
        raise NotImplementedError

    def patch(self):
        raise NotImplementedError
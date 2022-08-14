# test-flasky-demo-app
Technical assessment - Signant Health

## Observations

### API
* A token generated with user1 will allow modifying the details of user2 using PUT api.
* Patch/Delete not supported for end-end CRUD operation testing.
* Change of *password* not supported via PUT.
* GET /api/users using any token will get all the users. 
* An admin login should be available using whose token only, we should be able to GET all the /api/users. 


### UI
* Delete of user not supported.
* Input field validation not available.
* Banner (like registration successful) are not implemented causing ambiguity.


### App Installation & Run
* Docker image built from the given docker file does not work due to mismatch in versions mentioned in requirement.txt

```sh
docker logs 94be5d00716d3250e00c98ed615f2c7481a8c1345704e4e015b678991a3ae261
Traceback (most recent call last):
  File "/usr/bin/flask", line 5, in <module>
    from flask.cli import main
  File "/usr/lib/python3.10/site-packages/flask/__init__.py", line 17, in <module>
    from werkzeug.exceptions import abort
  File "/usr/lib/python3.10/site-packages/werkzeug/__init__.py", line 151, in <module>
    __import__('werkzeug.exceptions')
  File "/usr/lib/python3.10/site-packages/werkzeug/exceptions.py", line 71, in <module>
    from werkzeug.wrappers import Response
  File "/usr/lib/python3.10/site-packages/werkzeug/wrappers.py", line 27, in <module>
    from werkzeug.http import HTTP_STATUS_CODES, \
  File "/usr/lib/python3.10/site-packages/werkzeug/http.py", line 1148, in <module>
    from werkzeug.datastructures import Accept, HeaderSet, ETags, Authorization, \
  File "/usr/lib/python3.10/site-packages/werkzeug/datastructures.py", line 16, in <module>
    from collections import Container, Iterable, MutableSet
ImportError: cannot import name 'Container' from 'collections' (/usr/lib/python3.10/collections/__init__.py)

```
* Above error was fixed after removing the version sring from requirement file and thus enabling the docker to pull all the latest libraries.

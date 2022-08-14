# test-flasky-demo-app
Technical assessment - Signant Health

## How to reach the author?
*  email at: sunil.vvce@gmail.com


## How can I install the requirements.txt file?
```sh
$ cd test-flasky-demo-app
$ pip install -r requirements.txt
```

## How to run API tests
```sh
$ cd test-flasky-demo-app
$ cd tests/api/
$ pytest
or
$ python3 -m pytest
```
All the requirement mentioned in requirements.txt must be installed *(pytest, pytest-html, requests)*

### To run specific testcase
```sh
pytest -k <testcase name>
```
*Example: pytest -k test_update_user*

## How to run UI tests
```sh
$ cd test-flasky-demo-app
$ cd tests/ui/
$ robot basic_tests.robot  
```
All the requirement mentioned in requirements.txt must be installed *(robotframework, robotframework-seleniumlibrary)*

The UI tests are run using default firefox browser. 
*geckodriver* for the particular platfrom on which the test is run should be downloaded and placed in the default python path

*geckodriver* can be downloaded from https://github.com/mozilla/geckodriver/releases

More details here -  https://www.selenium.dev/selenium/docs/api/py/#drivers


**For both UI and API tests, *report.html* is generated in the respective folder which contains the test run result report.**
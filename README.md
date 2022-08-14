# test-flasky-demo-app
Test framework for a demo app.

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

### WebDrivers
The UI tests are run using default firefox browser. However, this can be changed in the demo_app.robot resource file.
UI tests can be run in headless mode without the GUI.

A webdriver is required to run UI test and the webdriver binary to be used depends on platform and browser version. 
The *bin* folder contains three sub-folders - *mac*, *win*, *linux* and these paths are added into PATH variable when UI tests are run.
Make sure to place the webdriver as per your platform/browser version in any of these folders or into default python path.

*geckodriver* for firefox can be downloaded from https://github.com/mozilla/geckodriver/releases

*chromedriver* for Google Chrome can be downloaded from https://chromedriver.chromium.org/downloads

More details here -  https://www.selenium.dev/selenium/docs/api/py/#drivers

## Test Reports
For both UI and API tests, *report.html* is generated in the respective folder which contains the test run result report.
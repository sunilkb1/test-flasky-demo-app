# test-flasky-demo-app
Test framework for a demo app.

## How to reach the author?
*  email at: sunil.vvce@gmail.com

## Demo Videos
* Demo video: https://drive.google.com/file/d/14pGRXWwh6sPK2HxCEOfEOoZdBEt1eQJ4/view?usp=sharing
* Code Walk-through vide: https://drive.google.com/file/d/14pJ6LVBpr6ObXOKuFZccmqRW-diHkiJH/view?usp=sharing

## How to run from Dockerfile
```sh
$ cd test-flasky-demo-app
$ ls Dockerfile
$ docker build -t test_demo_app .
$ docker run -it -d --name test_flasky test_demo_app
$ docker exec -it test_flasky robot -v browser:headlessfirefox /test-flasky-demo-app/tests/ui/basic_tests.robot
$ docker exec -it test_flasky pytest /test-flasky-demo-app/tests/api/test_basic.py
```

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
or
$ python3 -m pytest test_basic.py
or
$ pytest test_basic.py
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

###### Note: Scripts are tested on Mac and linux environment. If any platform specific issues are seen on other platforms, please inform the author.

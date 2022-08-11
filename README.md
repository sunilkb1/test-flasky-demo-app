# test-flasky-demo-app
Technical assessment - Signant Health

## How to reach the author?
*  email at: sunil.vvce@gmail.com


## How can I install the requirements.txt file?
```sh
$ cd test-flasky-demo-app
$ pip install -r requirements.txt
```

## File Structure Overview
The file structure of test-flasky-demo-app encourage code reuse and make it quick to find and understand the code.

## Top Level
These are the top-level directories:
- `lib` - where all the libraries that support all the tests are maintained.
- `tests` - where all the proper tests of the flasky app go.
- `bin` - which contains the webdriver required to run selenium. 
- `resources`  - test data.

## Lib
The `lib` (library) is  the building blocks used to make the tests.
 
Any type of activity in a code that is likely to be used in another script/test should be refactored to the library section of the repo.
 
The library is itself organized to you can easily find building blocks based on the type of activity you need to accomplish.
 
### API
The *lib/api* directory is structured for RestAPI to interacts with the flasky app.

The script here implement the RestAPI that is publicly supported by app and available to use.

### UI
The *lib/ui* directory contains the code for UI implementation (Using robortframework-selenium library)
 

## Tests

These contain the actual tests to be run.
### UI
UI tests are implemented in robort framework and used the selenium library.

### API
API tests are writern on pytest test framework and are implemented using requests module.

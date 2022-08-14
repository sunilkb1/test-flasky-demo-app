# File Structure Overview
The file structure of test-flasky-demo-app encourage code reuse and make it quick to find and understand the code.

## Top Level
These are the top-level directories:
- `lib` - where all the libraries that support the tests are maintained.
- `tests` - where all the tests of the flasky app go.  This has both UI (robot/selenium) and RestAPI (pytest/request) based tests
- `bin` - which contains the webdriver required to run selenium. The webdriver depends on platform and browser version. 
The bin folder contains three sub-folders - *mac*, *win*, *linux* and these paths are added into PATH variable when UI tests are run.
Make sure to place the webdriver as per your platform/broswer version in any of these folders or into default python path. 
- `resources`  - test data used by both API and UI tests. Changes in url, api endpoints etc. are to be done here.

## lib and resources
The `lib` (library) is  the building blocks used to make the tests. `resources` contain the test data.
 
Any type of activity in a code that is likely to be used in another script/test should be refactored to the library section of the repo.
 
The library is itself organized to easily find building blocks based on the type of activity you need to accomplish.
 
### API
The *lib/api* directory is structured for RestAPI to interacts with the flasky app.
The scripts here implement the RestAPI that is publicly supported by app and available to use.

### UI
The *lib/ui* directory in created to contain the code for UI implementation (Using robotframework-selenium library).
For the demo app, the *lib/ui* does not have any code, and it is placed here for future enchancement/usage.
 

## Tests
These contain the actual tests to be run.

### UI
UI tests are implemented in robot framework and uses the selenium library.

### API
API tests are written on pytest framework and are implemented using requests module.

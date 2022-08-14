[Documentation]   Test case to validate demo app. This suite contains two positive tests:
...    1. Register through web portal
...    2. Review my own user information from the main view

*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/demo_app.robot
Test Setup  Open Application    ${demoapp}
Test Teardown    Close Application  ${demoapp}


*** Test Cases ***
Registration Test
    [Documentation]
    ...     Open registration link, fill the registration and submit the details.
    ...     On successful submission the page is redirected to login page
    [Tags]  Smoke
    Click and Verify Banner    Link     ${registerLink}    ${registerPageBanner}
    Verify URL Contains  ${registerPageUrl}
    Fill Registration Details
    Click and Verify Banner    Button   ${registerButton}      ${loginPageBanner}
    Verify URL Contains  ${loginPageUrl}


Verify Details
    [Documentation]
    ...     Open login page, fill the credentials.
    ...     Verify the user info, if it matches with the registration data
    [Tags]  Smoke
    Click and Verify Banner    Link     ${loginLink}    ${loginPageBanner}
    Enter Credentials   ${username}    ${password}
    Click and Verify Banner    Button   ${loginButton}      ${userPageBanner}
    Verify User Info Table Values
    Verify User Info Table Header
    Verify URL Contains  ${userPageUrl}
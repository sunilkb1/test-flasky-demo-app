[Documentation]   Test case to validate demo app. This suite contains two positive tests:
...    1. Register through web portal
...    2. Review my own user information from the main view

*** Settings ***
Library     SeleniumLibrary
Test Setup  Open Application    ${demoapp}
Test Teardown    Close Application  ${demoapp}

*** Variables ***
${demoapp}              http://127.0.0.1:8080/
${loginPageUrl}         login
${userPageUrl}          user
${logoutPageUrl}        logout
${registerPageUrl}      register
${username}             test
${password}             test
${firstname}            testFN
${lastname}             testLN
${phone}                +358-123-123-123
${tableHeader1}         key
${tableHeader2}         value
${loginLink}            Log In
${loginButton}          Log In
${registerLink}         Register
${registerButton}       Register
${loginPageBanner}      Log In
${registerPageBanner}   Register
${userPageBanner}       User Information




*** Test Cases ***
Registration Test
    [Documentation]
    ...     Open registration link, fill the registration and submit the details.
    ...     On successful submission the page is redirected to login page
    [Tags]  Smoke
    Click and Verify Banner    Link     ${registerLink}    ${registerPageBanner}
    Verify URL Contains  ${registerPageUrl}
    Fill Registration Details   ${username}    ${password}    ${firstname}  ${lastname}  ${phone}
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
    Element Text Should Be    //table[@id='content']//tr/td[@id='username']  ${username}
    Element Text Should Be    //table[@id='content']//tr/td[@id='firstname']     ${firstname}
    Element Text Should Be    //table[@id='content']//tr/td[@id='lastname']      ${lastname}
    Element Text Should Be    //table[@id='content']//tr/td[@id='phone']  ${phone}
    table header should contain    //table[@id='content']  ${tableHeader1}
    table header should contain    //table[@id='content']  ${tableHeader2}
    Verify URL Contains  ${userPageUrl}


*** Keywords ***
Go To And Verify Header
    [Arguments]    ${url}    ${header}
    go to       ${url}
    wait until element is visible    xpath://h1[text()='${header}']
    page should contain element    xpath://h1[text()='${header}']

Verify URL Contains
    [Arguments]    ${url_word}
    ${newurl}      get location
    should contain    ${newurl}     ${url_word}

Click and Verify Banner
    [Arguments]    ${type}      ${link}     ${header}
    run keyword if  '${type}' == 'Link'   click link    ${link}
    run keyword if  '${type}' == 'Button'   click button    xpath://input[@value='${link}']
    page should contain element    xpath://h1[text()='${header}']

Enter Credentials
    [Arguments]    ${username}  ${password}
    input text    id:username   ${username}
    input password    id:password   ${password}


Fill Registration Details
    [Arguments]    ${username}      ${password}     ${firstname}    ${lastname}     ${phone}
    input text    id:username   ${username}
    input password    id:password   ${password}
    input text    id:firstname      ${firstname}
    input text    id:lastname      ${lastname}
    input text    id:phone      ${phone}

Open Application
    [Arguments]    ${url}
    open browser    ${url}
    maximize browser window
    # Slowing down selenium for test purpose. To be revmoved in regular/regression runs.
    Set Selenium Speed  0.1
    Go To And Verify Header   ${url}/${logoutPageUrl}    index page


Close Application
    [Arguments]    ${url}
    Go To And Verify Header   ${url}/${logoutPageUrl}    index page
    close browser
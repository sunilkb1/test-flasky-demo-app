[Documentation]   Resource file for demo app test scripts

*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Variables   ./demo_app.py

*** Variables ***
${demoapp}              ${URL}
${username}             ${UNIQUE_USERNAME}
${password}             ${VALID_TEST_PASSWORD}
${firstname}            ${TEST_FIRSTNAME}
${lastname}             ${TEST_LASTNAME}
${phone}                ${TEST_PHONE}
#Options supported for browsers are chrome, firefox, headlessfirefox, headlesschrome
# Please read README on setting up webdriver for these browsers
${browser}              firefox
${loginPageUrl}         login
${userPageUrl}          user
${logoutPageUrl}        logout
${registerPageUrl}      register
${tableHeader1}         key
${tableHeader2}         value
${loginLink}            Log In
${loginButton}          Log In
${registerLink}         Register
${registerButton}       Register
${loginPageBanner}      Log In
${registerPageBanner}   Register
${userPageBanner}       User Information
${usernameFromTable}    //table[@id='content']//tr/td[@id='username']
${firstnameFromTable}   //table[@id='content']//tr/td[@id='firstname']
${lastnameFromTable}    //table[@id='content']//tr/td[@id='lastname']
${phoneFromTable}       //table[@id='content']//tr/td[@id='phone']
${infoTable}            //table[@id='content']




*** Keywords ***
Open Application
    [Documentation]   Setup the brower
    [Arguments]    ${url}
    Setup Webdriver
    open browser    ${url}      ${browser}      service_log_path=${{os.path.devnull}}
    maximize browser window
    # Slowing down selenium for test purpose. To be revmoved in regular/regression runs.
    Set Selenium Speed  0.1
    Go To And Verify Banner   ${url}/${logoutPageUrl}    index page


Close Application
    [Documentation]   Log out and close the browsers
    [Arguments]    ${url}
    Go To And Verify Banner   ${url}/${logoutPageUrl}    index page
    close browser

Fill Registration Details
    [Documentation]   new user details to be filled
    input text    id:username   ${username}
    input password    id:password   ${password}
    input text    id:firstname      ${firstname}
    input text    id:lastname      ${lastname}
    input text    id:phone      ${phone}

Verify User Info Table Values
    [Documentation]   Verify the new user details from table
    Element Text Should Be    ${usernameFromTable}  ${username}
    Element Text Should Be    ${firstnameFromTable}     ${firstname}
    Element Text Should Be    ${lastnameFromTable}      ${lastname}
    Element Text Should Be    ${phoneFromTable}  ${phone}

Verify User Info Table Header
    table header should contain    ${infoTable}  ${tableHeader1}
    table header should contain    ${infoTable}  ${tableHeader2}

Go To And Verify Banner
    [Documentation]   Go to specified url and verify the header/banner on the page
    [Arguments]    ${url}    ${header}
    go to       ${url}
    wait until element is visible    xpath://h1[text()='${header}']
    page should contain element    xpath://h1[text()='${header}']

Verify URL Contains
    [Arguments]    ${url_word}
    ${newurl}      get location
    should contain    ${newurl}     ${url_word}

Click and Verify Banner
    [Documentation]   Click a link or a button and verify the header/banner on the page
    [Arguments]    ${type}      ${link}     ${header}
    run keyword if  '${type}' == 'Link'   click link    ${link}
    run keyword if  '${type}' == 'Button'   click button    xpath://input[@value='${link}']
    page should contain element    xpath://h1[text()='${header}']

Enter Credentials
    input text    id:username   ${username}
    input password    id:password   ${password}

Setup Webdriver
    [Documentation]   Add the bin folder as path variable for selenium driver
    Append To Environment Variable    PATH    ../../bin/win/
    Append To Environment Variable    PATH    ../../bin/linux/
    Append To Environment Variable    PATH    ../../bin/mac/

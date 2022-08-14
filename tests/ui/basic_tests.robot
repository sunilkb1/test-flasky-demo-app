*** Settings ***
Library     SeleniumLibrary
Test Setup  Open Application    http://127.0.0.1:8080/
Test Teardown    Close Application


*** Test Cases ***
Registration Test
    [Tags]  Smoke
    Click and Verify Banner    Link     Register    Register
    Verify URL Contains  register
    Fill Registration Details   test    test    testFN  testLN  +999999
    Click and Verify Banner    Button   Register      Log In
    Verify URL Contains  login

Verify Details
    [Tags]  Smoke
    Click and Verify Banner    Link     Log In    Log In
    Enter Credentials   test    test
    Click and Verify Banner    Button   Log In      User Information
    Element Text Should Be    //table[@id='content']//tr/td[@id='username']  test
    Element Text Should Be    //table[@id='content']//tr/td[@id='firstname']      testFN
    Element Text Should Be    //table[@id='content']//tr/td[@id='lastname']      testLN
    Element Text Should Be    //table[@id='content']//tr/td[@id='phone']  +999999
    table header should contain    //table[@id='content']  key
    table header should contain    //table[@id='content']  value


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
    Set Selenium Speed  0.1
    Go To And Verify Header   ${url}/logout    index page


Close Application
    close browser
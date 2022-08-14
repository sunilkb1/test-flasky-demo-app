*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Registration Test
    open browser    http://127.0.0.1:8080/
    Go To And Verify Header   http://127.0.0.1:8080/logout    index page
    Click and Verify Header    Link     Register    Register
    Verify URL Contains  register
    input text    id:username   test
    input password    id:password   test
    input text    id:firstname      testFN
    input text    id:lastname      testLN
    input text    id:phone      123
    Click and Verify Header    Button   Register      Log In
    Verify URL Contains  login


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

Click and Verify Header
    [Arguments]    ${type}      ${link}     ${header}
    run keyword if  '${type}' == 'Link'   click link    ${link}
    run keyword if  '${type}' == 'Button'   click button    xpath://input[@value='${link}']
    page should contain element    xpath://h1[text()='${header}']
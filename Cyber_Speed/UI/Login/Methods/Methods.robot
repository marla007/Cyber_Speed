*** Settings ***
Library     MyLib
Library     Selenium2Library
Library    Collections
Library    DateTime
Resource    ../Variables/Variables.robot
Resource    ../../main.robot

*** Keywords ***
# Check signed in User
Successful login
    [Arguments]     ${username}     ${password}
    Input email     ${username}
    Click continue
    mylib.input password     ${password}
    Click sign in
    Wait until element is visible   ${LOGGED_IN_USER}  ${WAIT_SHORT}

## Expect error after invalid email
Login with not existed invalid email
    [Arguments]     ${username}     ${expected_element}
    Enter username  ${username}     ${expected_element}

# Expect error after empty email
Login with empty email field
    [Arguments]     ${username}     ${expected_element}
    Enter username  ${username}     ${expected_element}

# Expect error after wrong password
Login with valid email and wrong password
    [Arguments]     ${username}     ${password}     ${expected_element}
    Input email     ${username}
    Click continue
    Enter password  ${password}     ${expected_element}

# Expect error after empty password
Login with valid email and empty password
    [Arguments]     ${password}     ${expected_element}
    Enter password  ${password}      ${expected_element}

# Enter email and expect results (error or going to sign in)
Enter username
    [Arguments]     ${username}     ${expected_element}
    Input email     ${username}
    Click continue
    Wait until element is visible   ${expected_element}  ${WAIT_SHORT}

# Enter password and expect results (error or success sign in)
Enter password
    [Arguments]     ${password}    ${expected_element}
    mylib.input password  ${password}
    Click sign in
    Wait until element is visible   ${expected_element}     ${WAIT_LONG}
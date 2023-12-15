*** Settings ***
Library     Selenium2Library
Resource    ../Methods/Methods.robot
Resource    ../Variables/Variables.robot
Resource    ../../main.robot
Suite Setup         Browser Opened To Login Page
Suite Teardown      Close Browser

*** Test Cases ***
#Checking error msgs for email and password fields with wrong and empty data
Login with invalid emails and passwords
    Login with not existed invalid email            ${NON_EXISTED_EMAIL}        ${ERROR_MESSAGE_INV_EMAIL}
    Login with empty email field                    ${EMPTY}                    ${ERROR_MESSAGE_EMPTY_EMAIL}
    Login with valid email and wrong password       ${VALID_USERNAME}       ${INVALID_PASSWORD}   ${ERROR_MESSAGE_INV_PSW}
    Login with valid email and empty password       ${EMPTY}                    ${ERROR_MESSAGE_EMPTY_PSW}



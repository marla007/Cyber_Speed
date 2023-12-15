*** Settings ***
Library     Selenium2Library
Resource    ../Methods/Methods.robot
Resource    ../Variables/Variables.robot
Resource    ../../main.robot
Suite Setup         Browser Opened To Login Page
Suite Teardown      Close Browser

*** Test Cases ***
#Checking Sign In functionality with valid email and password
Successful login
    Successful login    ${VALID_USERNAME}   ${VALID_PASSWORD}
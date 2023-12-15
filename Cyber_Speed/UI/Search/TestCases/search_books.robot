*** Settings ***
Library     Selenium2Library
Resource    ../Methods/Methods.robot
Resource    ../Variables/Variables.robot
Resource    ../../Login/Methods/Methods.robot
Resource    ../../main.robot
#Suite Setup         Browser Opened To Login Page
Suite Setup         Browser Opened To Home Page
Suite Teardown      Close Browser

*** Test Cases ***
Search books
    # Uncomment the line below and "#Suite Setup    Browser Opened To Login Page", if search will need login step
    # Successful login    ${VALID_USERNAME}   ${VALID_PASSWORD}

    # Perform a search for English books using the keyword ${APPLE}
    Search english books  ${APPLE}

    # Check if the search results are paginated with the expected number of items
    Pagination check   ${LIST}     ${NUMBER_OF_ITEMS}

    # Check if the search results are sorted by Publication date
    Sorting check by Publication date
*** Settings ***
Library     Selenium2Library

*** Variables ***
${BROWSER}          chrome
${HOMEPAGE_URL}     https://www.amazon.com/
${LOGIN_URL}        https://www.amazon.com/ap/signin?openid.pape.max_auth_age=900&openid.return_to=https%3A%2F%2Fwww.amazon.com%2Fgp%2Fyourstore%2Fhome%3Fpath%3D%252Fgp%252Fyourstore%252Fhome%26signIn%3D1%26useRedirectOnSuccess%3D1%26action%3Dsign-out%26ref_%3Dnav_AccountFlyout_signout&prevRID=8XFN6X9GN9GY66HXXA4B&openid.assoc_handle=usflex&openid.mode=checkid_setup&failedSignInCount=0&pageId=usflex&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0

${EMPTY}
${DELAY}            2
${WAIT_SHORT}       5
${WAIT_MIDDLE}      10
${WAIT_LONG}        15

*** Keywords ***
Browser Opened To Home Page
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
    Maximize Browser Window

Browser Opened To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Log variables
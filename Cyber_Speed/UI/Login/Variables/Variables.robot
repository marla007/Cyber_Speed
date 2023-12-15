*** Variables ***
${USERNAME_INPUT}               id=ap_email
${CONTINUE}                     id=continue
${PASSWORD_INPUT}               id=ap_password
${SIGN_IN}                      id=signInSubmit

${LOGGED_IN_USER}               id=nav-link-accountList-nav-line-1

${ERROR_MESSAGE_INV_EMAIL}      xpath=//span[@class='a-list-item']
${ERROR_MESSAGE_EMPTY_EMAIL}    id=auth-email-missing-alert
${ERROR_MESSAGE_INV_PSW}        xpath=//span[contains(.,'Your password is incorrect')]
${ERROR_MESSAGE_EMPTY_PSW}      id=auth-password-missing-alert

${NON_REGISTERED_EMAIL}         test12234@gmail.com
${NON_EXISTED_EMAIL}            rrrrrrrrr
${INVALID_PASSWORD}             Test!11234

${VALID_USERNAME}               maria.khachatryan.ch@gmail.com
${VALID_PASSWORD}               Test!123

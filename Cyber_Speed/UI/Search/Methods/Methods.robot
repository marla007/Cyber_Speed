*** Settings ***
Library     MyLib
Library     Selenium2Library
Library     Collections
Library     DateTime
Resource    ../Variables/Variables.robot

*** Keywords ***

#Uncomment Log to consoles , to see some results
#Searching english books about apples
Search english books
    [Arguments]     ${search_name}
    Press Keys    ${ALL_SECTION_BUTTON}    b
    Press Keys    ${ALL_SECTION_BUTTON}    b
    Press Keys    ${ALL_SECTION_BUTTON}    b    ${search_name}   RETURN
    Click element    ${ENGLISH}


#Checking pagination with more than 16 items (next button) and exactly 16 items in one page.
Pagination check
    [Arguments]     ${list}     ${number_of_items}
    ${item_count}    Get element count    ${list}
    Should Be Equal As Numbers    ${item_count}    ${number_of_items}
    Log to console    Number of items in the list: ${item_count}
    ${result_count}=    Get text    ${RESULTS_NUMBER}
    ${results}     Extract and compare    ${result_count}
#    Log to console      ${results}
    Run Keyword If      '${results}' == 'True'    Element Should Be Visible    ${NEXT_PAGE}
    Run keyword If      '${results}' == 'False'    Element Should Not Be Visible    ${NEXT_PAGE}


#Select filter by Publication date and check sorting validation
Sorting check by Publication date
    Click element    ${FILTER}
    Click element    ${PUBLICATION_DATE}
    ${elements}  Get WebElements  ${DATE_ELEMENTS}
    @{dates}     Create List
    FOR  ${element}  IN  @{elements}
        ${text}  Get text    ${element}
        Append to list  ${dates}    ${text}
    END
    @{new_dates}    Convert Dates To Sortable Format    ${dates}


#Changing dates format to m/d/y for comparing
Convert Dates To Sortable Format
    [Arguments]    ${text}
    ${formatted_date}   MyLib.Format dates    ${text}
#    Log to console    ${formatted_date}
    ${result}     Check and print sorting    ${formatted_date}
#    Log to console    ${result}

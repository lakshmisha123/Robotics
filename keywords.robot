*** Settings ***
Resource    ../variable/variable.robot

*** Keywords ***
Input to the Search Bar and Click on Search Button
    Input Text    ${search_bar}    ${item}
    Click Element    ${search_bar_click_button}

Selecting Expected Item Scrolling Into The Element
    Scroll Element Into View    ${item_selected}
    Click Element    ${item_selected}


Scrolling to the Comparision Table of the Items
    ${window}    Get Window Handles
    Switch Window    ${window}[1]
    Wait Until Element Is Visible    ${scro_item}
    Scroll Element Into View    ${scro_item}

Fetching Text From Table
    ${r1}    Get Element Count    ${tablerow1}
    ${c1}    Get Element Count    ${tablecolumn1}
    
    Log To Console    ${r1}
    Log To Console    ${c1}
    

    FOR    ${ele1}    IN RANGE    1    ${r1} + 1
         ${row_header}    Get Text    ${chip}
        Run Keyword If    '${row_header}' == '${expected}'    Exit For Loop
    END
    Log    ${ele1}


    FOR    ${counter}    IN RANGE    1    ${c1} + 1
         ${colval}    Get Text    (//*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[8]//td[2])
          
        IF    "${colval}" == "${expect2}"
         ${s}    Get Text    (//*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[8]//td[3])
        Log To Console    ${counter}
        Log To Console    ${colval}
        Log To Console    ${s}
        ELSE
        Log To Console    ${colval}
            
        END
        Run Keyword If    "${colval}" == "${expect2}"    Exit For Loop
    END


Table
    ${r1}    Get Element Count    ${tablerow1}
    ${c1}    Get Element Count    ${tablecolumn1}
    Log To Console    ${r1}
    Log To Console    ${c1}
    FOR    ${rr1}    IN RANGE    1    ${r1}    1
        ${v}    Get Text    //*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[${rr1}]//td[1]
        IF    '${v}' == '${expected}'
            FOR    ${cc1}    IN RANGE    1    ${c1}    1
            ${v1}    Get Text    //*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[${rr1}]//td[${cc1}]
            IF    "${v1}" == "${expect2}"
                Log To Console    ${v1}
            END
            Run Keyword If    "${v1}" == "${expect2}"    Exit For Loop
        END
            Run Keyword If    "${v}" == "${expected}"    Exit For Loop
        END
        
    END
    
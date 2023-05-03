*** Settings ***
Documentation    amazon search functionality
Resource    ../keywords/keywords.robot

Suite Setup    Open Browser    ${url}    ${browser}
Suite Teardown    Close Browser


*** Test Cases ***
start testcase
    [Tags]    smoke
    Set Selenium Speed    1
    Maximize Browser Window
    [Setup]    Log To Console    ${ts1}
    Given Input to the Search Bar and Click on Search Button
    Then Selecting Expected Item Scrolling Into The Element
    [Teardown]    Log To Console    ${tc1}

changing window and getting table
    [Tags]    smoke
    [Setup]    Log To Console    ${ts2}
    Given Scrolling to the Comparision Table of the Items
    #Then Fetching Text From Table
    Then Table
    
    [Teardown]    Log To Console    ${tc2}
    
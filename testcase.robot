*** Settings ***
Documentation    Flipkart Functionality
Resource    ../keyword_flipkart/keyword.robot


Suite Setup    Open My Url And Browser
Suite Teardown    Close Browser

*** Test Cases ***
1:launching Flipkart Url And Closeing The login Popup
    [Documentation]    launching Chrome Url
    [Tags]    Smoke
    [Setup]    Log To Console    ${Test_Case_1_Start}
    Given Clicking On Close Button Of Popup
    [Teardown]    Log To Console    ${Test_Case_1_Stop}   


2:Mouse Over On Fashion Click On Mens T-Shirts And Scroll To Particular Item
    [Documentation]    Mouse Action And Scrolling
    [Tags]    Smoke
    [Setup]    Log To Console    ${Test_Case_2_Start}
    Given MouseOver On Product In Fashion
    Then Scroll To Particular Click And Click
    [Teardown]    Log To Console    ${Test_Case_2_Stop} 


3:Window Handles And Extracting Text From The Table 
    [Documentation]    Window Handles And Extracting Text
    [Tags]    Smoke
    [Setup]    Log To Console    ${Test_Case_3_Start}
    Given Clickon On Size Chart
    Then Extarcting The Text From Table
    When Mouse Over On Size M and Getting Its Text
    [Teardown]    Log To Console    ${Test_Case_3_Stop}

    
    

4:Extracting Data From XLSX File And Validating It's Function
    [Documentation]    Data Driven Test Case
    [Tags]    Sanity
    [Setup]    Log To Console    ${Test_Case_4_Start}    
    Given Data Input From XLSX And Validating It's Working
    And Data Input From XLSX And Validating It's Working For Loop
    When Data Driven With Nested For loop
    [Teardown]    Log To Console    ${Test_Case_4_Stop}


5:Data Extraction From Google Sheet
    [Documentation]    Data Driven Test Case By Using Google Sheet
    [Tags]    Sanity
    [Setup]    Init Sheets    service_account.json
    Given Adding Data to Google ExcelSheet
    And Extracting Data From Google Sheet And Sending Into Search Bar 
    When Deleting Data From Google Excel Sheet
    [Teardown]    Log To Console    ${Test_Case_5_Stop}

6:API Texting On Coin Switch
    [Documentation]    Bit Coin Website API Test
    [Tags]    Regression
    [Setup]    Log To Console    ${Test_Case_6_Start}
    Given API Testing On Coin Switch To Compare Bids Values
    #Then Comparing The Ask Values In Coinbit
    [Teardown]    Log To Console    ${Test_Case_6_Stop}


7:Custom Library
    [Documentation]    Custom Library Analysis
    [Tags]    Regression
    [Setup]    Log To Console    Start
    Given Inputting Item Required Into SearchBar
    When Selecting Products
    Then Getting Into Cart Section For Comparing Values
    [Teardown]    Log To Console    Exit
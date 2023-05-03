*** Settings ***
Resource    ../variable_flipkart/variable.robot
Library    RPA.Cloud.Google
Library    Collections
Library    String
Library    Selenium2Library    timeout=00:00:10
Library    ExcelLibrary
Library    RequestsLibrary
Library    F:/flipkart/Custom_Library/My_First_Library.py

*** Keywords ***

#login popup close
Open My Url And Browser
    Open Browser    ${Url}    ${Browser}
    Maximize Browser Window
Clicking On Close Button Of Popup
    
    Click Button    ${Closing Pop Up Locator}

#mouse over on fashion and click on mens t shirts
MouseOver On Product In Fashion
    Mouse Over    ${Fashion Locator}
    Wait For Element And Click    ${Mens T Shirts LOcator}

    
Scroll To Particular Click And Click
    Wait Until Element Is Visible    ${Shirt Required1 Locator}

    Scroll Element Into View   ${Shirt Required1 Locator}
    wait for element and click    ${Shirt Required1 Locator}


Clickon On Size Chart
    ${windowhandles}    Get Window Handles
    Switch Window    ${windowhandles}[1]
    Wait for Element and Click    ${Size Chart1 Locator}
    


Extarcting The Text From Table
    
    ${Row count}    Selenium2Library.Get Element Count    ${Rows Locator}
    ${Cloumn count}    Selenium2Library.Get Element Count    ${Column Locator}
    Log To Console    Number Of Rows Present:\t ${Row count}
    Log To Console    Number Of Column Present:\t ${Cloumn count}
    FOR    ${Row}    IN RANGE    1    ${Row count}+1    1
        ${Row Header}    Get Text    //*[@class='_2WObml']//tr[${Row}]/td[2]
        Run Keyword If    '${Row Header}' == '${Expected Size Value}'    Exit For Loop
    END
    Log To Console    Selected Size is :\t ${Row Header}
    Log To Console    The Size Present Row is:\t ${Row}

    FOR    ${Column}    IN RANGE    1    ${Cloumn count}+1    1
        ${Column Value}    Get Text    //*[@class='_2WObml']//tr[${Row}]/td[${Column}]
        Log To Console    Column is:\t ${Column}
        IF    "${Column Value}" == "${Expected Value}"
            ${Siz}    Get Text    //*[@class='_2WObml']//tr[${Row}]/td[3]
            Log To Console    The Size Present In Column Is:\t ${Column}
            Log To Console    The Required Brand Size is:\t ${Siz}
        ELSE
            Log To Console    ${Column Value}
        END
        Run Keyword If    "${Column Value}" == "${Expected Value}"    Exit For Loop
        
    END
    Click Button    ${Close Size Chart Locator}
    

Mouse Over On Size M and Getting Its Text
    Wait Until Element Is Visible    ${M Mouse Over Locator}
    Mouse Over    ${M Mouse Over Locator}
    ${Text M mouse over}    Get Text    ${M Mouse Over Locator}
    Log To Console    ${Text M mouse over}
    #Element Text Should Match    ${text_M}    Chest 38-39 inch
    Selenium2Library.Element Text Should Be    ${M Get Text Locator}    Chest 36-37 inch
    Wait for Element And Click    ${Add To Cart Locator}



Wait For Element And Click
    [Arguments]    ${Element}
    Wait Until Element Is Visible    ${Element}
    Click Element    ${Element}



Data Extractor
    [Arguments]    ${File_Path_1}    ${Sheet_Page_Name}    ${Row_In_Sheet}    ${COlumn_In_Sheet}
    Open Excel Document    ${File_Path_1}    1
    Get Sheet    ${Sheet_Page_Name}
    ${Search_Item_Data}    Read Excel Cell    ${Row_In_Sheet}    ${COlumn_In_Sheet}
    [Return]    ${Search_Item_Data}
    Close Current Excel Document

Data Input From XLSX And Validating It's Working
    ${Search_Item_Data_1}    Data Extractor    ${File_Path}    Sheet1    2    1
    Input Text    ${Search_Bar_Locator}    ${Search_Item_Data_1}
    Log To Console    Item Searched here is:\t ${Search_Item_Data_1}
    Wait For Element And Click    ${Search_Button_Locator}
    Wait Until Page Contains    ${Search_Item_Data_1}
    Sleep    2
    ${Search_Item_Data_2}    Data Extractor    ${File_Path}    Sheet1    3    1
    Clear Element Text    ${Search_Bar_Locator}
    Input Text    ${Search_Bar_Locator}    ${Search_Item_Data_2}
    Log To Console    Item Searched here is:\t ${Search_Item_Data_2}
    Wait For Element And Click    ${Search_Button_Locator}
    Wait Until Page Contains    ${Search_Item_Data_2}
    Sleep    2
    ${Search_Item_Data_3}    Data Extractor    ${File_Path}    Sheet1    4    1
    Clear Element Text    ${Search_Bar_Locator}
    Input Text    ${Search_Bar_Locator}    ${Search_Item_Data_3}
    Log To Console    Item Searched here is:\t ${Search_Item_Data_3}
    Wait For Element And Click    ${Search_Button_Locator}
    Wait Until Page Contains    ${Search_Item_Data_3}
    

Data Input From XLSX And Validating It's Working For Loop
    FOR    ${Row_In_Sheet1}    IN RANGE    2    5    1
        ${Search_Item_Data_1}    Data Extractor    ${File_Path}    Sheet1    ${Row_In_Sheet1}    1
        Input Text    ${Search_Bar_Locator}    ${Search_Item_Data_1}
        Log To Console    Item Searched here By Using For Loop is:\t ${Search_Item_Data_1}
        Wait For Element And Click    ${Search_Button_Locator}
        Wait Until Page Contains    ${Search_Item_Data_1}
        
    END


Data Driven With Nested For loop
    FOR    ${Number_Of_Row}    IN RANGE    1    ${Row_Present_IN_File}    1
        FOR    ${Number_Of_Column}    IN RANGE    1    ${Column_Present_IN_File}    1
            ${Search_Item_Data_1}    Data Extractor    ${File_Path_2}    Sheet1    ${Number_Of_Row}    ${Number_Of_Column}
        Input Text    ${Search_Bar_Locator}    ${Search_Item_Data_1}
        Log To Console    Item Searched here By Using Nested For Loop is:\t ${Search_Item_Data_1}
        Wait For Element And Click    ${Search_Button_Locator}
        Wait Until Page Contains    ${Search_Item_Data_1}
            
        END
        
    END



Extracting Data From Google Sheet And Sending Into Search Bar
    ${spreadsheet_content}    Get Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}   
    IF    "values" in ${spreadsheet_content}
        FOR    ${Row_Values}    IN RANGE    0    ${Row_In_GoogleSheet}    1
            ${Json_To_String_Value}    Convert To String    ${spreadsheet_content["values"][${Row_Values}]}
            ${Input_String_Value}    Remove String    ${Json_To_String_Value}    '    '    ]    [
            Clear Element Text    ${Search_Bar_Locator}    
            Input Text    ${Search_Bar_Locator}    ${Input_String_Value}
            Log To Console    Item Searched Here is:\t ${Input_String_Value}
            Wait For Element And Click    ${Search_Button_Locator}
            Wait Until Page Contains    ${Input_String_Value}
        END
    END



Adding Data to Google ExcelSheet
    ${values}    Evaluate    ${Input_Items}
    Insert Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}    ${values}    COLUMNS

Deleting Data From Google Excel Sheet
    Clear Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}





API Testing On Coin Switch To Compare Bids Values
    Go To    ${Url_Coin}
    Wait Until Element Is Visible    ${Trade_Button}    
    Click Button    ${Trade_Button}
    Wait For Element And Click    ${Skip_All}
    Wait For Element And Click    ${Done_Element}    
    Scroll Element Into View    ${Buy_Prize}
    Wait For Element And Click    ${Buy_Prize}    
    Scroll Element Into View    ${Limit_Prize}
    ${Get_Value}    Get Value    ${Limit_Prize}
    Log To Console    Value is:\t${Get_Value}
    #API Value Extraction And Comparing
    Create Session    My_Session    ${Base_url}
    ${Response}    Get Request    My_Session    ${Path_Get_Url}
    #Validation
    ${x}    Evaluate    json.loads('''${Response.content}''')    json
    FOR    ${a}    IN RANGE    0    16    1
        ${z}    Convert To String    ${x['data']['bids'][${a}][0]}
        IF    '${z}' == '${Get_Value}'
            Log To Console    Bids Value Matching The value is:\t ${z}\t ${Get_Value}
        ELSE
            Log To Console    Bids Value Not Matching The values Are:\t ${z}\t ${Get_Value}
        END
        Run Keyword If    '${z}' == '${Get_Value}'    Exit For Loop
    END
    Should Be Equal    ${z}    ${Get_Value}
    

    


Comparing The Ask Values In Coinbit 
    Scroll Element Into View    ${Sell}
    Wait For Element And Click    ${Sell}    
    Scroll Element Into View    ${Limit_Prize}
    ${Get_Value}    Get Value    ${Limit_Prize}
    Log To Console    Value is:\t${Get_Value}
    #API Value Extraction And Comparing
    Create Session    My_Session    ${Base_url}
    ${Response}    Get Request    My_Session    ${Path_Get_Url}
    ${x}    Evaluate    json.loads('''${Response.content}''')    json
    ${z}    Convert To String    ${x['data']['asks'][0][0]}
    #Validation
    ${s}    Should Be Equal    ${z}    ${Get_Value}




#Custom Library

Inputting Item Required Into SearchBar
    Go To    ${url3}
    Wait For Element And Input Text Click    ${Search_Bar}    ${Item_For_Search}    ${Search_Button_Click}
    
Selecting Products
    Wait For Element Scroll To Element And Clickon Element    ${Product_1}

    ${Tabs}    Get Window Handles
    Switch Window    ${Tabs}[1]

    Wait For Element And Click    ${Product_To_Addcart}
    Wait For Element And Click   ${close}

    Switch Window    ${Tabs}[0]
    
    Wait For Element Scroll To Element And Clickon Element    ${Product_2}   

    ${Tabs}    Get Window Handles
    Switch Window    ${Tabs}[2]

    Wait For Element And Click    ${Product_To_Addcart}
    Wait For Element And Click    ${close}

Getting Into Cart Section For Comparing Values
    Wait For Element Scroll To Element And Clickon Element    ${cart}
    
    ${Product_1_Prize_String_Value_Altered}    Getting Text Of Element And RemovingUnwanted String    ${Product_1_Prize}

    ${Product_2_Prize_String_Value_Altered}    Getting Text Of Element And RemovingUnwanted String    ${Product_2_Prize}
    
    ${Total_Prize_String_Value}    Getting Text Of Element And RemovingUnwanted String    ${Total_Prize}
    
    ${Total_Prize_Numerical_Value}    Convert To Number    ${Total_Prize_String_Value}

    ${z}    Add Num    ${Product_1_Prize_String_Value_Altered}    ${Product_2_Prize_String_Value_Altered}
    Log To Console    ${z}
    Should Be Equal    ${z}    ${Total_Prize_Numerical_Value}
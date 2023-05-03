*** Variables ***
#browser instant to the flipkart url
${Url}    https://www.flipkart.com
${Browser}    chrome

#pop_up_close
${Closing Pop Up Locator}    xpath://*[@class='_2KpZ6l _2doB4z']
${Test_Case_1_Start}    testcase popup close started
${Test_Case_1_Stop}    testcase popup close completed

#mouse over on fashion text
${Test_Case_2_Start}    fashion mouse over started
${Test_Case_2_Stop}    fashion mouse over ended
${Fashion Locator}    link:Fashion
${Mens T Shirts LOcator}    link:Men's T-Shirts

#scrool element and click
${Shirt Required1 Locator}    xpath://*[@data-id='TSHGDVSXUFUEFHZZ']
${Shirt Required2 Locator}    xpath://*[@title='Pack of 4 Men Solid Round Neck Silver, Light Blue, Blue, Black T-Shirt']

#click on size chart
${Size Chart1 Locator}    xpath://*[@class='_1qs4Jt']
${Test_Case_3_Start}    click on size chart started
${Test_Case_3_Stop}    click on size chart ended
${Close Size Chart Locator}    xpath://*[@class='_2KpZ6l _1KAjNd']


${M Mouse Over Locator}    xpath:(//*[@class='_3V2wfe _31hAvz'])[8]
${M Get Text Locator}    xpath:(//*[@class='_3Oikkn _3_ezix _2KarXJ _31hAvz'])[8]

#table
${Table Locator}    xpath:(//*[contains(text(),'M')])[4]
${Rows Locator}    xpath://*[@class='_2WObml']//tbody//tr
${Column Locator}    xpath://*[@class='_2WObml']//tbody//tr[1]//td
${Expected Value}    S
${Expected Size Value}    36-37

${Add To Cart Locator}    xpath://*[@class='_2KpZ6l _2U9uOA _3v1-ww']


#Search Bar
${Search_Bar_Locator}    xpath://*[@name='q']
${Search_Button_Locator}    xpath://*[@type='submit']



#Data Extractor
${File_Path}    F:/flipkart/dataprovider/data.xlsx
${Test_Case_4_Start}    Data Driven Started
${Test_Case_4_Stop}    Data Driven Ended
${File_Path_2}    F:/flipkart/dataprovider/Data2.xlsx
${Row_Present_IN_File}    4
${Column_Present_IN_File}    3


#google excel data extractor
${SHEET_ID}         1Nc9ki8SV5TGbY4XxNrOZb0mx1JWDaghvwUwrGFmP9VE
${SHEET_RANGE}      Sheet1!A1:A11

${Input_Items}    [["Cloth", "Toys", "Jewellery", "Dog Food", "Glass"]]
${Input_Items_1}    [["Bat", "Ball", "Heart"]]

${Row_In_GoogleSheet}    5
${Column_In_GoogleSheet}    1
${Test_Case_5_Stop}    Api testing ended


#API on coins
${Url_Coin}    https://coinswitch.co/pro/
${Trade_Button}    xpath://*[contains(text(),'TRADE NOW')]
${Skip_All}    xpath://*[contains(text(),'Skip All')]
${Done_Element}    xpath://*[contains(text(),'Done')]
#${Buy_Prize}    xpath://*[@class='tw-flex-1 tw-text-right tw-text-green-01 lg:tw-text-center']
${Limit_Prize}    xpath://*[@inputmode='decimal']
#${Buy_Prize}    (//*[@class='tw-p tw-relative tw-mb-[1px] tw-flex tw-w-full tw-cursor-pointer tw-border-gray-800 tw-text-xxs lg:tw-border-r lg:tw-p-1 lg:tw-text-xs'])[1]
${Buy_Prize}    (//*[@class='tw-relative tw-cursor-pointer'])[13]

${Base_url}    https://coinswitch.co/pro/
${Path_Get_Url}    /api/v1/realtime-rates/depth?symbol=btc,inr&exchange=csx



${Sell}    xpath:(//*[@class='tw-flex-1 tw-text-left tw-text-gray-400 lg:tw-text-center'])[11]

${Test_Case_6_Start}    Api testing Started
${Test_Case_6_Stop}    Api testing Ended





#Custon Library
${url3}    https://www.amazon.in/?ref_=icp_country_from_us
${browser}    chrome
${Search_Bar}    //*[@id='twotabsearchtextbox']
${Item_For_Search}    iphone 14 pro max
${Search_Button_Click}    //*[@id='nav-search-submit-button']
${Product_1}    (//*[@class='a-size-medium a-color-base a-text-normal'])[1]
#${a_Size}    xpath:(//*[@class='a-button-input'])[2]
${Product_To_Addcart}    //*[@id='submit.add-to-cart']
${close}    //*[@id='attach-close_sideSheet-link']
${Product_2}    (//*[@class='a-size-medium a-color-base a-text-normal'])[2]

${cart}    (//*[@id='nav-cart-count-container'])
${Product_1_Prize}    (//*[@class='a-size-medium a-color-base sc-price sc-white-space-nowrap sc-product-price a-text-bold'])[1]
${Product_2_Prize}    (//*[@class='a-size-medium a-color-base sc-price sc-white-space-nowrap sc-product-price a-text-bold'])[2]

${Total_Prize}    (//*[@class='a-size-medium a-color-base sc-price sc-white-space-nowrap'])[1]
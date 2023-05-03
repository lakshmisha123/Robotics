*** Settings ***
Library    Selenium2Library

*** Variables ***

#browser launch variables
${url}    https://www.amazon.in
${browser}  chrome


#search bar variables
${search_bar}    xpath://*[@id='twotabsearchtextbox']
${item}    iphone pro 14 max
${search_bar_click_button}    //*[@type='submit']

${ts1}    start amazon and search for a product
${tc1}    end searching of productS


#selecting item
${item_selected}    link:Apple iPhone 14 Pro Max (1 TB) - Space Black



#table
${ts2}    start scrolling to table
${tc2}    end scrolling
${scro_item}    xpath:(//*[@class='content-grid-row-wrapper '])[11]
${table_full}    Xpath://*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']

#fetching text
${tablerow1}    xpath:(//*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr)
${tablecolumn1}    xpath:(//*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[1]//td)
${expected}    Chip
${expect2}    A16 Bionic chip,6-core CPU with 2 performance cores and 4 efficiency cores, 5-core GPU, 16-core Neural Engine
${chip}    Xpath://*[contains(text(),'Chip')]





#table
${t1}    xpath:(//*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table'])
${tr}    xpath:(//*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr)
${tc}    xpath:(//*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[1]//td)


${t}    xpath://*[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr//td
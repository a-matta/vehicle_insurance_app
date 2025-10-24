***Settings***
Library     Browser
Library     FakerLibrary

Test Setup          Open Insurance Application

***Variables***
${BROWSER}      chromium
${URL}      https://sampleapp.tricentis.com/

***Keywords***
Open Insurance Application
    New Browser    ${BROWSER}    headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page
    Go To       url=${URL}    timeout=60000    wait_until=domcontentloaded
    ${title}=      Get Title
    Log            Page title: ${title}
    Should Contain    ${title}    Tricentis

Fill Truck Data For Automobile
    Wait For Elements State    xpath=(//div[@class="main-navigation"]//*[@id="nav_truck"])[1]    visible    20000
    Click       xpath=(//div[@class="main-navigation"]//*[@id="nav_truck"])
    Sleep    10s
    Select Options By      xpath=(//*[@id="make"])   text     Audi
    Fill Text   xpath=(//*[@id="engineperformance"])    200
    Fill Text   xpath=(//*[@id="dateofmanufacture"])    03/11/1990
    Select Options By      xpath=(//*[@id="numberofseats"])   text     4
    Select Options By      xpath=(//*[@id="fuel"])   text     Gas
    Fill Text   xpath=(//*[@id="payload"])    200
    Fill Text   xpath=(//*[@id="totalweight"])    100
    Fill Text   xpath=(//*[@id="listprice"])    500
    Fill Text   xpath=(//*[@id="licenseplatenumber"])    11
    Fill Text   xpath=(//*[@id="annualmileage"])    100
    Wait For Elements State    xpath=(//*[@id="nextenterinsurantdata"])    visible    10000
    Click    xpath=(//*[@id="nextenterinsurantdata"])    middle


Enter Insurance Data
    ${username}=    FakerLibrary.User Name
    Wait For Elements State    xpath=(//*[@id="firstname"])    visible    10000
    Fill Text   xpath=(//*[@id="firstname"])    ${username}

# End Test
#     Close Context
#     Close Browser

***Test Cases***
Create Quote For Automobile
    Fill Truck Data For Automobile
    #Enter Insurance Data
    #End Test
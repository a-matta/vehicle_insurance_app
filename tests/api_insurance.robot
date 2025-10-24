***Settings***
Library     Browser

Test Setup          Open Insurance Application
#Test Teardown       Close All Browsers

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

Fill Vehicle Data For Automobile
    Click       xpath=(//div[@class="main-navigation"]//*[@id="nav_automobile"])
    Select Options By      xpath=(//*[@id="make"])   text     BMW
    Fill Text   xpath=(//*[@id="engineperformance"])    200
    Fill Text   xpath=(//*[@id="dateofmanufacture"])    03/11/1990
    Select Options By      xpath=(//*[@id="numberofseats"])   text     8
    Select Options By      xpath=(//*[@id="fuel"])   text     Other
    

***Test Cases***
Create Quote For Automobile
    Fill Vehicle Data For Automobile
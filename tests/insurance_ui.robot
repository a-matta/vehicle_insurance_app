***Settings***
Library     Browser

Test Setup          Open Insurance Application
#Test Teardown       Cleanup Browsers

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

Fill Vehicle Data for Motorcycle
    Click    div.main-navigation >> "Motorcycle"
    Sleep    5s
    Select Options By    xpath=(//*[@id="make"])    text    Audi
    Select Options By    xpath=(//*[@id="model"])    text    Scooter
    Fill Text    xpath=(//*[@id="cylindercapacity"])    2
    Fill Text    xpath=(//*[@id="engineperformance"])    100
    Fill Text   xpath=(//*[@id="dateofmanufacture"])    03/11/1990
    Select Options By    xpath=(//*[@id="numberofseatsmotorcycle"])    text    1
    Fill Text    xpath=(//*[@id="listprice"])    500
    Fill Text   xpath=(//*[@id="annualmileage"])    100
    Click    xpath=(//*[@id="nextenterinsurantdata"])    middle

Enter Insurance Data
    Wait For Elements State    xpath=(//*[@id="firstname"])    visible    10000
    Fill Text   xpath=(//*[@id="firstname"])    amrita


Cleanup Browsers
    Run Keyword And Ignore Error    Close Context
    Run Keyword And Ignore Error    Close Browser

End Test
    Log    Test finished

***Test Cases***
Create Quote For Automobile
    Fill Vehicle Data for Motorcycle
    Enter Insurance Data
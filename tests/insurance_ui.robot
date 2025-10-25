*** Settings ***
Library             Browser
Library             FakerLibrary

Test Setup          Open Insurance Application
Test Teardown       Cleanup Browsers


*** Variables ***
${BROWSER}      chromium
${URL}          https://sampleapp.tricentis.com/


*** Test Cases ***
Create Quote For Automobile
    Fill Vehicle Data for Motorcycle
    Enter Insurance Data
    Enter Product Data


*** Keywords ***
Open Insurance Application
    New Browser    ${BROWSER}    headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page
    Go To    url=${URL}    timeout=60000    wait_until=domcontentloaded
    ${title}=    Get Title
    Log    Page title: ${title}
    Should Contain    ${title}    Tricentis

Fill Vehicle Data for Motorcycle
    Click    div.main-navigation >> "Motorcycle"
    Sleep    2s
    Select Options By    xpath=(//*[@id="make"])    text    Audi
    Select Options By    xpath=(//*[@id="model"])    text    Scooter
    Fill Text    xpath=(//*[@id="cylindercapacity"])    2
    Fill Text    xpath=(//*[@id="engineperformance"])    100
    Fill Text    xpath=(//*[@id="dateofmanufacture"])    03/11/1990
    Select Options By    xpath=(//*[@id="numberofseatsmotorcycle"])    text    1
    Fill Text    xpath=(//*[@id="listprice"])    500
    Fill Text    xpath=(//*[@id="annualmileage"])    100
    Click    xpath=(//*[@id="nextenterinsurantdata"])

Enter Insurance Data
    Wait For Elements State    xpath=(//*[@id="firstname"])    visible    10000
    ${username}=    FakerLibrary.UserName
    Fill Text    xpath=(//*[@id="firstname"])    ${username}
    ${lastname}=    FakerLibrary.LastName
    Fill Text    xpath=(//*[@id="lastname"])    ${lastname}
    ${date}=    FakerLibrary.DateOfBirth
    Fill Text    xpath=(//*[@id="birthdate"])    ${date}
    Sleep    15s
    Check Checkbox    xpath=(//*[@id="gendermale"])
    ${address}=    FakerLibrary.Address
    Fill Text    id=streetaddress    ${address}
    Select Options By    id=country    text    Germany
    Fill Text    id=zipcode    40123
    Fill Text    id=city    Essen
    Select Options By    id=occupation    text    Employee
    Click    text=Cliff Diving
    Click    xpath=(//*[@id="nextenterproductdata"])

Enter Product Data
    ${date}=    FakerLibrary.DateOfBirth
    Fill Text    xpath=(//*[@id="startdate"])    ${date}
    Select Options By    xpath=(//*[@id="insurancesum"])    text    3.000.000,00
    Select Options By    xpath=(//*[@id="damageinsurance"])    text    No Coverage
    Check Checkbox    xpath=(//*[@id="EuroProtection"])
    Select Options By    xpath=(//*[@id="courtesycar"])    text    Yes
    Click    xpath=(//*[@id="nextselectpriceoption"])
    Sleep    10s

Cleanup Browsers
    Run Keyword And Ignore Error    Close Context
    Run Keyword And Ignore Error    Close Browser

End Test
    Log    Test finished

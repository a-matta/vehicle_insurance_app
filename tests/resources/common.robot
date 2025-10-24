*** Settings ***
Library     DateTime
Library     FakerLibrary


*** Keywords ***
Create New User Data In Test Context
    ${username}=    FakerLibrary.User Name
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password
    ${confirm_password}=    Set Variable    ${password}
    &{user_data}=   Create Dictionary
    ...    username=${username}
    ...    email=${email}
    ...    password=${password}
    ...    confirm_password=${confirm_password}
    RETURN    ${user_data}

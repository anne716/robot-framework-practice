*** Settings ***
Library    FakerLibrary

*** Variables ***

*** Test Cases ***
user_profile
    info

*** Keywords ***
info
    ${address}=        FakerLibrary.address
    ${country}=        FakerLibrary.country
    ${email}=          FakerLibrary.email
    ${firstName}=      FakerLibrary.First Name
#    ${middleName}=     FakerLibrary.Middle Name
    ${lastName}=       FakerLibrary.Last Name
    ${profile}=    Catenate
    ...                ${\n}===========================
    ...                ${\n}address: ${address}
    ...                ${\n}country: ${country}
    ...                ${\n}email: ${email}
    ...                ${\n}first_name: ${firstName}
#    ...                ${\n}middle_name: ${middleName}
    ...                ${\n}last_name: ${lastName}
    ...                ${\n}===========================
    Log To Console    ${profile}
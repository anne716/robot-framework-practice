*** Settings ***
Documentation    TestDemonstration
Library          SeleniumLibrary
Test Setup       Open the URL
Test Teardown    Close Browser

Resource         resource.robot

*** Variables ***
${USERNAME}    Admin
${PASSWORD}    admin1233
${TIME}        30 seconds

*** Test Cases ***
OrangeHRMWebsite
    HRMWebsiteLogin    ${USERNAME}        ${PASSWORD}

*** Keywords ***
HRMWebsiteLogin
    [Arguments]        ${USERNAME}        ${PASSWORD}
        Maximize Browser Window
        Set Selenium Implicit Wait    ${TIME}
        Input Text    name:username    ${USERNAME}
        Input Text    name:password    ${PASSWORD}
        Click Element    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
        Sleep    10
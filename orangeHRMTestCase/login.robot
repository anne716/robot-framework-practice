*** Settings ***
Documentation    TestDemonstration
Library          SeleniumLibrary
Test Setup       Open the URL
Test Teardown    Close Browser

Resource         resource.robot

*** Variables ***
${USERNAME}    Admin
${PASSWORD}    admin123
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
        Element Text Should Be    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6    Dashboard
        ${noOfLinks}=    get element count    xpath://a
        log to console   ${noOfLinks}
        Sleep    10
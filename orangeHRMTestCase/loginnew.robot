*** Settings ***
Documentation    TestDemonstration
Library          SeleniumLibrary
Test Setup       Open the URL
Test Teardown    Close Browser
Resource         resource.robot
Test Template    HRMWebsiteLogin

*** Variables ***
${USERNAME}    Admin
${PASSWORD}    admin123
${TIME}        30 seconds

*** Test Cases ***
                        user                pass
Invalid username        UserAdmin           admin123
Invalid password        Admin               admin1234
Invalid characters      abc@#               admin123


*** Keywords ***
HRMWebsiteLogin
    [Arguments]        ${user}        ${pass}
        Maximize Browser Window
        Set Selenium Implicit Wait    ${TIME}
        Input Text    name:username    ${user}
        Input Text    name:password    ${pass}
        Click Element    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
        Sleep    10
        ${noOfLinks}=    get element count    xpath://a
        log to console   ${noOfLinks}
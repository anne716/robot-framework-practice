*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}     Chrome
${URL}         https://opensource-demo.orangehrmlive.com/
${USERNAME}    Admin
${PASSWORD}    admin123
${TIME}        30 seconds

*** Test Cases ***
OrangeHRMWebsite
    HRMWebsiteLogin

*** Keywords ***
HRMWebsiteLogin
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIME}
    Input Text    name:username    ${USERNAME}
    Input Text    name:password    ${PASSWORD}
    Click Element    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Sleep    10
*** Settings ***
Documentation    TestDemonstration
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${LoginUrl}        https://opensource-demo.orangehrmlive.com/
${browser}         Chrome
${ImplicitWait}    30 seconds
${timer}           5 seconds
${DashboardUrl}    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${LoginTitle}      OrangeHRM

*** Test Cases ***
HRMWebsiteLogin
    Given web app is accessed
    When user logs in using Admin and admin123 credentials
    And user clicks the login button
    Then user should be authenticated

*** Keywords ***
Web app is accessed
    Open Browser    ${LoginUrl}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${ImplicitWait}
    
User logs in using ${username} and ${password} credentials
    Input Text    name:username    ${username}
    Input Text    name:password    ${password}
    Sleep         ${timer}

User clicks the login button
    Click Element    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

User should be authenticated
    Location Should Be        ${DashboardUrl}
    Title Should Be           ${LoginTitle}
    Element Text Should Be    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6    Dashboard
    Sleep                     ${timer}
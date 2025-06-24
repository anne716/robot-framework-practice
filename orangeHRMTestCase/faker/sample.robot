*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=en_PH
Test Teardown    Close Browser

*** Variables ***
${LoginUrl}           https://opensource-demo.orangehrmlive.com/
${DashboardUrl}       https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${EmployeeListUrl}    https://opensource-demo.orangehrmlive.com/web/index.php/pim/viewEmployeeList
${AddEmployeeUrl}     https://opensource-demo.orangehrmlive.com/web/index.php/pim/addEmployee
${browser}            Chrome
${username}           Admin
${pass}               admin123
${ImplicitWait}       30 seconds
${InputTimer}         0.5 seconds
${DisplayTimer}       5 seconds

# Sample Data (Faker)
#${FirstName}          FakerLibrary.First Name
#${MiddleName}         faker.Middle Name
#${LastName}           FakerLibrary.Last Name

*** Test Cases ***
AddEmployee
    Given user is logged in
    When user navigates to employee list
    And clicks the add button
    And fills the employee details
    And clicks the save button
    Then employee is added

*** Keywords ***
User is logged in
    Open Browser    ${LoginUrl}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${ImplicitWait}
    Input Text    name:username    ${username}
    Sleep    ${InputTimer}
    Input Text    name:password    ${pass}
    Click Element    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
#    Location Should Be    ${DashboardUrl}
    Title Should Be    OrangeHRM
    Element Text Should Be    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6    Dashboard
    Sleep    ${DisplayTimer}

User navigates to employee list
    Go To    ${EmployeeListUrl}
    Element Text Should Be    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6    PIM
    Sleep    ${DisplayTimer}

Clicks the add button
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[1]/button

Fills the employee details
    Location Should Be        ${AddEmployeeUrl}
    Element Text Should Be    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/h6    Add Employee
    ${FirstName}=             FakerLibrary.First Name
    Input Text                name:firstName    ${FirstName}
#    Sleep                     ${InputTimer}
#    ${MiddelName}            FakerLibrary.Middle Name
#    Input Text                name:middleName    ${MiddleName}
    Sleep                     ${InputTimer}
    ${LastName}=              FakerLibrary.Last Name
    Input Text                name:lastName    ${LastName}
    Sleep                     ${InputTimer}

Clicks the save button
    Click Element    xpath://*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/button[2]

Employee is added
    Element Text Should Be    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/h6    Personal Details
    Sleep    1 minute
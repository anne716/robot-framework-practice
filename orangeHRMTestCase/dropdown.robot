*** Settings ***
Documentation    DropdownAlert
Library          SeleniumLibrary


*** Variables ***
${URL}        https://training.qaonlinetraining.com/testPage.php
${BROWSER}    Chrome


*** Test Cases ***
RadioButton and Checkbox
    Perform Click on Button

Dropdown Elements
    Select Value

Alert Test
    Alert Click


*** Keywords ***
Perform Click on Button
    Open Browser        ${URL}        ${BROWSER}
    Maximize Browser Window
    Click Element       xpath:/html/body/form/input[4]
    Sleep               10
    Click Element       xpath:/html/body/form/input[10]

Select Value
    Select From List By Label    country    India
    Sleep                        10
    Click Element                name:submit

Alert Click
    Click Element    id:alert
    Handle Alert     accept
    Sleep            10
    Click Element    id:confirm
    Handle Alert     dismiss
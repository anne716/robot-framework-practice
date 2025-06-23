*** Settings ***
Documentation        Test case to execute the login process
Library              SeleniumLibrary


*** Variables ***
${BROWSER}     Chrome
${URL}         https://opensource-demo.orangehrmlive.com/


*** Keywords ***
Open the URL
    Open Browser    ${URL}    ${BROWSER}
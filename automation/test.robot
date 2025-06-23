*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
OrangeHRMWebsite
    Open Browser    https://opensource-demo.orangehrmlive.com/    Chrome
    Sleep    5
    Close Browser

*** Keywords ***

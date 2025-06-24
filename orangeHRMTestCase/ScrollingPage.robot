*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ScrollingTest
    Open Browser    https://www.countries-ofthe-world.com/flags-of-the-world.html    Chrome
    Maximize Browser Window
#    Execute Javascript    window.scrollTo(0,2500)
#    Scroll Element Into View    xpath://*[@id="ct-list"]/table[2]/tbody/tr[73]/td[1]/img
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)    # end of the page
    Sleep    5
    Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)    # starting point
    Sleep    5
*** Settings ***
Library    Selenium2Library

*** Variables ***
${USERNAME}       test
${PASSWORD}       test123
${URL}            http://localhost:5000/
${SUCCESS URL}    http://localhost:5000/success
${BROWSER}        CHROME

*** Test Cases ***
[TC-001]-Launching the browser and login
    Launch Browser
    Fill login form
    Check if successful

*** Keywords ***
Launch Browser
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
Fill login form
    Input Text    name=username_input    ${USERNAME}
    Input Text    name=password_input    ${PASSWORD}
    Click Button    name=login
Check if successful
    Set Selenium Implicit Wait    5 Seconds
    Location Should Be    ${SUCCESS URL}
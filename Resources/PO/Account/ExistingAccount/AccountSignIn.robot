*** Settings ***
Library    SeleniumLibrary
Resource    ../../../GlobalVariables.robot

*** Variables ***
${emailInput}=  xpath://input[@id='dwfrm_login_email']
${passwordInput}=  xpath://input[@id='dwfrm_login_password']
${submit}=  xpath://button[contains(text(),'Login')]
${emailInputText}=  ${existingEmailAddress}
${passwordInputText}=   ${existingEmailPassword}
${expectedUrl}=     https://development.tulipcremation.com/dashboard/
${loginUrl}=    xpath://a[@title='Sign In']
*** Keywords ***
Verify Account Login
    click element   ${loginUrl}
    input text    ${emailinput}     ${emailInputText}
    input text    ${passwordinput}      ${passwordInputtext}
    wait until element is visible       ${submit}
    scroll element into view    ${submit}
    click button    ${submit}
    wait until page contains    Welcome back,
    ${current_url}=     Get Location
    should be equal as strings      ${current_url}      ${expectedUrl}





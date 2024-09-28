*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../CustomLibraries/DynamicAccount.robot

*** Variables ***
${firstNameInput}=      xpath://input[@id='dwfrm_profile_customer_firstname']
${lastNameInput}=       xpath://input[@id='dwfrm_profile_customer_lastname']
${phoneNumberInput}=    xpath://input[@id='dwfrm_profile_customer_phone']
${signupEmailInput}=          css:[placeholder='Email']
${confirmEmailInput}=   xpath://input[@id='dwfrm_profile_customer_emailconfirm']
${signupPasswordInput}=       css:[placeholder='Password']
${confirmPasswordInput}=        xpath://input[@id='dwfrm_profile_login_passwordconfirm']
${signUpAgreementCheckbox}=     xpath://input[@id='dwfrm_profile_customer_agreeToPrivacy']
${createAccountButton}=     xpath://button[contains(text(),'Create Account')]
${expectedUrl}=     https://development.tulipcremation.com/dashboard/


#Static Test Data
${firstNameInputText}=      Dhruv
${phoneNumberInputText}=    9863959394
${passwordInputText}=       Asd123!@#
${emailInputBase}=      d.kaneriya    # Base part of the email

*** Keywords ***
Verify Account SignUp
    ${lastNameInputText}=    Generate Dynamic Last Name
    ${emailInputText}=      Generate Dynamic Email    ${emailInputBase}    ${lastNameInputText}
    Go To    https://development.tulipcremation.com/registration/?rurl=1
    Input Text    ${firstNameInput}     ${firstNameInputText}
    Input Text    ${lastNameInput}      ${lastNameInputText}
    Input Text    ${phoneNumberInput}    ${phoneNumberInputText}
    Input Text    ${signupEmailInput}         ${emailInputText}
    Input Text    ${confirmEmailInput}   ${emailInputText}
    Input Text    ${signupPasswordInput}      ${passwordInputText}
    Input Text    ${confirmPasswordInput}      ${passwordInputText}
    scroll element into view    ${signUpAgreementCheckbox}
    select checkbox     ${signUpAgreementCheckbox}
    scroll element into view    ${createAccountButton}
    Click Button    ${createAccountButton}
    wait until page contains    Welcome back,       timeout=20s
    ${current_url}=     Get Location
    should be equal as strings      ${current_url}      ${expectedUrl}

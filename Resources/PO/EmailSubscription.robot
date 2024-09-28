*** Settings ***
Library    SeleniumLibrary
Resource    ../CustomLibraries/DynamicAccount.robot

*** Variables ***
${newsletterInput}=   xpath://input[starts-with(@id, 'dwfrm_emailsubscribe_email')]
${newsletterSubmit}=   xpath://button[contains(text(),'Sign up')]
${newsletterAgreementCheckbox}=   xpath://input[@id='dwfrm_emailsubscribe_agreeToPrivacy']
${newsletterSuccessMessage}=    css:.b-newsletters-message_success

*** Keywords ***
Verify Email Subscription
    ${lastNameInputText}=    Generate Dynamic Last Name
    ${emailSubscription}=   Generate Dynamic Email      d.kaneriya      ${lastNameInputText}
    input text      ${newsletterInput}     ${emailSubscription}
    scroll element into view    ${newsletteragreementcheckbox}
    select checkbox    ${newsletterAgreementCheckbox}
    click button    ${newsletterSubmit}
    wait until element is visible       ${newsletterSuccessMessage}     5s


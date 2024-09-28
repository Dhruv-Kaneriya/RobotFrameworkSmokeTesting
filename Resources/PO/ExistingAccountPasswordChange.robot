*** Settings ***
Library    SeleniumLibrary
Resource    ../GlobalVariables.robot

*** Variables ***
${changePasswordLink}=   xpath://a[@href='/changepassword/']
${changePasswordBreadcrumb}=   xpath://ul[@class='b-breadcrumbs-list']//li//a[contains(.,"Change Password")]
${currentPasswordInput}=   xpath://input[@id='dwfrm_changePassword_currentpassword']
${currentPasswordInputText}=     ${existingEmailPassword}
${newPasswordInput}=    xpath://input[@id='dwfrm_changePassword_newpassword']
${newConfirmPasswordInput}=   xpath://input[@id='dwfrm_changePassword_newpasswordconfirm']
${saveDetails}=     xpath://button[@name='save']
${changepasswordRedirectToAccountExpectedUrl}=     https://development.tulipcremation.com/account/?redirectedFrom=changePassword
${newPasswordInputText}=    Asd123!@#
${successMessage}=  xpath://div[contains(text(),'Your password has been successfully changed')]

*** Keywords ***
Change Account Password from Profile
    scroll element into view    ${changePasswordLink}
    click element       ${changePasswordLink}
    wait until element is visible    ${changePasswordBreadcrumb}
    input text    ${currentPasswordInput}   ${currentPasswordInputText}
    scroll element into view     ${newPasswordInput}
    input text    ${newPasswordInput}   ${newPasswordInputText}
    scroll element into view     ${newConfirmPasswordInput}
    input text    ${newConfirmPasswordInput}    ${newPasswordInputText}
    Log     Password Changed successfully to ${newPasswordInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    5s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${changepasswordRedirectToAccountExpectedUrl}
    wait until element is visible    ${successmessage}  timeout=10s
    element text should be    ${successmessage}     Your password has been successfully changed
    scroll element into view    ${changePasswordLink}
    click element       ${changePasswordLink}
    wait until element is visible    ${changePasswordBreadcrumb}
    input text    ${currentPasswordInput}   ${newPasswordInputText}
    scroll element into view     ${newPasswordInput}
    input text    ${newPasswordInput}   ${currentPasswordInputText}
    scroll element into view     ${newConfirmPasswordInput}
    input text    ${newConfirmPasswordInput}    ${currentPasswordInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    5s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${changepasswordRedirectToAccountExpectedUrl}
    wait until element is visible    ${successmessage}  timeout=10s
    element text should be    ${successmessage}     Your password has been successfully changed
    Log     Password Changed Back to Old: ${currentPasswordInputText}




*** Settings ***
Library    SeleniumLibrary
Resource    ../../../GlobalVariables.robot
Resource    ../AccountPagesGlobalVariables.robot

*** Variables ***
${currentExistingAccountPasswordInputText}=     ${existingEmailPassword}
${changepasswordRedirectToAccountExpectedUrl}=     https://development.tulipcremation.com/account/?redirectedFrom=changePassword
${newExistingAccountPasswordInputText}=    Asd123!@#

*** Keywords ***
Change Account Password from Profile
    scroll element into view    ${changePasswordLink}
    click element       ${changePasswordLink}
    wait until element is visible    ${changePasswordBreadcrumb}
    input text    ${currentPasswordInput}   ${currentExistingAccountPasswordInputText}
    scroll element into view     ${newPasswordInput}
    input text    ${newPasswordInput}   ${newExistingAccountPasswordInputText}
    scroll element into view     ${newConfirmPasswordInput}
    input text    ${newConfirmPasswordInput}    ${newExistingAccountPasswordInputText}
    Log     Password Changed successfully to ${newExistingAccountPasswordInputText}
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
    input text    ${currentPasswordInput}   ${newExistingAccountPasswordInputText}
    scroll element into view     ${newPasswordInput}
    input text    ${newPasswordInput}   ${currentExistingAccountPasswordInputText}
    scroll element into view     ${newConfirmPasswordInput}
    input text    ${newConfirmPasswordInput}    ${currentExistingAccountPasswordInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    5s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${changepasswordRedirectToAccountExpectedUrl}
    wait until element is visible    ${successmessage}  timeout=10s
    element text should be    ${successmessage}     Your password has been successfully changed
    Log     Password Changed Back to Old: ${currentExistingAccountPasswordInputText}
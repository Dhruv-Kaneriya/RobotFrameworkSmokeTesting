*** Settings ***
Library    SeleniumLibrary
Resource    ../../../GlobalVariables.robot
Resource    ../AccountPagesGlobalVariables.robot

*** Variables ***
${currentNewAccountPasswordInputText}=     ${newEmailPassword}
${newNewAccountPasswordPasswordInputText}=    Asd123!@#

*** Keywords ***
Change Account Password from Profile
    scroll element into view    ${changePasswordLink}
    click element       ${changePasswordLink}
    wait until element is visible    ${changePasswordBreadcrumb}
    input text    ${currentPasswordInput}   ${currentNewAccountPasswordInputText}
    scroll element into view     ${newPasswordInput}
    input text    ${newPasswordInput}   ${newNewAccountPasswordPasswordInputText}
    scroll element into view     ${newConfirmPasswordInput}
    input text    ${newConfirmPasswordInput}    ${newNewAccountPasswordPasswordInputText}
    Log     Password Changed successfully to ${newNewAccountPasswordPasswordInputText}
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
    input text    ${currentPasswordInput}   ${newNewAccountPasswordPasswordInputText}
    scroll element into view     ${newPasswordInput}
    input text    ${newPasswordInput}   ${currentNewAccountPasswordInputText}
    scroll element into view     ${newConfirmPasswordInput}
    input text    ${newConfirmPasswordInput}    ${currentNewAccountPasswordInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    5s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${changepasswordRedirectToAccountExpectedUrl}
    wait until element is visible    ${successmessage}  timeout=10s
    element text should be    ${successmessage}     Your password has been successfully changed
    Log     Password Changed Back to Old: ${currentNewAccountPasswordInputText}
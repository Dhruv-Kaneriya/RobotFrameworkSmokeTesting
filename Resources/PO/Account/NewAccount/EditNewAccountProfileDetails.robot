*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../../../GlobalVariables.robot
Resource    ../AccountPagesGlobalVariables.robot

*** Variables ***
${passwordNewAccountInputText}=       ${newEmailPassword}
${newNewAccountPhoneNumber}=  7890123456
${oldNewAccountPhoneNumber}=  ${phoneNumberInputText}

*** Keywords ***
Edit Profile Details
    scroll element into view    ${editDetailsLink}
    click element       ${editDetailsLink}
    wait until element is visible    ${personalDetailsBreadcrumb}
    clear element text    ${editPhoneNumber}
    input text     ${editPhoneNumber}   ${newNewAccountPhoneNumber}   clear=True
    input text    ${passwordInputLocator}      ${passwordNewAccountInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    10s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${redirectExpectedUrl}
    ${updatedPhoneNumber}=    Get Text    ${phoneNumber}
    ${normalizedUpdatedNumber}=     Normalize Phone Number    ${updatedPhoneNumber}
    should be equal as strings    ${normalizedUpdatedNumber}     ${newNewAccountPhoneNumber}
    Log    Phone number updated successfully to ${normalizedUpdatedNumber}.
    scroll element into view    ${editDetailsLink}
    click element       ${editDetailsLink}
    wait until element is visible    ${personalDetailsBreadcrumb}
    input text     ${editPhoneNumber}   ${oldNewAccountPhoneNumber}   clear=True
    input text    ${passwordInputLocator}      ${passwordNewAccountInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    10s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${redirectExpectedUrl}
    Log    Phone number reverted back to old successfully: ${oldNewAccountPhoneNumber}.


Normalize Phone Number
    [Arguments]    ${phoneNumber}
    ${normalized}   set variable    ${none}
    ${characters}=    split string to characters    ${phoneNumber}
    FOR    ${char}    IN    @{characters}
        ${is_digit}=    Run Keyword And Return Status    Should Match Regexp    ${char}    [0-9]
        IF    ${is_digit}
                    ${normalized}=  set variable    ${normalized}${char}
        END
        log    ${normalized}
    END
    ${normalized}=  set variable    ${normalized}[5:]
    RETURN    ${normalized}
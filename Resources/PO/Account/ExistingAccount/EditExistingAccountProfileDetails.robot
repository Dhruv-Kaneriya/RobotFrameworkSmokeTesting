*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../../../GlobalVariables.robot
Resource    ../AccountPagesGlobalVariables.robot

*** Variables ***
${passwordExistingAccountInputText}=       ${existingEmailPassword}
${newExistingAccountPhoneNumber}=  9804285848
${oldExistingAccountPhoneNumber}=   6385852131

*** Keywords ***
Edit Profile Details
    scroll element into view    ${editDetailsLink}
    click element       ${editDetailsLink}
    wait until element is visible    ${personalDetailsBreadcrumb}
    clear element text    ${editPhoneNumber}
    input text     ${editPhoneNumber}   ${newExistingAccountPhoneNumber}   clear=True
    input text    ${passwordInputLocator}      ${passwordExistingAccountInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    10s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${redirectFromEditAccountDetailsExpectedUrl}
    ${updatedPhoneNumber}=    Get Text    ${phoneNumber}
    ${normalizedUpdatedNumber}=     Normalize Phone Number    ${updatedPhoneNumber}
    should be equal as strings    ${normalizedUpdatedNumber}     ${newExistingAccountPhoneNumber}
    Log    Phone number updated successfully to ${normalizedUpdatedNumber}.
    scroll element into view    ${editDetailsLink}
    click element       ${editDetailsLink}
    wait until element is visible    ${personalDetailsBreadcrumb}
    input text     ${editPhoneNumber}   ${oldExistingAccountPhoneNumber}   clear=True
    input text    ${passwordInputLocator}      ${passwordExistingAccountInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    10s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${redirectFromEditAccountDetailsExpectedUrl}
    Log    Phone number reverted back to old successfully: ${oldExistingAccountPhoneNumber}.


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
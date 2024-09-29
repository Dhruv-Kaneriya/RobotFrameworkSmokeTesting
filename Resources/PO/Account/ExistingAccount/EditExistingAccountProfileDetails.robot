*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../../../GlobalVariables.robot

*** Variables ***
${phoneNumber}=     css:[data-tau] > li:nth-of-type(3)
${editDetailsLink}=   xpath://a[@href='/profile/']
${personalDetailsBreadcrumb}=   xpath://ul[@class='b-breadcrumbs-list']//li//a[contains(.,"Personal Details")]
${passwordInputLocator}=   xpath://input[@id='dwfrm_profile_login_currentpassword']
${passwordInputText}=       ${existingEmailPassword}
${editPhoneNumber}=     xpath://input[@id='dwfrm_profile_customer_phone']
${newPhoneNumber}=  9804285848
${oldPhoneNumber}=   6385852131
${saveDetails}=     xpath://button[@name='save']
${redirectExpectedUrl}=     https://development.tulipcremation.com/account/

*** Keywords ***
Edit Profile Details
    scroll element into view    ${editDetailsLink}
    click element       ${editDetailsLink}
    wait until element is visible    ${personalDetailsBreadcrumb}
    clear element text    ${editPhoneNumber}
    input text     ${editPhoneNumber}   ${newPhoneNumber}   clear=True
    input text    ${passwordInputLocator}      ${passwordInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    10s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${redirectExpectedUrl}
    ${updatedPhoneNumber}=    Get Text    ${phoneNumber}
    ${normalizedUpdatedNumber}=     Normalize Phone Number    ${updatedPhoneNumber}
    should be equal as strings    ${normalizedUpdatedNumber}     ${newPhoneNumber}
    Log    Phone number updated successfully to ${normalizedUpdatedNumber}.
    scroll element into view    ${editDetailsLink}
    click element       ${editDetailsLink}
    wait until element is visible    ${personalDetailsBreadcrumb}
    input text     ${editPhoneNumber}   ${oldPhoneNumber}   clear=True
    input text    ${passwordInputLocator}      ${passwordInputText}
    scroll element into view    ${savedetails}
    click element    ${saveDetails}
    sleep    10s
    ${currentUrl}=    Get Location
    Should Be Equal As Strings    ${currentUrl}    ${redirectExpectedUrl}
    Log    Phone number reverted back to old successfully: ${oldPhoneNumber}.


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
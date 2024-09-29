*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../AccountPagesGlobalVariables.robot

*** Variables ***
${addAddressDetailsLink}=  xpath://a[@href='/add-address/']
${addAddressDetailsBreadcrumb}=   xpath://ul[@class='b-breadcrumbs-list']//li//a[contains(.,"Add Address Details")]
${newAddAddressQuickFinderAddress}=   151 3rd Street, San Francisco, CA 94103
${addAddressDetailsPhoneNumber}=    xpath://input[@id="dwfrm_address_phone"]
*** Keywords ***
Add Address Details
    ${addAddressDetailsPhoneNumberText}=    Get Text    ${phoneNumber}
    scroll element into view    ${addAddressDetailsLink}
    click element    ${addAddressDetailsLink}
    wait until element is visible    ${addAddressDetailsBreadcrumb}
    scroll element into view    ${quickAddressFinder}
    ${characters}=    Split String To Characters    ${newAddAddressQuickFinderAddress}
    FOR    ${char}    IN    @{characters}
            press keys    ${quickAddressFinder}    ${char}
    END
    scroll element into view    ${suggestion}
    click element    ${suggestion}
    sleep   3s
    scroll element into view    ${addressline1}
    ${address_line_1_value}=    get value    ${addressline1}
    ${city_value}=    get value     ${city}
    ${state_value}=     get selected list value    ${state}
    ${zipcode_value}=   get value   ${zipcode}
    ${formatted_address}=    Catenate    SEPARATOR=,    ${address_line_1_value}, ${city_value}, ${state_value} ${zipcode_value}
    scroll element into view    ${addAddressDetailsPhoneNumber}
    input text    ${addAddressDetailsPhoneNumber}       ${addAddressDetailsPhoneNumberText}
    scroll element into view    ${saveaddressbutton}
    click element    ${saveaddressbutton}
    sleep    10s
    ${currentRedirectedUrl}=    Get Location
    Should Be Equal As Strings    ${currentRedirectedUrl}    ${redirectExpectedUrl}
    scroll element into view    ${oldAddressCard}
    ${secondCardLine}=    Get Text    ${secondAddressCardLine}
    ${thirdCardLine}=    Get Text    ${thirdAddressCardLine}
    ${newConcatenatedAddress}=    catenate     SEPARATOR=,     ${secondCardLine}, ${thirdCardLine}
    should be equal as strings    ${formatted_address}  ${newConcatenatedAddress}
    log    Address Added Successfully: ${newConcatenatedAddress}
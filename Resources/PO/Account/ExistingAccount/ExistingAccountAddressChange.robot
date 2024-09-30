*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../AccountPagesGlobalVariables.robot

*** Variables ***
${editAddressDetailsLink}=  xpath://a[@href='/edit-address/?addressId=myDetailsShipping']
${editAddressDetailsBreadcrumb}=   xpath://ul[@class='b-breadcrumbs-list']//li//a[contains(.,"Edit Address Details")]
${newQuickFinderAddress}=   San Diego Zoo, Zoo Drive
${redirectExpectedUrl}=     https://development.tulipcremation.com/account/

*** Keywords ***
Change Address Details
    scroll element into view    ${oldAddressCard}
    ${secondCardLine}=    Get Text    ${secondAddressCardLine}
    ${thirdCardLine}=    Get Text    ${thirdAddressCardLine}
    ${oldConcatenatedAddress}=    catenate     SEPARATOR=,     ${secondCardLine}, ${thirdCardLine}
    scroll element into view    ${editAddressDetailsLink}
    click element    ${editAddressDetailsLink}
    wait until element is visible    ${editAddressDetailsBreadcrumb}
    scroll element into view    ${quickAddressFinder}

    ${characters}=    Split String To Characters    ${newQuickFinderAddress}
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
    scroll element into view    ${saveaddressbutton}
    click element    ${saveaddressbutton}
    sleep    10s
    ${currentRedirectedUrl}=    Get Location
    Should Be Equal As Strings    ${currentRedirectedUrl}    ${addresschangeRedirectToAccountExpectedUrl}
    scroll element into view    ${oldAddressCard}
    ${secondCardLine}=    Get Text    ${secondAddressCardLine}
    ${thirdCardLine}=    Get Text    ${thirdAddressCardLine}
    ${newConcatenatedAddress}=    catenate     SEPARATOR=,     ${secondCardLine}, ${thirdCardLine}
    should be equal as strings    ${formatted_address}  ${newConcatenatedAddress}
    log    Address Successfully updated to: ${newConcatenatedAddress}

    scroll element into view    ${editAddressDetailsLink}
    click element    ${editAddressDetailsLink}
    wait until element is visible    ${editAddressDetailsBreadcrumb}
    scroll element into view    ${quickAddressFinder}

    ${characters}=    Split String To Characters    ${oldConcatenatedAddress}
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
    scroll element into view    ${saveaddressbutton}
    click element    ${saveaddressbutton}
    sleep    10s
    ${currentRedirectedUrl}=    Get Location
    Should Be Equal As Strings    ${currentRedirectedUrl}    ${addresschangeRedirectToAccountExpectedUrl}
    scroll element into view    ${oldAddressCard}
    ${secondCardLine}=    Get Text    ${secondAddressCardLine}
    ${thirdCardLine}=    Get Text    ${thirdAddressCardLine}
    ${newConcatenatedAddress}=    catenate     SEPARATOR=,     ${secondCardLine}, ${thirdCardLine}
    should be equal as strings    ${formatted_address}  ${newConcatenatedAddress}
    log    Address Successfully changed back to: ${newConcatenatedAddress}
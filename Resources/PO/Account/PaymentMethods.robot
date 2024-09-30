*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   AccountPagesGlobalVariables.robot

*** Variables ***
${cardName}=    Visa Test Card
${cardNumber}=   4242424242424242
${cardExpiryDate}=  12/74
${cardCVC}=     123
${cardNumberPaymentMethods}=    xpath://p[@class="b-cards_grid-number"]
${cardHolderPaymentMethods}=    xpath://p[@class="b-cards_grid-holder"]
${cardEndingPaymentMethods}=    xpath://p[@class="b-cards_grid-ending"]
${deleteCardLink}=  xpath://button[contains(text(),'Delete')]
${deleteCardDialog}=    xpath://h2[contains(text(),'Delete Payment?')]
${deleteCardButton}=    xpath://button[contains(text(),'Yes, delete')]

*** Keywords ***
Add New Payment Method
    scroll element into view        ${addPaymentMethodLink}
    click element   ${addPaymentMethodLink}
    wait until element is visible    ${addPaymentMethodBreadcrumb}
    input text    ${nameCreditCardInput}       ${cardName}
    Wait Until Element Is Visible   ${cardNumberIframe}
    select frame        ${cardNumberIframe}
    scroll element into view    ${cardNumberIframeInput}
    input text    ${cardNumberIframeInput}  ${cardNumber}
    unselect frame
    select frame        ${expiryDateIframe}
    scroll element into view    ${expiryDateIframeInput}
    input text    ${expiryDateIframeInput}  ${cardExpiryDate}
    unselect frame
    select frame        ${cvcIframe}
    scroll element into view       ${cvcIframeInput}
    input text    ${cvcIframeInput}   ${cardCVC}
    unselect frame
    scroll element into view       ${defaultPaymentMethodCheckbox}
    click element    ${defaultPaymentMethodCheckbox}
    scroll element into view    ${saveCard}
    click element    ${saveCard}
    sleep    10s
    ${currentRedirectedUrl}=    Get Location
    Should Be Equal As Strings    ${currentRedirectedUrl}    ${addPaymentMethodRedirecttoPaymentMethodsExpectedUrl}
    ${getcardNumberPaymentMethods}=     get text    ${cardNumberPaymentMethods}
    ${lastFour}=    Get Substring    ${getcardNumberPaymentMethods}    -4    -1
    ${actualLastFour}=  Get Substring    ${cardNumber}    -4    -1
    should be equal as strings      ${lastFour}    ${actualLastFour}
    ${getcardHolderPaymentMethods}=     get text    ${cardHolderPaymentMethods}
    should be equal as strings      ${getcardHolderPaymentMethods}    ${cardName}
    ${getcardEndingPaymentMethods}=     get text    ${cardEndingPaymentMethods}
    ${month}=    Get Substring    ${getcardEndingPaymentMethods}    0    3
    ${year}=     Get Substring    ${getcardEndingPaymentMethods}    5    7
    ${formattedcardEndingPaymentMethods}=    Catenate    SEPARATOR=    ${month}    ${year}
    should be equal as strings      ${formattedcardEndingPaymentMethods}    ${cardExpiryDate}
    log    Payment Method Added Successfully: ${cardName} and ${cardNumber}
    click element    ${deleteCardLink}
    wait until element is visible    ${deleteCardDialog}
    click element    ${deleteCardButton}
    sleep   5s
    ${getcardNumberPaymentMethods}=     get text    ${cardNumberPaymentMethods}
    ${lastFour}=    Get Substring    ${getcardNumberPaymentMethods}    -4    -1
    ${actualLastFour}=  Get Substring    ${cardNumber}    -4    -1
    should not be equal as strings      ${lastFour}    ${actualLastFour}
    ${getcardHolderPaymentMethods}=     get text    ${cardHolderPaymentMethods}
    should not be equal as strings      ${getcardHolderPaymentMethods}    ${cardName}
    ${getcardEndingPaymentMethods}=     get text    ${cardEndingPaymentMethods}
    ${month}=    Get Substring    ${getcardEndingPaymentMethods}    0    3
    ${year}=     Get Substring    ${getcardEndingPaymentMethods}    5    7
    ${formattedcardEndingPaymentMethods}=    Catenate    SEPARATOR=    ${month}    ${year}
    should not be equal as strings      ${formattedcardEndingPaymentMethods}    ${cardExpiryDate}
    log    Payment Method Deleted Successfully: ${cardName} and ${cardNumber}
*** Variables ***

#Account Details Page Locators
${phoneNumber}=     css:[data-tau] > li:nth-of-type(3)  #locator for phone number present inside Personal Details Section
${editDetailsLink}=   xpath://a[@href='/profile/']     #locator for Edit Details CTA present inside Personal Details Section
${changePasswordLink}=   xpath://a[@href='/changepassword/']    #locator for Change Password CTA present inside Personal Details Section
${successMessage}=  xpath://div[contains(text(),'Your password has been successfully changed')]     #locator for Success Toast Message that appears on the Account Details page on Changing the Password
${secondAddressCardLine}=   xpath=(//div[contains(@class, 'm-address')]//p)[2]  #locator for Address Line present inside Address Section
${thirdAddressCardLine}=    xpath=(//div[contains(@class, 'm-address')]//p)[3]  #locator for City and State Line present inside Address Section
${oldAddressCard}=  css:.m-address  #locator for entire Address Section

#Edit Account Details Page Locators
${personalDetailsBreadcrumb}=   xpath://ul[@class='b-breadcrumbs-list']//li//a[contains(.,"Personal Details")]  #locator for Personal Details breadcrumb present on the Edit Account Details Page
${passwordInputLocator}=   xpath://input[@id='dwfrm_profile_login_currentpassword']     #locator for Current Password Input Field present on the Edit Account Details Page
${editPhoneNumber}=     xpath://input[@id='dwfrm_profile_customer_phone']    #locator for Phone Number Field present on the Edit Account Details Page
${saveDetails}=     xpath://button[@name='save']    #locator for Save CTA present on the Edit Account Details Page
${redirectExpectedUrl}=     https://development.tulipcremation.com/account/     #Expected redirect url on saving/cancelling the changes on Edit Account Details Page

#Change Password Page Locators
${changePasswordBreadcrumb}=   xpath://ul[@class='b-breadcrumbs-list']//li//a[contains(.,"Change Password")]    #locator for Change Password breadcrumb present on the Change Password Page
${currentPasswordInput}=   xpath://input[@id='dwfrm_changePassword_currentpassword']    #locator for Current Password Input Field present on the Change Password Page
${newPasswordInput}=    xpath://input[@id='dwfrm_changePassword_newpassword']    #locator for New Password Input Field present on the Change Password Page
${newConfirmPasswordInput}=   xpath://input[@id='dwfrm_changePassword_newpasswordconfirm']  #locator for Confirm New Password Input Field present on the Change Password Page
${saveDetails}=     xpath://button[@name='save']    #locator for Save CTA present on the Change Password Page
${changepasswordRedirectToAccountExpectedUrl}=     https://development.tulipcremation.com/account/?redirectedFrom=changePassword     #Expected redirect url on saving the new password on Change Password Page

#Add Address and Change Address Page Locators
${quickAddressFinder}=  xpath://input[@id='dwfrm_address_quickFinder']     #locator for Quick Address Finder
${suggestion}=  xpath://div[@class='pac-item']      #locator for Quick Address Finder Suggestion
${addressLine1}=    xpath://input[@id='dwfrm_address_address1']     #locator for Address Line 1 Input Field
${city}=    xpath://input[@id='dwfrm_address_city']     #locator for City Input Field
${state}=   xpath://select[@id='dwfrm_address_states_stateCode']    #locator for State Input Field
${zipcode}=     xpath://input[@id='dwfrm_address_postalCode']   #locator for Zip Code Input Field
${saveAddressButton}=   xpath://button[@name='dwfrm_address_apply']     #locator for Save CTA Input Field
${redirectExpectedUrl}=     https://development.tulipcremation.com/account/  #Expected redirect url on saving the Address
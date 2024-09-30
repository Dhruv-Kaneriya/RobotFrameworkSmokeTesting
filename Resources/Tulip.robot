*** Settings ***
Resource    PO/Homepage/LandingPage.robot
Resource    PO/Homepage/GlobalHeader.robot
Resource    PO/Homepage/GlobalFooter.robot
Resource    PO/Homepage/EmailSubscription.robot
Resource    PO/Account/ExistingAccount/AccountSignIn.robot
Resource    PO/Account/NewAccount/AccountSignUp.robot
Resource    PO/Account/ExistingAccount/EditExistingAccountProfileDetails.robot
Resource    PO/Account/AccountDetails.robot
Resource    PO/Account/ExistingAccount/ExistingAccountPasswordChange.robot
Resource    PO/Account/ExistingAccount/ExistingAccountAddressChange.robot
Resource    PO/Account/NewAccount/EditNewAccountProfileDetails.robot
Resource    PO/Account/NewAccount/NewAccountPasswordChange.robot
Resource    PO/Account/NewAccount/NewAccountAddAddress.robot
Resource    PO/Account/PaymentMethods.robot
Resource    Common.robot

*** Keywords ***
Open Homepage
    LandingPage.Load
    LandingPage.Verify Page Loaded

Verify Global Header Links
    GlobalHeader.Verify All Header Links Work

Verify Global Footer Links
    GlobalFooter.Verify All Footer Links Work

Verify Email Newsletter Subscription
    EmailSubscription.Verify Email Subscription

Verify Login Functionality
    AccountSignIn.Verify Account Login

Verify SignUp Functionality
    AccountSignUp.Verify Account SignUp

Verify Edit Exisiting Account Details
    AccountDetails.Open Account Details Page
    EditExistingAccountProfileDetails.Edit Profile Details

Verify Exisiting Account Password Change
    AccountDetails.Open Account Details Page
    ExistingAccountPasswordChange.Change Account Password from Profile

Verify Exisiting Account Address Change
    AccountDetails.Open Account Details Page
    ExistingAccountAddressChange.Change Address Details

Verify Edit New Account Details
    AccountDetails.Open Account Details Page
    EditNewAccountProfileDetails.Edit Profile Details

Verify New Account Password Change
    AccountDetails.Open Account Details Page
    NewAccountPasswordChange.Change Account Password from Profile

Verify New Account Add Address
    AccountDetails.Open Account Details Page
    NewAccountAddAddress.Add Address Details

Verify Payment Method Functionality
    AccountDetails.Open Account Details Page
    PaymentMethods.Add New Payment Method
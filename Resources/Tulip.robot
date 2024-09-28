*** Settings ***
Resource    PO/LandingPage.robot
Resource    PO/GlobalHeader.robot
Resource    PO/GlobalFooter.robot
Resource    PO/EmailSubscription.robot
Resource    PO/AccountSignIn.robot
Resource    PO/AccountSignUp.robot
Resource    PO/EditExistingAccountProfileDetails.robot
Resource    PO/AccountDetails.robot
Resource    PO/ExistingAccountPasswordChange.robot
Resource    PO/ExistingAccountAddressChange.robot
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
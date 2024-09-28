*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/Tulip.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

#Run the Script
#robot -d results tests/SmokeTest.robot

*** Test Cases ***
Homepage is displayed
    Tulip.Open Homepage

Global Header Links are working
    Tulip.Open Homepage
    Tulip.Verify Global Header Links

Global Footer Links are working
    Tulip.Open Homepage
    Tulip.Verify Global Footer Links

Subscribe to Newsletter
    Tulip.Open Homepage
    Tulip.Verify Email Newsletter Subscription

Account SignIn
    Tulip.Open Homepage
    Tulip.Verify Login Functionality

Account SignUp
    Tulip.Open Homepage
    Tulip.Verify SignUp Functionality

Existing Account Edit Functionality
    Tulip.Open Homepage
    Tulip.Verify Login Functionality
    Tulip.Verify Edit Exisiting Account Details

Existing Account Password Change Functionality
    Tulip.Open Homepage
    Tulip.Verify Login Functionality
    Tulip.Verify Exisiting Account Password Change

Existing Account Address Change Functionality
    Tulip.Open Homepage
    Tulip.Verify Login Functionality
    Tulip.Verify Exisiting Account Address Change

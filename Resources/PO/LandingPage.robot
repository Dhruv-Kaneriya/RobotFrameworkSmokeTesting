*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Load
    go to    https://storefront:fpg2022@development.tulipcremation.com/
    click link    Accept Without Tracking

Verify Page Loaded
    wait until page contains    Cremation Services Your Family Can Trust
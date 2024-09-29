*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Load
    go to    https://storefront:fpg2022@development.tulipcremation.com/
    sleep    3s
    click link    Accept Without Tracking
    sleep    3s

Verify Page Loaded
    wait until page contains    Cremation Services Your Family Can Trust
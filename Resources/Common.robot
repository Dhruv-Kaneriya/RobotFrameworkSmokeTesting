*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Begin Web Test
    open browser    about:blank     chrome
    maximize browser window
    set selenium timeout    10s

End Web Test
    close all browsers
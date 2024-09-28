*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${headerLinks}     xpath://div[contains(@class, 'b-header_actions')]//a


*** Keywords ***
Verify All Header Links Work
    ${links}=    get webelements    ${headerLinks}
    ${link_count}=    Get Length    ${links}
    Log    Found ${link_count} header links.

    FOR    ${link}    IN    @{links}
        ${href}=    Get Element Attribute    ${link}    href
        log    Checking link: ${href}
        IF    '${href}'.startswith('tel:')  CONTINUE
#        skip if    '${href}'.startswith('tel:')     Skipping verification for tel link
#        Run Keyword If    '${href}'.startswith('tel:')    Log    Skipping verification for tel link: ${href}
#        ...    ELSE     continue for loop
        execute javascript    window.open("${href}", "_blank")
        switch window    new
        sleep    3
        ${current_url}=     get location
        log    Current URL: ${current_url}
        should contain      ${current_url}    ${href}
        close window
        switch window    main
    END


#
#    ${index}=    set variable   0
#    FOR    ${link}     IN     ${links}
#        ${href}=    get element attribute      ${link}      href
#        log    Checking link:   ${href}
#        Execute JavaScript    window.open("${href}", "_blank")
#        switch window      new
#        sleep    3
#        ${current_url}=     get location
#        log    Current URL: ${current_url}
#        should be equal as strings    ${href}   ${current_url}
#        close window
#        switch window    main
#    END
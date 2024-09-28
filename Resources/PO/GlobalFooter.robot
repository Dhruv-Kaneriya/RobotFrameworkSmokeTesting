*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${footerLinks}     xpath://div[contains(@class, 'b-footer-inner')]//a

*** Keywords ***
Verify All Footer Links Work
     ${links}=    get webelements    ${footerLinks}
     ${link_count}=    Get Length    ${links}
     Log    Found ${link_count} footer links.
     FOR    ${link}    IN    @{links}
            ${href}=    Get Element Attribute    ${link}    href
            log    Checking link: ${href}
            IF    '${href}'.startswith('tel:')  CONTINUE
            IF    '${href}'.startswith('mailto:')  CONTINUE
            execute javascript    window.open("${href}", "_blank")
            switch window    new
            sleep    3
            ${current_url}=     get location
            log    Current URL: ${current_url}
            should contain      ${current_url}    ${href}
            close window
            switch window    main
     END


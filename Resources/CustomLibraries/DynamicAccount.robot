*** Settings ***
Library    custom_faker.py


*** Keywords ***
Generate Dynamic Last Name
    ${lastNameInputText}=    generate_last_name  # Call the function to generate a last name
    Log    Generated Last Name: ${lastNameInputText}
    RETURN    ${lastNameInputText}

Generate Dynamic Email
    [Arguments]    ${emailInputBase}    ${lastNameInputText}
    ${emailInputText}=    generate_email    ${emailInputBase}    ${lastNameInputText}
    Log    Generated Email: ${emailInputText}
    RETURN      ${emailInputText}
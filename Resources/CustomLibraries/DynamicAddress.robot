*** Settings ***
Library    custom_faker.py

*** Keywords ***
 Generate Dynamic USA Address
    ${randomAddress}=   generate_usa_address
    Log    Generated Random Address: ${randomAddress}
    RETURN    ${randomAddress}
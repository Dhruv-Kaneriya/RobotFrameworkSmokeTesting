# custom_faker.py
from faker import Faker

fake = Faker()

def generate_last_name():
    return fake.last_name()

def generate_email(base_email, last_name):
    return f"{base_email}+{last_name}@astounddigital.com"


def generate_usa_address():
    street_address = fake.street_address()
    city = fake.city()
    state = fake.state_abbr()  # State abbreviation (e.g., CA, NY)
    zip_code = fake.zipcode()

    return f"{street_address}, {city}, {state} {zip_code}"
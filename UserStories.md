# User Stories

List all the user stories (acceptance criterias) in the app.

- **Feature 1**: As a User I want to receive an OTP Code  So I can login with that OTP Code.
  - **Scenario 1.1**: User does NOT supply correct email
    - _**GIVEN**_ that I am on the InputEmail screen
    - _**WHEN**_ I enter an email address incorrectly
    - _**THEN**_ I see the button *'OTP Code'* is disabled
  - **Scenario 1.2**: User supplies correct email
    - _**GIVEN**_ that I am on the InputEmail screen
    - _**WHEN**_ I enter an email address correctly
    - _**THEN**_ I see the button *'OTP Code'* is enabled
  - **Scenario 1.3**: User supplies correct email and get OTP Code
    - _**GIVEN**_ that I am on the InputEmail screen
    - _**WHEN**_ I enter an email address correctly and tap *'OTP Code'*
    - _**THEN**_ I am taken to InputOTP screen and receive an OTP Code via my email
- **Feature 2**: As a User I want to login so I can access my data.
  - **Scenario 2.1**: User supplies an invalid OTP Code
    - _**GIVEN**_ that I am on the InputOTP screen
    - _**WHEN**_ I enter an invalid OTP Code
    - _**THEN**_ I see the button *'Submit'* is disabled
  - **Scenario 2.2**: User supplies a valid OTP Code
    - _**GIVEN**_ that I am on the InputOTP screen
    - _**WHEN**_ I enter a valid OTP Code
    - _**THEN**_ I see the button *'Submit'* is enabled
  - **Scenario 2.3**: User does NOT supply correct OTP Code
    - _**GIVEN**_ that I am on the InputOTP screen
    - _**WHEN**_ I enter an OTP Code incorrectly and tap *'Submit'*
    - _**THEN**_ I see the popup show error message *'OTP is invalid'*
  - **Scenario 2.4**: User supplies correct OTP Code
    - _**GIVEN**_ that I am on the InputOTP screen
    - _**WHEN**_ I enter an OTP Code correctly and tap *'Submit'*
    - _**THEN**_ I see the popup show message *'Congratulation. TDD for iOS'*

- **Notes**
  - Validate will only be trigger once I stop typing 2s
  - The valid email must not be empty and belong to **pycogroup** domain (**@pycogroup** as suffix)
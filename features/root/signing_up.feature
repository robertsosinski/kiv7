Feature: Signing up

  A user should be able to signup with a username and password.

  Background:
    Given that there is already a user in the system
    And the user is at at the signup page

  Scenario: Signing up with a unique username and password.
    When entering a unique username
    And entering a secure password
    And signing up with their credentials
    Then the user should be sent to the list page
    And a welcome message should be displayed

  Scenario: Signing up with a unique username and a password that is too short.
    When entering a unique username
    But entering a password that is too short
    And signing up with their credentials
    Then the user should stay on the signup page
    And an invalid password message should be displayed

  Scenario: Signing up with a username that is already taken and secure password.
    When entering a username that is already taken
    And entering a secure password
    And signing up with their credentials
    Then the user should stay on the signup page
    And an invalid username message should be displayed

  Scenario: Signing up with a username that is already taken and a password that is too short.
    When entering a username that is already taken
    And entering a password that is too short
    And signing up with their credentials
    Then the user should stay on the signup page
    And an invalid username message should be displayed
    And an invalid password message should be displayed

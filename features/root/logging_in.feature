Feature: Logging in

  A user should be able to login with a username and password.

  Background:
    Given a valid user account
    And the user is at at the login page

  Scenario: Logging in with a valid username and password.
    When entering a valid username
    And entering a valid password
    And submiting their credentials
    Then the user should be sent to the list page
    And a welcome message should be displayed

  Scenario: Logging in with a valid username but an invalid password.
    When entering a valid username
    But entering an invalid password
    And submiting their credentials
    Then the user should stay on the login page
    And an invalid credentials message should be displayed

  Scenario: Logging in with a valid password but an invalid username.
    When entering an invalid username
    And entering a valid password
    And submiting their credentials
    Then the user should stay on the login page
    And an invalid credentials message should be displayed

  Scenario: Logging in with an invalid username and password.
    When entering an invalid username
    And entering an invalid password
    And submiting their credentials
    Then the user should stay on the login page
    And an invalid credentials message should be displayed

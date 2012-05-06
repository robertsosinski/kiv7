@javascript
Feature: List page

  A user should have a list page that allows them to manage their tasks

  Background:
    Given that the user is logged in
    And that they are on the list page

  Scenario: Creating 2 new tasks
    When entering the task "Wash dishes"
    And entering the task "Do laundry"
    Then they should see 2 tasks open
    And they should see a blurb telling them they have 2 tasks left

  Scenario: Creating a task and marking it done
    When entering the task "Order dinner"
    And marking the task "Order dinner" as done
    Then they should see 0 tasks open
    And they should see a blurb telling them they have 0 tasks left


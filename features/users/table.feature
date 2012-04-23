Feature: Table
  Admin should be able to add table and assigned it to table captain

  Background:
    Given I logged in as admin
    And I click "Add Event"
    And I create an event
    And I click "berkeley lunch"
    Then I should see "Add Table"

  Scenario: Successfully create a table
    When I click "Add Table"
    And I add table
    Then I should see "Table was successfully added"
    And I should see "berkeley lunch"
    And I click "Back"


  Scenario: Successfully edit an event
    When I click "Add Table"
    And I add table
    And I click "Back"
    When I click "Edit Table"
    And I update table

  Scenario: Successfully delete an event
    Then I should see "berkeley lunch"
    And I delete table
    Then I should not see "berkeley Lunch"

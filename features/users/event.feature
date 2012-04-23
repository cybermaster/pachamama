Feature: Event
  Admin should be able to add events

  Background:
    Given I logged in as admin
    When I return to the site
    And I should see a link "Add Event"
    And I click "Add Event"

  Scenario: Successfully add an event
    When I create an event
    Then I should see "Event was successfully added"

  Scenario: Successfully edit an event
    When I create an event
    Then I should see "Event was successfully added"
    And I should see "Edit"
    When I click "Edit"
    And I edit event
    Then I should see "Event was successfully updated"

  Scenario: Successfully delete an event
    When I create an event
    Then I should see "Event was successfully added"
    And I should see "Delete"
    Then I click "Delete"

Feature: Guest
  Admin should not be able to add guest
  Table Captain should be able to add guest

  Background:
    Given I logged in as admin
    And I click "Add Event"
    And I create an event
    And I sign out


  Scenario: I have no assigned table
    Given I logged in as tableCaptain
    And I should see a link "berkeley lunch"
    And I click "berkeley lunch"
    Then I should see "Table"
    Then I should see "Event"

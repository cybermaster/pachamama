Feature: Guest
  Admin should not be able to add guest
  Table Captain should be able to add guest

  Background:
    Given I logged in as admin
    And I return to the site
    And I click "Add Event"
    And I create an event
    And I should see "Event was successfully added"
    And I sign out


  Scenario: I have no assigned table
    Given I logged in as tableCaptain
    And I return to the site
    And I should see "UC Berkeley Lunch"
    And I click "UC Berkeley Lunch"
    Then I should see "Table"
    Then I should see "Event"

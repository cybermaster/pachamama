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


  Scenario: TableCaptain have no assigned table
    Given I logged in as tableCaptain
    And I return to the site
    And I should not see "UC Berkeley Lunch"

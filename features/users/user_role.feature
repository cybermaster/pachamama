Feature: Role
  Users who sign in should have correspond role they signed up for

  Scenario: User is administrative
    Given I logged in as admin
    When I return to the site
    Then I should be signed in
    And I should see "Admin"
    And I should see a link "Add User"
    And I should see a link "Add Event"


  Scenario: User is table captain
    Given I logged in as tableCaptain
    When I return to the site
    Then I should be signed in
    And I should see "Captain"

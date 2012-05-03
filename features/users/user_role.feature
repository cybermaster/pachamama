Feature: Role
  Users who sign in should have correspond role they signed up for

  Scenario: User is administrative
    Given I logged in as admin
    When I return to the site
    Then I should be signed in
    And I should see "Admin"
    And I should see a link "Add User"
    And I should see a link "Add Event"

  Scenario: Admin can see users
    Given I logged in as admin
    And I return to the site
    And I click "Show Users"
    Then I should see my name

  Scenario: User is table captain
    Given I logged in as tableCaptain
    When I return to the site
    Then I should be signed in
    And I should see "Captain"

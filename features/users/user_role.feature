Feature: Role
  Users who sign in should have correspond role they signed up for

  Scenario: User is administrative
    Given I am administrative
    When I am logged in
    Then I should see "Welcome to Administrative Page"


  Scenario: User is table captain
    Given I am table captain
    When I am logged in
    Then I should see "Welcome to Table Captain Page"

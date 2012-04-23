Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

  Background:
    Given I logged in as admin
    When I return to the site
    And I should see a link "Edit account"
    And I click "Edit account"

    Scenario: I sign in and edit my account
      When I edit my account details
      Then I should see an account edited message

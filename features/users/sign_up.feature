Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I logged in as admin
      When I return to the site
      And I should see a link "Add User"
      And I click "Add User"

      #And I am at create user page

    Scenario: User signs up with valid data
      When I sign up with valid user data
      Then I should see a successful sign up message
      
    Scenario: User signs up with invalid email
      When I sign up with an invalid email
      Then I should see an invalid message

    Scenario: User signs up without password
      When I sign up without a password
      Then I should see an invalid message

    Scenario: User signs up without password confirmation
      When I sign up without a password confirmation
      Then I should see an invalid message

    Scenario: User signs up with mismatched password and confirmation
      When I sign up with a mismatched password confirmation
      Then I should see an invalid message
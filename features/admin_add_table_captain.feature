Feature: Admin adds table captains
 
  As a Pachamama administrator
  So that I can add others to help organize the luncheon
  I want to be able to add table captains

Background: I am an admin

  Given I am an admin
  
Scenario: Go to Add Table Captains page

  Given I am on the Admin page
  When I click "Add User"
  Then I should be on the Add Table Captain page

Scenario: Add captain

  Given I am on the Add Table Captain page
  And I fill in "First Name" with "Captain1"
  And I fill in "Last Name" with "Smith"
  And I fill in "Email Address" with "captain1@gmail.com"
  And I fill in "Phone Number" with "555 555 5555"
  And I click "Save"
  Then I should be on the Admin page
  And I should see "Captain1 Smith"

Scenario: Cancel add captain

  Given I am on the Add Table Captain page
  And I fill in "First Name" with "Captain2"
  And I fill in "Last Name" with "Smith"
  And I fill in "Email Address" with "captain2@gmail.com"
  And I fill in "Phone Number" with "555 555 5555"
  And I click "Cancel"
  Then I should be on the Admin page
  And I should not see "Captain2 Smith"

Scenario: Adding table captains using same login

  Given I am on the Add Table Captain page
  And I fill in "First Name" with "Captain3"
  And I fill in "Last Name" with "Smith"
  And I fill in "Email Address" with "captain2@gmail.com"
  And I click "Save"
  Then I should be on the Admin page
  And I should not see "Captain3 Smith"

Scenario: Adding table captain with empty last name

  Given I am on the Add Table Captain page
  And I fill in "First Name" with "Captain4"
  And I fill in "Email Address" with "captain4@gmail.com"
  And I click "Save"
  Then I should be on the Admin page
  And I should see "Captain3 Smith"

Scenario: Adding table captain with empty first name

  Given I am on the Add Table Captain page
  And I fill in "Last Name" with "Smith"
  And I fill in "Email Address" with "captain5@gmail.com"
  And I click "Save"
  Then I should be on the Admin page
  And I should not see "Captain3 Smith"

Scenario: Adding table captain with empty email (login)

  Given I am on the Add Table Captain page
  And I fill in "First Name" with "Captain6"
  And I fill in "Last Name" with "Smith"
  And I click "Save"
  Then I should be on the Admin page
  And I should not see "Captain6 Smith"

Scenario: Adding table captain with empty email (login)

   Given I am on the Add Table Captain page
   And I fill in "First Name" with "Captain6"
   And I fill in "Last Name" with "Smith"
   And I click "Save"
   Then I should be on the Admin page
   And I should not see "Captain6 Smith"

Feature: add guest to table

  As a table captain
  So I can keep track of the guests I've invited
  I want to be able to add a guest to one of my tables
 
Background: table captain has a table

  Given a table captain has a table
  
Scenario: add guest to table

  Given I am logged in as a table captain
  And I am on the table page for table one
  When I fill in "First Name" with "Adrian"
  And I fill in "Last Name" with "Stern"
  And I fill in "Phone" with "5105555555"
  And I fill in "Email" with "test@test.com"
  And I press "Save"
  Then I should be on the table page for table one
  And I should see guest "adrian"

Scenario: cancel adding guest to table

  Given I am logged in as a table captain
  And I am on the table page for table one
  When I fill in "First Name" with "Adrian"
  And I fill in "Last Name" with "Stern"
  And I fill in "Phone" with "5105555555"
  And I fill in "Email" with "test@test.com"
  And I press "cancel"
  Then I should be on the table page for table one
  And I should not see guest "adrian"

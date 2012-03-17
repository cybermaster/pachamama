Feature: Admin Can Add Tables
  As a admin 
  So that I can table captains can manage tables
  I want to be able to add tables
  
  Scenario: Add a Table 
	Given I am on Add Table page
    And I have selected Jonh Doe for the Table Captain
    And I have enter 1 into Table Number 
    When I press Save
    Then the result should be 1 table on Admin Page
  
  Scenario: Add a Table 
	Given I am on Add Table page
    And I have selected Jonh Doe for the Table Captain
    And I have enter 1 into Table Number 
    When I press Cancel
    Then the result should be 0 table on Admin Page
  
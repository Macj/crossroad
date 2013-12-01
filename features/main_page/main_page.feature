Feature: Main Page
  In order to basic functionality
  As an any user
  I want to view a list of sections with all behavior

Scenario: Title
  Given I`m not registered user 
  When I go to the homepage
  Then I see all sections
  And I see weather block



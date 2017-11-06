Feature: member
  As an administrator of the RGMS system
  I want to add, remove and modify users in the system.

  Scenario: list existing member
    Given I am at the Members page
    And I cannot see a member with username "usernametest"
   	When I click to view the member list
   	Then My member list contains member "usernametest"
Feature: Funder
  As an administrator of the RGMS system
  I want to add, remove and modify funders in the system

Scenario: new funder
    Given I am at the Funders page
    And I cannot see a funder with code "12345" in the funder list
    When I try to register a funder with code "12345"
   	Then I can see an ok message
Feature: Student grade management

  As a student enrolled in a class
  I want to register, update and remove the concept I assign to myself for each learning goal
  So that I can keep my self-assessment up to date until the professor closes it

  Background:
    Given I am logged in as the student "Bruno Tavares", enrolled in the class "ESS 2025.1"
    And the class "ESS 2025.1" has only the learning goals "Specify requirements with quality" and "Write quality tests"
    And the self-assessment of "ESS 2025.1" is open
    And I am on the "My self-assessment" page of "ESS 2025.1"

  Scenario: register a concept for a goal that has no concept yet
    Given I have no concept registered for the goal "Specify requirements with quality"
    When I assign the concept "MPA" to the goal "Specify requirements with quality"
    And I save my self-assessment
    Then I see a confirmation message that my self-assessment was saved
    And I see the concept "MPA" registered for the goal "Specify requirements with quality"
    And I see the goal "Write quality tests" with no concept registered

  Scenario: update a concept that was already registered
    Given I have the concept "MANA" registered for the goal "Write quality tests"
    When I assign the concept "MA" to the goal "Write quality tests"
    And I save my self-assessment
    Then I see a confirmation message that my self-assessment was saved
    And I see the concept "MA" registered for the goal "Write quality tests"
    And I do not see the concept "MANA" registered for the goal "Write quality tests"

  Scenario: remove a concept that was already registered
    Given I have the concept "MPA" registered for the goal "Specify requirements with quality"
    And I have the concept "MA" registered for the goal "Write quality tests"
    When I remove the concept of the goal "Specify requirements with quality"
    And I save my self-assessment
    Then I see a confirmation message that my self-assessment was saved
    And I see the goal "Specify requirements with quality" with no concept registered
    And I see the concept "MA" registered for the goal "Write quality tests"

  Scenario: fail to register a concept that is not accepted by the class
    Given I have no concept registered for the goal "Write quality tests"
    When I assign the concept "XYZ" to the goal "Write quality tests"
    Then I see an error message stating that "XYZ" is not a valid concept
    And I see that the accepted concepts are "MA", "MPA" and "MANA"
    And I see the goal "Write quality tests" with no concept registered

  Scenario: fail to register a concept for a goal that does not belong to the class
    When I assign the concept "MA" to the goal "Understand configuration management concepts"
    Then I see an error message stating that the goal "Understand configuration management concepts" does not belong to "ESS 2025.1"
    And I see only the goals "Specify requirements with quality" and "Write quality tests" in my self-assessment

  Scenario: fail to change the self-assessment after the professor closed it
    Given I have the concept "MPA" registered for the goal "Specify requirements with quality"
    And the self-assessment of "ESS 2025.1" is closed
    When I assign the concept "MA" to the goal "Specify requirements with quality"
    Then I see an error message stating that the self-assessment of "ESS 2025.1" is closed
    And I see the concept "MPA" registered for the goal "Specify requirements with quality"

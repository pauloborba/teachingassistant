Feature: Student self-evaluation
  As a student 
  I want to evaluate my goals
  So that I can compare my evaluation to the professor’s evaluation

Scenario: Simple self-evaluation success GUI
    Given The student “João Victor” is on the self-evaluation page
    And He input “MPA, MA, MPA” to the goal “Noções de Levantamento de Requisitos” 
    When  He asks the system to submit his answer
    Then He can see a confirmation message

Scenario: Simple self-evaluation success Controller
    Given The student “João Victor” is on the self-evaluation page
    When  He evaluates the goal “Noções de Levantamento de Requisitos”  “MPA, MA, MPA” 
    Then The system stores the evaluation 

Scenario: Simple self-evaluation failure GUI
    Given The student “João Victor” is on the self-evaluation page
    And He input “MPA, MA ” to the goal “Noções de Levantamento de Requisitos” 
    When  He asks the system to submit his answer
    Then He can see a failure message

    Scenario: Simple self-evaluation failure Controller
    Given The student “João Victor” is on the self-evaluation page
    When  He evaluates the goal “Noções de Levantamento de Requisitos”  “MPA, MA” 
    Then The system does not store the evaluation 

Scenario: No-discrepancy visualization GUI
    Given I am on the students visualization screen
    And The student “Joao” has “1” of “5” discrepant evaluations
    And The student “Paulo” has “0” of “5” discrepant evaluations
    And The student “Jose” has “0” of “5” discrepant evaluations
    When  I ask for the discrepant students screen
    Then I can see the number of discrepant students “0”
    And I can see the percentage of discrepant students “0%”
    And I can see “empty” in the list of discrepant students

Scenario: 1 student discrepancy visualization GUI
    Given I am on the students visualization screen
    And The student “Joao” has “3” of “5” discrepant evaluations
    And The student “Paulo” has “0” of “5” discrepant evaluations
    And The student “Jose” has “0” of “5” discrepant evaluations
    When  I ask for the discrepant students screen
    Then I can see the number of discrepant students “1”
    And I can see the percentage of discrepant students “33,3%”
    And I can see “Joao” in the list of discrepant students



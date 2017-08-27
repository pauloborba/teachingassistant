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



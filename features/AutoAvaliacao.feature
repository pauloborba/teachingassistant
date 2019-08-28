Feature: self-assessment 
    As a student registered in the system
    I want to evaluate all my learning goals at once at the same page that there are the teacher’s evaluations for my learning goals
    So that  I can compare the grades of each learning goal while I do my self-assessment
    
Scenario: Successful self-assessment 
    Given I am at the “Grades” page
    And I see the names of the goals with teacher’s evaluation 
    And I choose “MA”, “MPA” or “MANA” for each goal
    When ask the system to compute my grades 
    Then I am at “Grades” page 
    And I see the “Grade Report” preview
    And I see “Download Grade Report”

Scenario: Successful self-assessment 
    Given the system has no stored grade for the learning goals applied for me
    When I evaluate all my learning goals with “MPA”,“MA” or “MANA”
    Then the system returns “Sucesso”
    And the grades are stored in the system wi“MANA”, “MPA” ou “MA” for each learning goal
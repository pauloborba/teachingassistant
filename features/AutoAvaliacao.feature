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
    Then the system returns “Tudo certo”
    And the grades are stored in the system wi“MANA”, “MPA” ou “MA” for each learning goal

Scenario: Failed self-assessment 
    Given I am at “Grades” page 
    And I see the names of ten learning goals with the teacher’s evaluations
    And I evaluate each learning goal with “MANA”, “MPA” ou “MA” unless “Entender motivação e conceitos de requisitos”
    When I ask the system to compute my self-evaluations 
    Then I am at “Grades” page
    And I see a error message “Evaluate all the learning goas” 
    And I see “Try to evaluate again”

Scenario: Failed self-assessment 
    Given the system has no evaluation done stored by me
    And I evaluate each learning goal with “MANA”, “MPA” ou “MA” unless “Entender motivação e conceitos de requisitos”
    When I ask the system to compute my grades
    Then the system returns “Mensagem de erro”
    And the grades are not stored in the system
    And the system asks me to try again

Scenario: No discrepant grade
    Given I am logged as “Professor”
    And I am at “Grades” page
    And I see “Roberta”, “João” e “Pedro” in a table with their grades “MANA”, “MPA” ou “MA” for each learning goal.
    When I ask the system to “See discrepant grades”
    Then I am at “Discrepant grades” page
    And I see a empty list
    And I see “0%” and “0 students” below the list

Scenario: Discrepant Grades
    Given I am logged as “Main Professor”
    And I am at “Grades” page
    And I see “Marcela”, “Ewerton” e “Pedro” in a table with their grades “MANA”, “MPA” ou “MA” for each learning goal.
    When  I ask the system to “See discrepant grades”
    Then I am at “Discrepant grades” page
    And I see “Ana” in a list with her grades
    And I see “33,3%” and “1 student” below the list
    And I see “Generate discrepant grades report” to see a graphic percentual

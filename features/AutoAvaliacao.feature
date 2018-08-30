Feature: Auto-avaliação
    As a Student
    I want to be able to grade my own effort on a specific topic
    So that I can show the professor my level of commitment

Scenario: Checagem de auto-avaliação dos alunos
    Given I am at the “Student list page”
    When I click on “Fulano” another window is shown
    And when I click on self grades
    Then I can see that he graded himself with the same grades I did.
    And Test for exercise

Scenario: Checagem de auto-avaliação de aluno com discrepância
    Given I am at the “Student list page”
    When I click on “Cicrano” another window is shown
    And I click on self grades
    Then I can see that the percentage is higher than 25%

Feature: Auto-avaliação de alunos
  As a student
  I want to evaluate my performance in study subjects
  So that I may express my views to the teacher and understand theirs

  As a teacher
  I want to see my students' self-evaluations
  So that I can investigate mismatches in my and students' evaluations

  Scenario: successful filling of self-evaluation form (GUI)
    Given I am at the “Self-Evaluation” page
    When I fill field “A” with “MPA”
    And I fill field “B” with “MA”
    And I fill field “C” with “MPA”
    And I submit the form
    Then I see a confirmation message

  Scenario: successful filling of self-evaluation form (Service)
    Given the system has no self-evaluations stored for student “Gabriel”
    When student “Gabriel” provides value “MA” for their self-evaluation number 1
    And student “Gabriel” provides value “MA” for their self-evaluation number 2
    And student “Gabriel” provides value “MPA” for their self-evaluation number 3
    And student “Gabriel” chooses to submit their self-evaluations
    Then the system will store the value “MA” for student “Gabriel”’s self-evaluation number 1
    And the system will store the value “MA” for student “Gabriel”’s self-evaluation number 2
    And the system will store the value “MPA” for student “Gabriel”’s self-evaluation number 3

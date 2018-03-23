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

  Scenario: Failure in self-evaluation due to lack of data provided (GUI)
    Given I am at the “Self-Evaluation” page
    When I fill field “A” with “MPA”
    And I fill field “B” with “MA”
    And I submit the form
    Then I see a failure message

  Scenario: Failure in self-evaluation due to lack of data provided (Service)
    Given the system does not have any self-evaluations stored for student “Gabriel”
    When student “Gabriel” provides value “MA” for their self-evaluation number 1
    And student “Gabriel” provides value “MA” for their self-evaluation number 2
    And student “Gabriel” chooses to submit their self-evaluations
    Then the system does not store student “Gabriel”’s self-evaluations

  Scenario: No discrepant evaluations (GUI)
    Given I am at the “Student / Evaluations List” page
    And I see that student "Adilson” has evaluated themselves “MA” against my “MPA” in concept “A”
    And I see that student "Adilson” has evaluated themselves “MA” against my “MA” in concept “B”
    And I see that student "Adilson” has evaluated themselves “MANA” against my “MPA” in concept “C”
    And I see that student "Adilson” has evaluated themselves “MPA” against my “MA” in concept “D”
    And I see that student "Adilson” has evaluated themselves “MA” against my “MA” in concept “E”
    And I see that student "Armando” has evaluated themselves “MPA” against my “MA” in concept “A”
    And I see that student "Armando” has evaluated themselves “MPA” against my “MA” in concept “B”
    And I see that student "Armando” has evaluated themselves “MANA” against my “MA” in concept “C”
    And I see that student "Armando” has evaluated themselves “MPA” against my “MA” in concept “D”
    And I see that student "Armando” has evaluated themselves “MANA” against my “MA” in concept “E”
    And I see that student "Gabriel” has evaluated themselves “MPA” against my “MPA” in concept “A”
    And I see that student "Gabriel” has evaluated themselves “MA” against my “MA” in concept “B”
    And I see that student "Gabriel” has evaluated themselves “MPA” against my “MPA” in concept “C”
    And I see that student "Gabriel” has evaluated themselves “MPA” against my “MPA” in concept “D”
    And I see that student "Gabriel” has evaluated themselves “MPA” against my “MPA” in concept “E”
    When I choose to see the discrepant evaluations students list
    Then I see a list with “0” students
    And I see “0”% of students have discrepant evaluations

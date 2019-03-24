Feature: autoavaliação
  As a student
  I want to add grades for my goals

Scenario: autoavaliação bem sucedida
  Given I am at the "Autoavaliação Page"
  And I see the goals
  And I see the professors grades
  And my grades are empty
  When I add "MA", "MA", "MA", "MA", "MA" grades
  Then I am at the "Autoavaliação Page"
  And the goals have not changed
  And the professors grades have not changed
  And my grades are "MA", "MA", "MA", "MA", "MA"

Scenario: avaliação mal sucedida
  Given I am at the "Autoavaliação Page"
  And I see the goals
  And I see the professors grades
  And my goals are empty
  When I add "MA", "MA", "MA", "MA" grades
  Then I am at the "Autoavaliação Page"
  And the goals have not changed
  And the professors grades have not changed
  And my grades are empty
  And I see an error message
  And the professor receives an email with the error message

Scenario: nenhuma discrepância
  Given I am at the "Discrepâncias Page"
  And I there's a student named "Alice" whose grades are "MPA", "MA", "MA", "MA", "MA" and self-grades are "MA", "MA", "MA", "MA", "MA"
  When I see the field "Alunos com discrepâncias"
  Then the value of the field "Alunos com discrepâncias" is "0%"
  And I see the field "Lista de alunos com discrepâncias" does not contains the student whose name is "Alice"

Scenario: há discrepância
  Given I am at the "Discrepâncias Page"
  And there's a student named "Allan" whoce grades are "MPA", "MPA", "MPA", "MA" and self-grades are "MA", "MA", "MA", "MA", "MA"
  When I see the field "Alunos com discrepâncias"
  Then the value of the field "Alunos com discrepâncias" is "50%"
  And I see the field "Lista de alunos com discrepâncias" contains the student whose name is "Allan"

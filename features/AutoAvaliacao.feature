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

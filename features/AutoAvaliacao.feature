Feature: grade attribution
  As a student of the ESS course
  I want to assign myself a grade in the system
  so that I can make a more complete evaluation about my studies in the course
  (COMMIT MASTER)

Scenario: new evaluation
  Given the system doesn't have the self evaluation given by the student “Luiz Oliveira” with login “lhsgo” of the goals
  “Understand requirements concepts”, “Specify quality requirements” and “Understand configuration management concepts”
  When the student with login “lhsgo” tries to give evaluation “MPA” to goal “Understand requirements concepts”
  And “MA” to goal “Specify quality requirements”
  And “MANA” to goal “Understand configuration management concepts”
  Then the grades of the student “Luiz Oliveira” on the goals “Understand requirements concepts”,
  “Specify quality requirements” and “Understand configuration management concepts” is “MPA”, “MA” and “MANA” respectively

Scenario: new evaluation web
  Given I’m on the “self evaluation” page with login “lhsgo”
  And I see the goals “Understand requirements concepts”, “Specify quality requirements” and
  “Understand configuration management concepts” in pendency of evaluation
  When I try to self evaluate the student “Luiz Oliveira” in goals “Understand requirements concepts” with grade “MA”
  And goal “Specify quality requirements” with grade “MPA”
  And goal “Understand configuration management concepts” with grade “MPA”
  Then I see a confirmation message
  And a list of the goals “Understand requirements concepts”, “Specify quality requirements” and
  “Understand configuration management concepts” is “MA”, “MPA” and “MPA” respectively

Scenario: new evaluation incomplete
  Given the system doesn't have the self evaluation given by the student “Luiz Oliveira” with login “lhsgo” of the goals
  “Understand requirements concepts”, “Specify quality requirements” and “Understand configuration management concepts”
  When the student with login “lhsgo” tries to give evaluation “MPA” to goal “Understand requirements concepts”
  And “MA” to goal “Specify quality requirements”
  Then the grades of the student “Luiz Oliveira” on the goals “Understand requirements concepts”,
  “Specify quality requirements” and “Understand configuration management concepts” are not saved in the system

Scenario: new evaluation web error
  Given I’m on the “self evaluation” page with login “lhsgo”
  When I try to self evaluate the student “Luiz Oliveira” in goals “Understand requirements concepts” with grade “MA”
  And goal “Understand configuration management concepts” with grade “MPA”
  Then I see a confirmation message error
  (MODIFICAÇÂO DO STAKEHOLDER)
  And a list of the goals “Understand requirements concepts”, “Specify quality requirements” and
  “Understand configuration management concepts” are still in pendency

Scenario: correct average
(CENÁRIO CORRETO)
  Given I’m at the “evaluation” page with the teacher login “TEACHER_1”
  And the student “Luiz Oliveira” ’s teacher report of “Requirements”, “Configurations”, “Projects”,
  “Refactoring” and “Tests” goals are “MPA”, “MA”, “MA”, “MA” and “MANA”
  And the student “Luiz Oliveira” ’s self report of “Requirements”, “Configurations”, “Projects”,
  “Refactoring” and “Tests” goals are “MPA”, “MPA”, “MA”, “MA”, and “MPA”
  When I request the diagnosis of discrepancy of the student “Luiz Oliveira”
  Then I see the report of the student “Luiz Oliveira” with no discrepancy

Scenario: correct average with discrepancy
(CENÁRIO CORRETO)
(MODELO CORRETO, POIS ERREI NO ÚLTIMO COMMIT)
  Given I’m at the “evaluation” page with the teacher login “TEACHER_1”
  And the student “Luiz Oliveira” ’s teacher report of “Requirements”, “Configurations”, “Projects”,
  “Refactoring” and “Tests” goals are “MPA”, “MA”, “MA”, “MANA” and “MANA”
  And the student “Luiz Oliveira” ’s self report of “Requirements”, “Configurations”, “Projects”,
  “Refactoring” and “Tests” goals are “MA”, “MPA”, “MA”, “MPA”, and “MA”
  When I request the diagnosis of discrepancy of the student “Luiz Oliveira”
  Then I see a alert in the screen about the discrepancy
  And I see the report of the student “Luiz Oliveira” with the discrepancies in his grades
  (COMMIT 1)

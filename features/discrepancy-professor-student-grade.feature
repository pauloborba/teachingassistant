Feature: Discrepancy between student and professor concepts

  As a professor responsible for a class
  I want to see the discrepancies between the concepts my students assigned to themselves and the concepts I assigned to them
  So that I can quickly identify the students who assessed themselves very differently from my assessment

  Background:
    Given the accepted concepts are "MANA", "MPA" and "MA", in increasing order
    And the divergence of a goal is the number of levels between the concept of the student and the concept of the professor
    And the discrepancy of a student is the sum of the divergences of all the goals of the class
    And a student is discrepant when the discrepancy is greater than the threshold of the class

  Scenario: list the students whose discrepancy is above the defined threshold
    Given I am on the discrepancies page of the class "Turma A"
    And "Turma A" has only the goals "Specify requirements with quality" and "Write quality tests"
    And the discrepancy threshold of "Turma A" is "1"
    And "Turma A" has only the students "Carlos", "Beatriz" and "Rafael"
    And the professor assigned "MANA, MANA" to "Carlos" and "Carlos" assigned "MA, MA" to himself
    And the professor assigned "MA, MPA" to "Beatriz" and "Beatriz" assigned "MA, MPA" to herself
    And the professor assigned "MPA, MANA" to "Rafael" and "Rafael" assigned "MA, MPA" to himself
    When I open the discrepancies page of "Turma A"
    Then I see "Carlos" in the list of discrepant students with the discrepancy "4"
    And I see "Rafael" in the list of discrepant students with the discrepancy "2"
    And I do not see "Beatriz" in the list of discrepant students
    And I see the count "2" of discrepant students
    And I see the percentage "67%" of discrepant students in relation to the total number of students of the class

  Scenario: no discrepant student in the class
    Given I am on the discrepancies page of the class "Turma B"
    And the discrepancy threshold of "Turma B" is "2"
    And every student of "Turma B" has a discrepancy lower than or equal to "2"
    When I open the discrepancies page of "Turma B"
    Then I see the count "0" of discrepant students
    And I see the list of discrepant students empty

  Scenario: fail to open the discrepancies of a class that does not exist
    Given the class "Turma Z" does not exist
    When I try to open the discrepancies page of the class "Turma Z"
    Then I see an error message stating that the class was not found

  Scenario: fail to compute the discrepancy of a student without the concepts of the professor
    Given I am on the discrepancies page of the class "Turma C"
    And the student "Maria" assigned concepts to all the goals of "Turma C"
    And the professor did not assign concepts to "Maria"
    When I open the discrepancies page of "Turma C"
    Then I see a message stating that the discrepancy of the student "Maria" could not be computed
    And "Maria" is not counted in the number of discrepant students
    And I see a suggestion to assign the pending concepts of the student "Maria"

  Scenario: a discrepancy exactly equal to the threshold is not a discrepancy
    Given I am on the discrepancies page of the class "Turma D"
    And "Turma D" has only the goals "Specify requirements with quality" and "Write quality tests"
    And the discrepancy threshold of "Turma D" is "2"
    And the professor assigned "MPA, MANA" to "João" and "João" assigned "MA, MPA" to himself
    When I open the discrepancies page of "Turma D"
    Then I do not see "João" in the list of discrepant students

  Scenario: sort the discrepant students by decreasing discrepancy
    Given I am on the discrepancies page of the class "Turma E"
    And "Turma E" has only the goals "Specify requirements with quality" and "Write quality tests"
    And the discrepancy threshold of "Turma E" is "1"
    And "Turma E" has the following students:
      | student | professor concepts | student concepts | discrepancy |
      | Carlos  | MANA, MANA         | MA, MA           | 4           |
      | Beatriz | MANA, MPA          | MA, MA           | 3           |
      | Rafael  | MPA, MPA           | MA, MA           | 2           |
    When I sort the list of discrepant students by decreasing discrepancy
    Then I see the discrepant students in the order "Carlos", "Beatriz", "Rafael"

  Scenario: export the list of discrepant students to CSV
    Given I am on the discrepancies page of the class "Turma F"
    And "Turma F" has discrepant students
    When I click on "Export to CSV"
    Then I receive a CSV file containing the discrepant students, the concepts of each goal and their discrepancies

  Scenario: see the distribution chart of the discrepancies of the class
    Given I am on the discrepancies page of the class "Turma G"
    And "Turma G" has students with different levels of discrepancy
    When I open the "Discrepancy distribution" tab
    Then I see a chart with the number of students grouped by discrepancy

  Scenario: be notified about new discrepant students after the concepts are updated
    Given I am registered to receive notifications of the class "Turma H"
    And a new student of "Turma H" starts to have a discrepancy above the defined threshold
    When the system recomputes the discrepancies of the class
    Then I receive a notification informing the new discrepant student

  Scenario: change the discrepancy threshold of the class
    Given I am on the discrepancies page of the class "Turma I"
    And "Turma I" has only the goals "Specify requirements with quality" and "Write quality tests"
    And the discrepancy threshold of "Turma I" is "2"
    And the professor assigned "MPA, MPA" to "Pedro" and "Pedro" assigned "MA, MA" to himself
    When I change the discrepancy threshold to "1"
    Then the list of discrepant students is recomputed using the new threshold of "1"
    And "Pedro" starts to appear in the list of discrepant students

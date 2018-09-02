Scenario: new self evaluation from student
    Given I am a “Student” 
    And I have filled up all grade fields 
    And I am on “Self Evaluation Page”
    When I try to submit my grades
    Then I can see a confirmation message 
    And I can see the saved grades information on the “Student Page”

Scenario: new self evaluation from student
    Given all grade fields for self evaluation are filled
    When I try to submit the self evaluation
    Then the grades are properly assigned for me

Scenario: new partial self evaluation from student
    Given I am a “Student” 
    And I have one or more grade fields blank 
    And I am on “Self Evaluation Page”
    When I select the “Submit” option
    Then An error message is displayed 
    And I’m brought back to “Self Evaluation Page”

Scenario: new partial self evaluation from student
    Given at least one grade field for self evaluation is blank
    When I try to submit the self evaluation
    Then the grades are not assigned
    And all the other grades on the system were not modified

Scenario: revision page without discrepancies
    Given I am a “Teacher” 
    And There are five goals on my class
    And I have only three students named “Júlia”, “Jorge”, “Jeremias” 
    And “Júlia” self-evaluated herself with the grades “MA”,”MA”,”MA”,”MA”,”MA” 
    And my evaluation for her was “MANA”, “MA”, “MA”, “MA”, “MA”
    And “Jorge” self-evaluated himself with the grades “MPA”, “MPA”, “MPA”, “MPA”, “MPA” 
    And my evaluation for him was “MA”, “MA”, “MA”, “MA”, “MA”
    And “Jeremias” self-evaluated himself with the grades “MA”, “MA”, “MA”, “MA”, “MA” 
    And my evaluation for him was “MA”, “MA”, “MA”, “MA”, “MA”
    When I access the “Grades Revision Page”
    Then I see “0” in the “Pending” counter
    And I see “0” in the “Solved” counter
    And I see “0” in the “Total” counter
    And I see “0%” in the “Percentage” counter
    And The list of students with discrepancies is "empty"

Scenario: revision page with one discrepancy
    Given I am a “Teacher” 
    And There are five goals on my class
    And I have only three students named “Júlia”, “Jorge”, “Jeremias” 
    And “Júlia” self-evaluated herself with the grades “MA”,”MA”,”MA”,”MA”,”MA” 
    And my evaluation for her was “MANA”, “MA”, “MA”, “MA”, “MA”
    And “Jorge” self-evaluated himself with the grades “MPA”, “MPA”, “MPA”, “MPA”, “MPA” 
    And my evaluation for him was “MA”, “MA”, “MA”, “MA”, “MA”
    And “Jeremias” self-evaluated himself with the grades “MA”, “MA”, “MA”, “MA”, “MA” 
    And my evaluation for him was “MANA”, “MANA”, “MA”, “MA”, “MA”
    When I access the “Grades Revision Page”
    Then I see “1” in the “Pending” counter
    And I see “0” in the “Solved” counter
    And I see “1” in the “Total” counter
    And I see “33%” in the “Percentage” counter
    And The list of students with discrepancies has one student named “Jeremias” with the 2 discrepant grades in a different color




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

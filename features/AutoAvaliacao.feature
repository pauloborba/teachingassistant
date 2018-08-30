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

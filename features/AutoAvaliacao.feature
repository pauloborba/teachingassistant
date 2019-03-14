Feature: self evaluation
	As a student 
	I want to evaluate my grades while comparing to the teacher´s 
    evaluation
    so that I can contest the professor´s evaluation in case there's
    any difference.

    Scenario: self evaluating a student grade
        Given I am logged as a “student”
        And I am at the “self-evaluation” page and I am arretado
        And all the “grades” are selected
        When I ask the system to save the “grades”
        Then I can see a confirmation message
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

    Scenario: see the error message for saving the self-evaluation
	Given I am logged as a “student”
	And I am at the “self-evaluating” page
	And not all “grades” are selected
	When I ask the system to save the selected “grades”
	Then I can see an error message for not selecting all the 
	“grades”

    Scenario: Check list of variance with no variance
        Given I am logged as a “Teacher”
        And  There are no “variance” between “student’s grades” and
        “teacher’s grade”
        When I try to check the “variance list”
        Then I can see an error message

    Scenario: Check list of variance
	Given I am logged as a “Teacher”
	And one-third of the “students” have “variance”
	When I try to see the “variance list”
	Then the “variance list” is shown with “1” quantity, “33” percent
	and the “student’s grade” 

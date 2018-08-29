Feature: Self-evaluation
	As a Student
	I want to be able to view the grades given to me by the teacher
	So that I can add my self evaluation accordingly

Scenario: Filling self evaluation grades success
  Given the grades for the user "José" have been filled in the system
  When I try to self evaluate as the user "José"
  Then the self evaluation grades are stored properly

Scenario: Filling self evaluation grades success web
  Given I am at the grades page
  And it shows my grades haven already been filled
  When I select the option to fill the self evaluation
  Then I'm able to self evaluate
  And turn in the self evaluation
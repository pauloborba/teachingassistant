Feature: Self evaluation
	As a student
	I want to be able to give myself grades on each learning goal
	So that my self evaluation will be registered in the system

Feature: Self evaluation
	As a teacher
	I want to be able to see the self evaluation of my students
	So that I can know when a student made a discrepant self evaluation






Scenario: Adding grades to all learning goals (GUI)
	Given I am logged as the student “Pedro”
	And I am at the “self evaluation” page
	And I can see the teacher gave me “MA, MPA, MPA” on the learning goals
	When I put “MPA, MPA, MPA” for the learning goals
	And I confirm the self evaluation
	Then I can see a screen telling me that the self evaluation was a success

Scenario: Adding grades to all learning goals (Service)
	Given The student “Pedro” is registered in the system
	And The student “Pedro” has the grades “MA, MPA, MPA” assigned by the teacher
	When the user logged as “Pedro” submits the grades “MA, MANA, MPA” as self evaluation
	Then The grades “MA, MANA, MPA” are registered in the system as the self evaluation of the student “Pedro”


Scenario: Not adding grades to all learning goals (GUI)
	Given I am logged as the student “Pedro”
	And I am at the “self evaluation” page
	And I can see the teacher gave me “MA, MPA, MPA” on the learning goals
	When I put “MA, MANA, -” for the learning goals
	And I confirm the self evaluation
	Then I can see a screen telling me that i haven’t put a self evaluation for all learning goals and have to go back

Scenario: Not adding grades to all learning goals (Service)
	Given The student “Pedro” is registered in the system
	And The student “Pedro” has the grades “MA, MPA, MPA” assigned by the teacher
	When the user logged as “Pedro” submits the grades “MA, -, MPA” as self evaluation
	Then No grades will be registered as the self evaluation of the student “Pedro”
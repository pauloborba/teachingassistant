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
	And *suggested change*


Scenario: No discrepancies found
	Given I am logged as the teacher “Marcelo”
	And I am at the “students grades” page
	And I can see the grades “MA, MPA, MA, MANA, MPA” in the row “Bruno”, the grades “MPA, MA, MANA, MPA, MA” in the row “Carlos” and the grades “MPA, MA, MA, MPA,	MANA” in the row “Maria” on grades sub row
	And I can see the grades “MA, MPA, MPA, MANA, MPA” in the row “Bruno”, the grades “MANA, MA, MANA, MPA,	MPA” in the row “Carlos” and the grades “MPA, MPA, MA, MPA, MANA” in the row “Maria” on the self evaluation sub	row
	When I select the option to see the discrepant self evaluations
	Then I can see a screen that shows me there are “0” discrepant self evaluations, “0%” of the students made a discrepant self evaluation and no students are listed in the list of discrepant self evaluations

Scenario: One discrepancy found
	Given I am logged as the teacher “Marcelo”
	And I am at the “students grades” page
	And I can see the grades “MA, MPA, MA, MANA, MPA” in the row “Bruno”, the grades “MPA, MA, MANA, MPA, MA” in the row “Carlos” and the grades “MPA, MA, MA, MPA,	MANA” in the row “Maria” on grades sub row
	And I can see the grades “MA, MPA, MPA, MANA, MPA” in the row “Bruno”, the grades “MA, MA, MPA, MPA, MPA” in the row “Carlos” and the grades “MPA, MPA, MA,	MPA, MANA” in the row “Maria” on the self evaluation sub row
	When I select the option to see the discrepant self	evaluations
	Then I can see a screen that shows me there is “1” discrepant self evaluation, “33%” of the students made a	discrepant self evaluation and “Carlos” is listed in the list of discrepant self evaluation
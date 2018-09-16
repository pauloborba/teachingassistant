Feature: 
	As a student registered in the system 
	I want to have access to all the ratings associated by the Teacher to my activities 
	So that I can fill the system with my self-evaluation grades


Scenario: Successful self-evaluation
	Given I'm logged in the system as the student with name "Layon" and password "1234" as credentials
	And "Layon" has no self-evaluations yet
	And All the teatcher's evaluations are filled
	And I fill all the self-evaluation grades
	Then the self-evaluation of "Layon" is registered in the system.


Scenario: Unsuccessful self-evaluation
	Given I'm logged in the system as the student with name "Layon" and password "1234" as credentials
	And "Layon" has no self-evaluations yet
	And I fill only 1 grade of 5 existing exams
	And I submit my self-evaluation
	Then a message is shown informing the need of filling all the exams before submitting
	Then the missing fields are pointed.
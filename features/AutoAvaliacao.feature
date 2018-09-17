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


Scenario: Submission without discrepancy
	Given the user "João" is in the self-evaluating page
	And "João" has a total of 5 exams rated by the teatcher as following: MA, MA, MPA, Mana, MPA
	When "João" rates his exams as the folling: MA, MPA, MPA, Mana, MPA
	Then system stores all the 5 ratings.


Scenario: Submission with discrepancy
	Given the user "João" is in the self-evaluating page
	And "João" has a total of 5 exams rated by the teatcher as following: MA, Mana, MPA, Mana, MPA
	And "João" hasn't submitted any rating yet
	When "João" rates his exams as the folling: MA, MPA, MA, MPA, MPA
	Then system stores all the 5 ratings and tag the self-evaluation as dicrepant.



This is part of the commit test 3
This is part of the test commit 1.
This is part of the test commit 2.


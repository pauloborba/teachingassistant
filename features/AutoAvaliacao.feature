Feature: Auto-Avaliação
As a student 
I want to be able to do my self-evaluation
So that i can later question my grades to the teacher

Scenario: New Self Evaluation
	Given the system has the goals "Entender conceitos de requisitos” and “Especificar requisitos com qualidade”
	And there is no self evaluation from the student “Joaozinho”
	When “Joaozinho” tries to submit his self evaluation of the goals “Entender conceitos de requisitos” and “Especificar requisitos com qualidade” with “MPA” and “MANA”
	Then the system stores the self evaluation from the student “Joaozinho”
	
Scenario: New Self Evaluation Web
	Given I am in the “auto-avaliação” page
	And I do not see a self evaluation from the student “Joaozinho”
	When I submit the self evaluation as the student “Joaozinho” for the goals “Entender conceitos de requisitos” and “Especificar requisitos com qualidade” with “MPA” and “MANA”
	Then I see a confirmation message 
	And I see the self evaluation from the student “Joaozinho"

Scenario: Error in Self Evaluation 
	Given the system has the goals “Entender conceitos de requisitos” and “Especificar requisitos com qualidade” 
	And there is no self evaluation for the student “Joaozinho”
	When “Joaozinho” tries to submit his self evaluation with “MPA” for the goal “Entender conceitos de requisitos”
	And "Joaozinho" does not fill the grade for the goal “Especificar requisitos com qualidade”
	Then the system does not store the self evaluation from the student “Joaozinho”
	
Scenario: Error in Self Evaluation Web
	Given I am in the “auto-avaliação” page
	And I do not see a self evaluation from the student “Joaozinho”
	When I submit the self evaluation as the student “Joaozinho” for the goals “Entender conceitos de requisitos” and “Especificar requisitos com qualidade” with “MPA” and “”
	Then I see an error message 
	And I do not see the self evaluation from the student “Joaozinho"
	And I go back to the "auto-avaliação" page
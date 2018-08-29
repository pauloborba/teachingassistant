Feature: Realizar auto avaliação
As a student
I want to evaluate myself regarding the discipline goals
So that I can have my grades considered to the final grade	

Scenario: Add a student grade
	Given that I am logged in with the login “cco2” and the password “1234”
	And I am on self evaluation page
	And There are the fields ‘Entender conceitos de requisitos’ and ‘Especificar requisitos com qualidade’ 
	When I fill all the fields with the field ‘Entender conceitos de requisitos’ with “MA” and the field ‘Especificar requisitos com qualidade’ with the goal “MPA”
	And submit the grades
	Then a message of success is loaded on screen 

Scenario: Add my own grades
	Given that the student “Claudio Carvalho” has no grades stored
	When the grades of the student “Claudio Carvalho” are submitted
	Then the grades are stored

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

Scenario: Add my own grades but at least one
		Given that I am logged in with the login “cco2” and the password “1234”
		And I am on the self evaluation page
		When I fill all the fields with the goals “MA, MPA or MANA” but at least one
		And I submit the grades
		Then a warning is loaded on screen indicating the missing fields


Scenario: Add my own grades but at least one
		Given the student “Claudio Carvalho” has no grades stored
		When the grades are submitted and there are at least one grade missing
		Then the grades are not stored

Scenario: Visualizing students grades with no discrepancy 
	Given the student “Claudio Carvalho” has “MA” for the goal “Entender conceitos de requisitos” 
	And the professor graded him for the goal “Entender conceitos de requisitos”  with “MA”
	Then the concepts and goals are loaded on screen

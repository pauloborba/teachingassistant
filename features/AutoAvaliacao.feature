Feature: Auto-avaliação
				As a student 
				I want to add a concept (MA, MPA, MANA) for each 						       
					learning goal of the class
				So that my concepts will be stored and used on my 						   
					evaluation



Scenario: Adding concepts to all learning goals
				Given I am at the “grades” page
				And I am logged as the student “João”
				And I added a concept for every learning goal
				When I submit my self evaluation
				Then I can see a success message
				And All the concepts i assigned to each learning goal are stored	
					exactly the way i put
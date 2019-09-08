Feature: Auto-avaliação
				As a student 
				I want to add a concept (MA, MPA, MANA) for each 						       
					learning goal of the class
				So that my concepts will be stored and used on my 						   
					evaluation
//novo commit master



Scenario: Adding concepts to all learning goals
				Given I am at the “grades” page
				And I am logged as the student “João”
				And I added a concept for every learning goal
				When I submit my self evaluation
				Then I can see a success message
				And All the concepts i assigned to each learning goal are stored	
					exactly the way i put


Scenario: Adding concepts but not to all learning goals
				Given I am at the “grades” page
				And I am logged as the student “Maria”
				And I didn’t add a concept for all the learning goals
				When I submit my self evaluation
				Then I can see an error message telling me to fill all the 
					learning goals before submitting the self evaluation
				And None of the concepts i put on my self evaluation are stored
				And .......





Scenario: Listing discrepant self evaluations (none found)
				Given I am at the “ESS class” page
				And I am logged as teacher
				And No student did a discrepant self evaluation
				When Select the “list discrepant evaluations” option
				Then I can see a message stating that no discrepant evaluations were done




Scenario: Listing discrepant self evaluations (one found)
				Given I am at the “ESS class” page
				And I am logged as teacher
				And One student submitted a discrepant self evaluation
				[FIX]
				When Select the “list discrepant evaluations” option
				And .........
				Then I can see the student “Pedro” that did a discrepant self evaluation listed on the screen 
				And I can see the learning goals he submitted higher than me highlighted

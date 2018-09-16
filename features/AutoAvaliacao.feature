Feature Autoavaliação 
	As a Student
	I want to ssign concepts (MA, MPA, e MANA) to my goals, comparing them to those given by the professor
    So that I can evaluate myself

	
	Scenario Assigning metas
	    Given the system doesn’t have self assigned concepts for metas: “goal 1” and “goal 2” of user “Bob”
		When User Bob assigns “goal 1” and “goal 2” as “MPA” and “MANA” 		
        Then The System stores “MPA” and “MANA”

    Scenario Assigning metas
        Given I am at the metas page
        And there is “meta” not yet assigned
        When I assign “meta” as “MA” 
        And I select “enviar”   
        Then I can see a confirmation message 
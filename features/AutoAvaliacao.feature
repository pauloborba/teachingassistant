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

    Scenario Assigning metas
        Given the system doesn’t have self assigned concepts for metas: “goal 1” and “goal 2” of user “Bob”
	    When User Bob assigns “goal 1” as “MPA”
 	    Then The System does not store “goal 1” as “MPA”

    Scenario Assigning metas
        Given I am at the metas page
        And there are “meta 1” and “meta 2” not yet assigned
        When I assign “meta 1” as “MANA”
        And select “enviar”
        Then I can see an error message

    Feature Autoavaliação 
	    As a Professor
        I want to Assign concepts (MA, MPA, e MANA) to the metas of my students, and for them to auto evaluate themselves
        So that I can check for harmful discrepancies in their self evaluations

    Scenario Visualizing dicrepanties
        Given The professor is at the page “unidade”
        And The Student “Carlão” was given “MPA”, “MPA”, “MPA”, “MPA”, “MPA” by the professor
        And The Student “Carlão” was given “MA”, “MPA”, “MANA”, “MANA”, “MPA” by himself
        And The Student “Zeus” was given “MANA”, “MA”, “MPA”, “MANA”, “MPA” by the professor
        And The Student “Zeus” was given  “MANA”, “MA”, “MPA”, “MANA”, “MPA” by himself
        And The Student “Genius” was given “MA”, “MA”, “MA”, “MA”, “MA” by the professor
        And The Student “Genius” was given “MANA”, “MANA”, “MANA”, “MANA”, “MANA” by himself
        When The professor selects the menu “discrepancies”
        Then He sees “ number of students with discrepancies: 0” 
        And He sees “percentage of students with discrepancies: 0%”
        And He sees “list of students with discrepancies: “” ”

    Scenario Visualizing dicrepanties
        Given The professor is at the page “unidade”
        And The Student “Carlão” was given “MPA”, “MPA”, “MPA”, “MPA”, “MPA” by the professor
        And The Student “Carlão” was given “MA”, “MA”, “MA”, “MA”, “MA” by himself
        And The Student “Zeus” was given “MANA”, “MA”, “MPA”, “MANA”, “MPA” by the professor
        And The Student “Zeus” was given  “MANA”, “MA”, “MPA”, “MANA”, “MPA” by himself
        And The Student “Genius” was given “MA”, “MA”, “MA”, “MA”, “MA” by the professor
        And The Student “Genius” was given “MANA”, “MANA”, “MANA”, “MANA”, “MANA” by himself
        When The professor selects the menu “discrepancies”
        Then He sees “number of students with discrepancies: 1” 
        And He sees “percentage of students with discrepancies: 34%”
        And He sees “list of students with discrepancies: Carlão”

Feature: Discrepancy
	As a professor using the system
	I want to be able to see the results of my students' self assessments done using the concepts MANA, MPA, and MA for every goal so that I can see the relevant data related to the discrepancies between their self assessment and my assessment of them.

Scenario: No discrepancy found
	Given I'm at the Discrepancy page 
    And The student "Lucas" has submitted his self assessment
	And The student "Lucas" has 20% discrepancy
	When I press the button to show the discrepancies
	Then I can see an error message

Scenario: Discrepancy found
	Given I'm at the Discrepancy page
	And The student "Lucas" has submitted his self assessment
	And The student "Lucas" has 30% discrepancy
	When I press the button to show the discrepancies
	Then I see a the name "Lucas"
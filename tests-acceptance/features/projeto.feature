Feature: As a receptionist 
        I want to register students
        So that I can schedule an appointment

Scenario: auto filling student’s data with database consultation
	Given I am at the register student page
	Given I am logged as a "receptionist"
	Given "Joãozinho" already had an appointment before
	Given "Joãozinho"’s course is "political science"
	Given "Joãozinho"’s CPF is "190823432-00"
	Given "Joãozinho"’s gender is "Male"
	Given "Joãozinho"’s telephone number is "99090-9876"
	When I select the "search existing student" option
	When I select "Joãozinho" at the students database page
	Then I can see the name "Joãozinho", course "political science", CPF "190823432-00", gender "Male" and telephone number "99090-9876" at the register student page


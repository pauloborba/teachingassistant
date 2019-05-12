Feature: As a receptionist 
        I want to register students
        So that I can schedule an appointment

Scenario: Auto filling student’s data with database consultation
	Given I am at the register student page
	Given "Joãozinho" already had an appointment before
	Given "Joãozinho"’s course is "political science"
	Given "Joãozinho"’s CPF is "190823432-00"
	Given "Joãozinho"’s gender is "Male"
	Given "Joãozinho"’s telephone number is "99090-9876"
	When I select the "search existing student" option
	When I select "Joãozinho" at the students database page
	Then I can see the name "Joãozinho", course "political science", CPF "190823432-00", gender "Male" and telephone number "99090-9876" at the register student page

Scenario: Unsuccessfully student registration
	Given I am at the register student page
	Given no professional have been chosen
	When I ask the system to register 
	Then I can see an error message

Scenario: Schedule an appointment
	Given I am at the Scheduling page
	Given the professional "Kátia" is available on "August" "10" at "8am"
	When I select "Teixeira" at the "students" list
	When I select "Katia" at the "professionals" list
	When I select date "August" "10" on "8am"
	When I ask the system to schedule
	Then I can see the scheduled appointment on "August" "10" at "8am"

Scenario: Search for an appointment
	Given  I am at the appointments page
	Given the professional "Estyvison" have scheduled appointments on "July" "3" at "2pm" and "4pm"
	When I select "Estyvison" at the "professionals" list
	When I select "July" in the "months" option
	Then I can see "Estyvison"’s scheduled appointments on "July" "3" at "2pm" and "4pm"
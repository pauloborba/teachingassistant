Feature:adicionar auto-avaliação
	As a student
	I want to evaluate my goals 
	So that i have parameters of how aware am I of the concepts studied
	And the evaluation process
	
Scenario:Sucessful fill
    Given the student “Arthur Castro” grades page
    When the grade tables are filled in with “MANA,MPA,MA” 
And i send 
And it is successfully send
    Then i am shown a page with a success message
    And the grades are added to the system 

Scenario:Successful fill
    Given the student “Arthur Castro” grades page
    When the grade tables are filled in with “MANA,MPA,MA” 
And i send 
And it is successfully send
    Then the grades are added to the system 


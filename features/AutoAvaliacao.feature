Feature:adicionar auto-avaliação
<<<<<<< HEAD
=======
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

Scenario:Empty goal
    Given the student “Arthur Castro” grades page
    When one of the grades isn’t filled in
	And i send
    Then i am shown a error page

Scenario:Empty goal
    Given the student “Arthur Castro” grades page
    When one of the grades isn’t filled in
	And i send
    Then the grades are not added to the system  

Scenario:show discrepancy when there is no discrepancy
	Given the grades of the 3 students in the system where no student have discrepancy
	When I access the discrepancy page
Then I see the field “Alunos Discrepantes” as 0 
And the field “porcentagem de discrepancia” as 0% 
And “Alunos” table is empty



Feature:adicionar auto-avaliação discrepantes
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

Scenario:Empty goal
    Given the student “Arthur Castro” grades page
    When one of the grades isn’t filled in
	And i send
    Then i am shown a error page

Scenario:Empty goal
    Given the student “Arthur Castro” grades page
    When one of the grades isn’t filled in
	And i send
    Then the grades are not added to the system  
    And an error message is shown
    saying that it wasnt completely filed.

Scenario:show discrepancy when there is no discrepancy
	Given the grades of the 3 students in the system where no student have discrepancy
	When I access the discrepancy page
	Then I see the field “Alunos Discrepantes” as 0 
	And the field “porcentagem de discrepancia” as 0% 
	And “Alunos” table is empty

Scenario:show discrepancy when there is discrepancy
	Given the grades of the 3 students in the system where the student “Arthur Castro” has discrepancy
	When I access the discrepancy page
Then I see the field “Alunos Discrepantes” as 1 
And the field “porcentagem de discrepancia” as 33% 
And “Alunos” table has “Arthur Castro”



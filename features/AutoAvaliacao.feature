As a student
I want to be able to self evaluate my concepts
So that my teacher will be able to see my point of view about them

Given I am at “Self-evaluation” page
And the concepts given by the teacher are shown
When I create a self-evaluation with “MA” filled in for each concept
Then I can see a confirmation message

Given the system has a concept evaluation from professor “Paulo Borba” assigned to student “Lucas Barros” with a value of “MA” for each concept
And the system does not have student’s “Lucas Barros” self-evaluation
When I create a new self-evaluation for “Lucas Barros” with a value of “MA” for each concept
Then the self-evaluation is stored by the system.

Given I am at “Self-evaluation” page
And the concepts given by the teacher are shown
When I create a self-evaluation with “MA” filled in for each concept except the last one, that I left blank
Then I can see a error message

Given the system does not have “Lucas Barros”’s self-evaluation
When I create a new self-evaluation for “Lucas Barros” with a value of “MA” for each concept except the last one, that I left blank
Then the self-evaluation is not stored by the system
And a error message response is sent

Given I am logged in as “teacher”
And I have only three students: “Jorge”, “João”, “Paulo”
And “Jorge” self-evaluated with “MA, MA, MA, MA, MA”
And I evaluated “Jorge” with “MA, MA, MA, MA, MA”
And “João” self-evaluated with “MPA, MPA, MPA, MPA, MPA” 
And I evaluated “João” with “MA, MA, MA, MA, MA”
And “Paulo” self-evaluated with “MA, MA, MA, MA, MA”
And I evaluated “Paulo” with “MANA, MANA, MA, MA ,MA”
When I select “show discrepancy report” option
Then a list of discrepancy shows “1” student(s)
And “Total de alunos” shows “1” and “Porcentagem da turma” shows “33%”

Given I am logged in as “teacher”
And I have only three students: “Jorge”, “João”, “Paulo”
And “Jorge” self-evaluated with “MA, MA, MA, MA, MA”
And I evaluated “Jorge” with “MPA, MA, MA, MA, MA”
And “João” self-evaluated with “MPA, MPA, MPA, MPA, MPA” 
And I evaluated “João” with “MA, MA, MA, MA, MA”
And “Paulo” self-evaluated with “MA, MA, MA, MA, MA”
And I evaluated “Paulo” with “MA, MA, MA, MA ,MA”
When I select “Show discrepancy report” option
Then a list of discrepancy shows “0” student(s)
And “Total de alunos” and “Porcentagem da turma” show “0”

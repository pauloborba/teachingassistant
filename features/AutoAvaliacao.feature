Feature: self-evaluation
As a student
I want to grade myself and see my professor’s grade
So that my evaluation process is concluded

GUI (interação com usuário)
Scenario: self-evaluating
Given I am at the "Grades" page
When I see empty boxes where my self-evaluated grades should go
And I see the boxes where my professor-evaluated grades are filled up
And I fill the “Requisitos” grade up
Then I’m still at the "Grades" page
When I fill the subsequent “Gerência de configuração”, “Gerência de projeto”, “Testes”, “Projeto e implementação”, and “Refatoração” grades up
Then I’m still at the "Grades" page

Serviço (interação com servidor)
Scenario: self-evaluating
Given students are stored in the system
And the professor is allowed to apply a grade to any student
And a student is allowed to apply a grade to him or herself
When I, as student, open the page, I can see the grade applied to me by the professor
And I can see the space for inputting my grade
And I input my “Requisitos” grade
Then the system stores that grade in the server
When I input the subsequent “Gerência de configuração”, “Gerência de projeto”, “Testes”, “Projeto e implementação”, and “Refatoração” grades up
Then the system stores those grades in the server

GUI (interação com usuário)
Scenario: self-evaluating
Given I am at the "Grades" page
When I see empty boxes where my self-evaluated grades should go
And I see the boxes where my professor-evaluated grades are filled up
And I fill the “Requisitos” grade up
Then I’m still at the "Grades" page
When I fill the “Gerência de configuração” grade with “MA”
Then I get an error response that that grade is not valid

Serviço (interação com servidor)
Scenario: self-evaluating
Given students are stored in the system
And the professor is allowed to apply a grade to any student
And a student is allowed to apply a grade to him or herself
When I, as student, open the page, I can see the grade applied to me by the professor
And I can see the space for inputting my grade
And I input my “Requisitos” grade
Then the system stores that grade in the server
When I input the “Gerência de configuração” grade, which is “MA”
Then the system tries to store this grade in the server, but it doesn’t recognize it
And the server sends back an error message saying it will not store de grade, because it’s not a valid grade
And it ends

GUI
Scenario: checking self-evaluations
Given I am at the "Grades" page
And I can see the discrepancies in all gradings of all students
And I see three students, “Student1”, “Student2”, “Student3”
And “Student1” have discrepancies, so he’s in a red font
And “Student2” and “Student3” don’t have discrepancies, so they’re in a black font
When I click on the “Alunos” tab
And I change the type of listing
Then I’m at the “Alunos com notas discrepantes” page
And I now see only “Student2” and “Student3”
And “Student2” has a 16,6% discrepancy percentage when self-grading higher in comparison to the professor
And “Student3” has 33,33% discrepancy percentage, with lower self-grading in comparison to the professor
And the font color of the percentage of “Student2” is black, because he didn’t go over the threshold of 25%
And the font color of the percentage of “Student2” is also black, because he only graded lower then the professor

GUI
Scenario: checking self-evaluations
Given I am at the "Grades" page
And I can see the discrepancies in all gradings of all students
And I see three students, "André Valença", “Mateus Nascimento", “Vinícius Padilha”
And “André Valença” have discrepancies, so he’s in a red font
And “Mateus Nascimento” and “Vinícius Padilha” don’t have discrepancies, so they’re in a black font
When I click the “Alunos” tab
And I change the type of listing
Then I’m at the “Alunos com notas discrepantes” page
And I now see only “André Valença”
And he has 33,33% higher self-grading then the professor
And that means he went over the threshold of 25% higher-grading

Criando um commit para a questão 14
Criando outro commit para a questão 14

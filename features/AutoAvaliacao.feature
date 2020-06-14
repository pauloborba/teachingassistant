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

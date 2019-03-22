Feature self-evaluation
As a student
I want to do a self-evaluation of my goals and progress
So that I can improve them and compare with my professor evaluation

GUI:
Scenario doing self-evaluation
Given I’m at the “Student self-evaluation” page
And I see no grades for the student “Daniel” learning goals
When I assign “MA, MA, MA” for “Daniel” goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”
And I submit my self-evaluation
Then I’m at the “Student self-evaluation” page
And I can see the grades assigned to the student “Daniel”
And I can see my professor evaluation about me

Service:
Scenario self-evaluation
Given there is no grades assigned in the system to the student “Daniel” learning goals
When “Daniel” assign “MA” for goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”
And submit it to the system
Then the grades are all registered to the goals
And the professor evaluation is now available

Cenarios mal sucedido

GUI:
Scenario doing self-evaluation
Given I’m at the “Student self-evaluation” page
And I see no grades for the student “Daniel” learning goals
When I assign “MA”, “MA” for “Daniel” goals “Entender conceitos de requisitos, Especificar requisitos com qualidade”
And I don’t assign a grade for “Entender conceitos de gerência de configuração”
Then I’m at the “Student self-evaluation” page
And I can see an error message
And I can’t submit my self-evaluation

Service:
Scenario self-evaluation
Given there is no grades assigned to the student “Daniel” learning goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”
When he doesn’t assign a grade for “Entender conceitos de requisitos” goal
Then the system doesn’t accept the self-evaluation submission

Scenario checking student goals discrepancy
Given I’m at the “Evaluation discrepancy” page
And I can see “Joao”, “Daniel”, “Caio” discrepancy displayed 
And I see the student “Joao” with evaluation “MA, MA, MPA, MA, MA” and self-evaluation “MA, MA, MA, MA, MA”
And I see the student “Daniel” with evaluation “MA, MA, MA, MA, MA” and self-evaluation “MPA, MPA, MPA, MPA, MPA”
And I see the student “Caio” with evaluation “MA, MA, MA, MA, MA” and self-evaluation “MA, MA, MA, MA, MA”
When I access the discrepancy list of students
Then I can see “Joao” with “20%” discrepancy
And I can see “Daniel” with “0%” discrepancy
And I can see “Caio” with “0%” discrepancy
And I can see an empty list of students with discrepancy higher than “30%”

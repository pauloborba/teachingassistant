Feature: self evaluation
In order to complete my process of evaluation
As a student 
I want to evaluate me for each goal of the subject

GUI
Scenario: student doing his self-evaluation
Given The teacher has attributed "MPA, MA, MANA" for the average
learning goals
And I am at the "Auto Avaliação" page
When I fill all the empty grade spaces for self-evaluation
Then I can see the button “Enviar” turning into a black color
And i am still at the “Auto Avaliação”  page
And I see grades from my teacher and my own self-evaluation grades

Servico
Scenario: student doing his self-evaluation
Given The student “Cicrano” has "MPA, MA, MANA" for the average
learning goals stored in system
When “Cicrano” sends “MPA, MA, MA” for his three self-evaluation grades
Then the system stores “MPA, MA, MA” for his self-evaluation grades in the system.
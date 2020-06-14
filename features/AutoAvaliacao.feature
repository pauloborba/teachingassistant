Feature: self-evaluation

In order to complete my process of evaluation
As a student
I want to give myself a grade for each goal of the subject

GUI
Scenario: student input own grade
Given The teacher has attributed "MA, MPA, MPA" for the average learning goals
And I'm at the "Auto avaliação" page
When I select the empty box below the "MA" given by the teacher for the “Entender conceitos de requisitos" goal
Then I'm still at the grades page
When I fill the box with my self-evaluation grade
Then I see the filled up box background become a light green
And I’m still at the "Auto avaliação" page
Then I fill the box with my self-evaluation grade for the subsequent goals
And I see the grades given by the teacher in the upper row with a white background for each box, and the self evaluated grades given by the student in the bottom row with a light green background
Then I see the "Enviar" button shift to a darker color
And I’m still at the "Auto avaliação" page

Serviço
Scenario: student input own grade
Given The student "Mateus Felipe" is stored in a system with ”MA, MPA, MPA” for the evaluated learning goals
When "Mateus Felipe" sends ”MA, MA, MPA” for his self-evaluated grades for each goal
Then the system stores  ”MA, MA, MPA” for his self evaluated grades in the server

GUI
Scenario: student input own grade but misses one goal
Given The teacher has attributed "MA, MPA, MPA" for the average learning goals
And I'm at the "Auto avaliação" page
When I select the empty box below the "MA" given by the teacher for the “Entender conceitos de requisitos" goal
Then I'm still at the grades page
When I fill the box with my self-evaluation grade
Then I see the filled up box background become a light green
And I’m still at the "Auto avaliação" page
Then I fill the box with my self-evaluation grade for the subsequent goals but not the last one
And I see the grades given by the teacher in the upper row with a white background for each box, and the self evaluated grades given by the student in the bottom row with a light green background
Then I ask the system to submit the self-evaluation
And it shows me an error message
And I’m still at the "Auto avaliação" page

Serviço
Scenario: student input own grade
Given The student "Mateus Felipe" is stored in a system with ”MA, MPA, MPA” for the evaluated learning goals
When "Mateus Felipe" sends ”MA, MA, -” for his self-evaluated grades for each goal
Then the system doesn't stores  ”MA, MA, -” for his self-evaluated grades in the server
Then something else happens as asked by the stakeholders

Feature: Auto-avaliação
As a Professor
I want to be able to check the self assigned grades given by my students
And be able to check the percentage of higher grades compared to mine
So that I can know if the student is being accurate and honest with his self grading

Scenario: Estudante cadastrando sua própria nota com sucesso
Given I am at the “Self-Grades” menu
When I set the grade “MA” for the “Requirements” topic
Then I can see a confirmation message 

Scenario: Estudante cadastrando sua própria nota sem sucesso
Given I am at the “Self-Grades” menu
When I set the grade “-1” for the “Requirements” topic
Then I can see an error message
Then grade is not set
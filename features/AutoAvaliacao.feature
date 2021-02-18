Feature: As a student enrolled in this course
I want to perform a self-evaluation on my performance in this course
So that I can have a say on my final grade 

Scenario: Performing self-evaluation sucessfully
Given I am at the “Auto-avaliação” page
And logged in as “John Smith”
And I have not done my self-evaluation
When I fill in my self-evaluation with “MA” for all three goals
Then I am taken back to the “Página do aluno” page
And I can see a confirmation message stating that my self-evaluation was recorded
And there is no prompt asking me to perform my self-evaluation

Scenario: Performing self-evaluation successfully
Given there is no self-evaluation stored for student “John Smith”
When I enter the grades “MA, MA, MA” for student “John Smith”
Then the grades “MA, MA, MA” are properly stored as self-evaluation for student “John Smith”

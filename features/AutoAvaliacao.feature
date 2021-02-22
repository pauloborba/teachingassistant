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

Scenario: Performing self-evaluation unsuccessfully (Not all fields were filled)
Given I am at the “Auto-avaliação” page
And logged in as “John Smith”
And I have not done my self-evaluation
When I fill the first two goals with “MA”, leaving the last one empty
Then I am still at the “Auto-avaliação” page
And I can see an error message
And placeholder

Scenario: Performing self-evaluation unsuccessfully (Not all fields were filled)
Given there is no self-evaluation stored for student “John Smith”
When I enter the grades “MA, MA” for student “John Smith”
Then the system returns an error message
And the grades “MA, MA” are not stored for student “John Smith”

Scenario: No discrepant self-evaluations
Given there are three students enrolled, with the following grades and self-evaluations (in this order): “John Smith - MPA, MA, MA, MA, MA / MA, MA, MA, MA, MA; Foo Bar - MA, MA, MA, MA, MA / MA, MA, MA, MA, MA; Bobby Tables - MA, MA, MA, MA, MA / MPA, MPA, MPA, MPA, MPA
And I am logged in as a teacher
When I look at the discrepant self-evaluation page
Then I am told there are no discrepant self-evaluations

Scenario: Some students have discrepant self-evaluations
Given there are three students enrolled, with the following grades and self-evaluations (in this order): “John Smith - MA, MA, MA, MA, MA / MA, MA, MA, MA, MA; Foo Bar - MA, MA, MA, MA, MA / MA, MA, MA, MA, MA; Bobby Tables - MA, MA, MA, MANA, MANA / MPA, MPA, MPA, MPA, MPA
And I am logged in as a teacher
When I look at the discrepant self-evaluation page
Then I can see that one student (33% of the class) has a discrepant self-evaluation
And I can see a list containing “Bobby Tables - MA, MA, MA, MANA, MANA / MPA, MPA, MPA, MPA, MPA”

HOW COULD THIS BE

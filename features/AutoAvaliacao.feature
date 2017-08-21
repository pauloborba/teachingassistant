Feature: Self Evaluation
As a student
I want to tell the teacher the grades I believe I deserve
So that the teacher may see if the class believe the teacher is grading fair or not

Scenario: Student making self evaluation
Given that I am at the self evaluation page
And I am a logged student “Fulano”
When I choose the grades as “MA”, “MA”, “MPA”, “MPA”, “MA” and “MPA”
And I request to save them
Then the system will store my choices

Scenario: new self evaluation
Given I am a logged as student “Fulano”
When I save the self evaluation as “MA”, “MA”, “MPA”, “MPA”, “MA” and “MPA”
Then the system will store my choices

Scenario: Student making self evaluation
Given that I am at the self evaluation page
And I am a logged student “Fulano”
When I choose the grades as “MA”, “MA”, “MPA”, “MPA”, “” and “MPA”
And I request to save them
Then the system will show a error message 

Scenario: new self evaluation
Given I am a logged as student “Fulano”
When I save the self evaluation as “MA”, “MA”, “MPA”, “MPA”, “” and “MPA”
Then the system will not store my choices
And show a error message

Scenario: Teacher finding no disagreements about grades
Given I am a logged teacher “Ciclano”
When I open the self evaluation statistics page
Then I see a message about the lack of disagreements about the grades

Scenario: Teacher finding 3 disagreements about grades
Given I am a logged teacher “Ciclano”
When  open the self evaluation statistics page
Then I see that “Student A” disagrees with 3 grades 
And “Student B” disagrees with 2 grades
And “Student C” disagrees with 4 grades

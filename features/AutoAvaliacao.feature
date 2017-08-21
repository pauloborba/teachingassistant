Feature: Self Evaluation
As a student
I want to tell the teacher the grades I believe I deserve
So that the teacher may decide to change my grades

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

Feature: self evaluation
As: a student who has to auto-evaluate himself
I want to: select grades to evaluate all goals in one page
So that: my grades will be evaluated all at once in the system

Scenario: self evaluation
Given: I am at “Grades” page
And: I have chosen one grade for each one of the goals to be evaluated
When: I press “Finnish auto-evaluation”
Then: my grades will be stored on the system and no other changes will be made on system’s storage.


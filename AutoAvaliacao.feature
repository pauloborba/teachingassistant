Feature: self evaluation
As: a student who has to auto-evaluate himself
I want to: select grades to evaluate all goals in one page
So that: my grades will be evaluated all at once in the system

Scenario: successfull self evaluation
Given: I am at “Grades” page
And: I have chosen one grade for each one of the goals to be evaluated
When: I press “Finnish auto-evaluation”
Then: my grades will be stored on the system and no other changes will be made on system’s storage.

Scenario: unsuccessfull self evaluation
Given I am at “Grades” page
And I did not choose one grade for at least one of the goals to be evaluated
When I press “Finnish auto-evaluation”
Then a message appears showing “You has to choose one grade in each one of the goals to continue”
And (passo adicional)

Scenario: Grades analysing with no discrepancy
Given I am at “Grades” page
When I look at the grades table
Then  I can see no discrepancy messages or signs on screen

Scenario: Grades analysing with discrepancy
Given I am at “Grades” page
When I look at the grades table
And (ajuste de erro)
Then I can see one discrepancy message or sign on screen indicating evaluation discrepancy for one student

pegueno ajuste

Feature: Self-evaluation
As a Student
I want to perform a self-evaluation assigning concepts (MA, MPA, MANA) to a given course’s goals 
So that it can be properly stored by the System

Scenario: Successful self-evaluation
Given that the System has no records of the student “VM”s self-evaluation for the “SE” course’s goals “x”, “y” and “z”
When the “VM” “SE” course goals “x”, “y” and “z” are filled
Then the “VM” self-evaluation for the “SE” course is properly stored in the System

Scenario: Successful self-evaluation web
Given that I’m at the “SE” “self-evaluation page”
When I fill the goals “x”, “y” and “z” with concepts “MA”, “MA” and “MPA”
And I click the “confirmation button”
Then I can see a “confirmation message”

Scenario: Failed self-evaluation
Given that the System has no records of the student “VM”s self-evaluation for the “SE” course’s goals “x”, “y” and “z”
When the “VM” “SE” course goals “x”, “y” are filled
And “z” is left unfilled
Then the “VM” self-evaluation for the “SE” course is not stored in the System

Scenario: Failed self-evaluation web
Given that I’m at the “SE” “self-evaluation page”
When I fill the goals “x”, “y” with concepts “MA”, “MA”
And “z” is left unfilled
And I click the “confirmation button”
Then I can see an “error message”
And dummy-statement message

Scenario: Manage students no discrepancy web
Given that I’m logged as a “teacher”
And there are “0” students with discrepant self-evaluations
When I click the “manage students menu”
Then I’m taken to the “manage students page”
And the page shows that there are “0” students with self-evaluation discrepancy
And the percentage of students with self-evaluation discrepancy is “0%”
And I can see an empty students list

Scenario: Manage students with discrepancy web
Given that I’m logged as a “teacher”
And the student “VM” out of “3” students have a discrepant self-evaluation
When I click the “manage students menu”
Then I’m taken to the “manage students page”
And the page shows that there are “1” student with self-evaluation discrepancy
And the percentage of students with self-evaluation discrepancy is “33.33%”
And I can see a list with “VM”’s information in it
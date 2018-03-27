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
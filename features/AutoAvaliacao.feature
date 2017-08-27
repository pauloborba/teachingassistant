Feature: self-evaluation
As a student
I want to be able to self-evaluate 
So that I can provide my teacher with statistics about the course

Scenario: self-evaluation success (GUI)
Given that the student “João” is on the “Self-Evaluation Submit Page”
When “João” submits the grades “MPA” in the “Requirements Concepts” goal, “MA” in the “Requirements with Quality” goal and “MANA” in the “Configuration Management Concepts” goal
Then a success message is displayed
And “João” is redirected to the “Self-Evaluation Display Page”

Scenario: self-evaluation success (Controller)
Given that a student  named “João” is on the system
When the grades “MPA” in the “Requirements Concepts” goal, “MA” in the “Requirements with Quality” goal and “MANA” in the “Configuration Management Concepts” goal are submitted as Self-Evaluation grades
Then they are stored in the system

Scenario: self-evaluation failure not complete (GUI)
Given that the student “João” is on the “Self-Evaluation Submit Page”
When “João” submits the grades “MPA” in the “Requirements Concepts” goal and “MA” in the “Requirements with Quality” goal
Then a failure message is displayed
And “João” can see the “Configuration Management Concepts” cell in “Red”

Scenario: self-evaluation failure not complete (Controller)
Given that a student  named “João” is on the system
When the grades “MPA” in the “Requirements Concepts” goal and “MA” in the “Requirements with Quality” goal are submitted as Self-Evaluation grades
Then they are not stored in the System

Scenario: no discrepancy
Given that the students “João”, “Marcelo” and “Arthur” have no discrepancy in his grades.
When I access the “Self-Evaluation Statistics Page”
Then I can see a quantity panel containing “0”
And I can see a percentage panel containing “0%”


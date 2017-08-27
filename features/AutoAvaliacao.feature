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


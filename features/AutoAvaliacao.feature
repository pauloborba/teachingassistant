Feature : Self Evaluation
As a Student
I want to evaluate my own grades on each concept
AND see my teachers evaluation
So that I have a better feedback and have a voice in grading

Scenario : Correctness feedback
Given : I put “MA”, “MPA” or “MANA” on each grade
When : I Submit
Then: I see a message that shows me the process completed 

Scenario :  Correct Store the Grades
Given :  I put “MA”, “MPA” or “MANA” on each grade
When : I submit
Then : The system stores the values

Scenario : Error feedback
Given : I put “MA” on all grades and left one ungraded 
When: I submit
Then: An error message appear

Scenario: Don’t Store invalid grades
Given: I put numbers on my grade instead of “MA”, “MANA” or “MPA”
When: I submit
Then: The system don’t store the grades
Then: The grade's do not show up in the search result
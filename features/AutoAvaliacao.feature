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

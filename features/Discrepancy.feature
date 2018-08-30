Feature : Self Evaluation
As a Professor
I want to see if any student graded himself higher than me in at least 25% on the grade
So that I can recheck the grades I gave and see if i got something wrong

Scenario : One discrepancy on students grades
Given: All students graded themselves 
AND “Mario” graded itself higher than the professor in only one goal
AND “Claudio” graded itself equal in all goals
AND “Gui” graded higher in at least 25% of the goals
When: I check if there is any discrepancy
Then: The page shows 1 discrepancy, 33% of rate and “Gui” shows up on a list of students

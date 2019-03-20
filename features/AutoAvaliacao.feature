Feature :Self Evaluate
As a: Student
I want to: Add grades as good as I think I was at the end of the semester.
So that: I can compare to the grades that my teacher gave me whenever I want, without the possibility to edit it, and check my discrepancy state.

Scenario: adding self evaluation grades.
Given: I am at the “evaluate Incomplete” page.
And: The teacher have already “evaluated before”.
When: I “add grade” to every single goal
Then: I am at the “evaluate Complete” page
And: I can’t evaluate again, but can compare the grades.

Scenario: adding self evaluation grades.
Given: I am at the “evaluate Incomplete” page.
And: The teacher have already “evaluated before”.
When: I “add grade” to some goals
Then: I am at the “evaluate Incomplete” page
And: It asks me to fill the blanks, so that can save the progress, else, all the progress will be worthless.
And: The stakeholder asked this step

Scenario: Check “student discrepancy state”.
Given: I am at the “Students list of a class” page.
And: I have already evaluated the students.
And: The students have already self-evaluated.
And: I want to check Josué discrepancy state.
And: Josué have ⅕ of evaluation higher than the teacher (of 5 metas)
When: I check the last column of the list in Josué Line
Then: I am able to check “the discrepancy state” of Josué, and it says that he is not in this state in blue colored letter.[1 de 5 metas]

Scenario: Check “students discrepancy state”.
Given: I am at the “Students list of a class” page which have only 3 students.
And: I have already evaluated the students.
And: The students have already self-evaluated.
And: 1 of the students is in discrepancy state.
When: I check the last column of the list and the last line.
Then: I am able to check “the discrepancy state” of the students, which one of them is colored in red in the last column.
And: I am able to see the percentage of discrepancy students (33%), the quantity of them (1) and the total of students in class (3)
And: The stakeholder asked for this change, in order to do the next exercice

Commit 1
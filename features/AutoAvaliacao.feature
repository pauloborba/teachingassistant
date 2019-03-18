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
And: the client asked this step

Scenario: adding self evaluation grades.
Given: I am at the “evaluate Incomplete” page.
Batatos
And: The teacher have already “evaluated before”.
When: I “add grade” to every single goal
Then: I am at the “evaluate Complete” page
And: I can’t evaluate again, but can compare the grades.

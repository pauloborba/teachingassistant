Feature: Auto evaluation
As a: Student
I want to: Add a auto evaluation
So that: I can show the professor the difference between what i think i’ve understood and what he understands i’ve learnt, making an evaluation of teaching methods by comparison of evaluation’s types

Scenario: successful auto evaluation
Given: I’m logged as a “student”
And: I’m at “Auto Evaluation” page
And: I see my “requirements” grade
When: I try to give “MPA” at “requirements” goal
Then: I receive a success message
And: I’m at the “Grades” page
And: I see the average discrepancy of auto evaluation vs evaluation

Scenario: successful auto evaluation
Given: I’m logged as a “student”
And: The auto evaluation is blank
And: My grades are “MPA, MPA, MANA”
When: I send to the system the auto eval “MPA, MA, MPA”
Then: The auto evaluation contains “MPA, MA, MPA”
And: My grades are “MPA, MPA, MANA”

Scenario: unsuccessful auto evaluation
Given: I’m logged as a “student”
And: I’m at “Auto Evaluation” page
And: I see my “MPA, MA, MANA” grades
And: My auto evaluation grades are blank
When: I try to give “MPA, MA, -” in auto evaluation
Then: I receive a failure message saying “Not all grades are filled!”
And: I see my “MPA, MA, MANA” grades
And: My auto evaluation grades are blank

Scenario: unsuccessful auto evaluation
Given: I’m logged as a “student”
And: The auto evaluation is blank
And: My grades are “MPA, MPA, MANA”
When: I send to the system the auto eval “MPA, MA, -”
Then: I receive a failure signal with a code.
And: The auto evaluation is blank
And: My grades are “MPA, MPA, MANA”

Scenario: no discrepancies in auto evaluation comparisons of the class
Given: I’m logged as a “teacher”
And: I’m at “Grades” page
And: I see a list of all class students grades
When: I try to filter by discrepant auto evaluations
Then: I receive a failure message saying “No discrepancies”
And: I see a list of all class students grades

Scenario: discrepancies in auto evaluation comparisons of the class
Given: I’m logged as a “teacher”
And: I’m at “Grades” page
And: I see a list of all class students grades
When: I try to filter by discrepant auto evaluations
Then: I see a smaller list of class students
And: I see for each student the discrepant auto evaluations along with the given evaluations

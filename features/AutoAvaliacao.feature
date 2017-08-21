Feature: Self-Evaluation of Students
As a student
I want to be able to self assess my scores
So that I might accustom myself to judge my efforts


Scenario: Self-evaluation of students (Successfully)

Given: I�m at the self-evaluation section of the Dashboard logged as X with the password PASSWD
When: I put my evaluations A, B, C, D, etc� on the rows and columns of their respectives goals
And: I save the self-evaluation
Then: I can see the evaluation of the professor alongside my own evaluations


Controller Scenario: Self-evaluation of students (Successfully)

Given: The student is authenticated as X with password PASSWD
When: The student X filled in all of his self assessments
And: Requested saving the assessments onto the database
Then: The student X self evaluation is correctly stored on the system database


Scenario: Self-evaluation of students (Unsuccessfully)

Given: I�m at the self-evaluation section of the Dashboard logged as X with the password PASSWD
When: I put my evaluations B, C, D, etc� on the rows and columns of their respectives goals
And: I try to save the self-evaluation
Then: I receive an error message displaying that all concepts must be evaluated


Controller Scenario: Self-evaluation of students (Unsuccessfully)

Given: The student is authenticated as X with password PASSWD
When: The student X filled in all but one or more of his self assessments
And: Requested saving the assessments onto the database
Then: The student X self evaluation is not stored on the system database
And: An error message is displayed


Scenario: No discrepancies between self evaluations and professor’s evaluation
Given: Student X self evaluation on goal 1 is MA, MPA, MPA while the professor’s evaluation of student X on goal 1 are MPA, MPA, MPA
And: Student Y self evaluations are MANA, MPA, MANA while the professor’s evaluations on goal 1 are MPA, MA, MA
And: Student Z self evaluations are MPA, MA, MA on goal 1 while the professor’s evaluations on goal 1 are MPA, MA and MA
When: Professor access compare evaluations page
Then: No discrepancies are shown 

Scenario: Discrepancies between self evaluations and professor’s evaluation
Given: Student X self evaluation on goal 1 is MA, MPA, MPA and on goal while the professor’s evaluation of student X on goal 1 are MPA, MPA, MPA
And: Student X self evaluations on goal 2 are MA, MA and MA while the professor’s evaluation of student X on goal 2 are MPA, MPA and MANA
And: Student Y self evaluations are MANA, MPA, MANA while the professor’s evaluations on goal 1 are MPA, MA, MA
And: Student Y self evaluations of goal 2 are MANA, MPA, MANA while the professor’s evaluations of student Y on goal 2 are MPA, MA, MA
And: Student Z self evaluations are MPA, MA, MA on goal 1 while the professor’s evaluations on goal 1 are MPA, MA and MA
And: Student Z self evaluations are MPA, MA, MA on goal 2 while the professor’s evaluations on goal 1 are MPA, MA and MA
When: Professor access compare evaluations page
Then: Student X’s name is shown on discrepancy list
And: The graph shows 33% discrepancy
And: The counter shows 1/3 


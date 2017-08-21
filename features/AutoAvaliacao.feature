Feature: Self-Evaluation of Students
As a student
I want to be able to self assess my scores
So that I might accustom myself to judge my efforts


Scenario: Self-evaluation of students (Successfully)

Given: I’m at the self-evaluation section of the Dashboard logged as X with the password PASSWD
When: I put my evaluations A, B, C, D, etc… on the rows and columns of their respectives goals
And: I save the self-evaluation
Then: I can see the evaluation of the professor alongside my own evaluations


Controller Scenario: Self-evaluation of students (Successfully)

Given: The student is authenticated as X with password PASSWD
When: The student X filled in all of his self assessments
And: Requested saving the assessments onto the database
Then: The student X self evaluation is correctly stored on the system database


Scenario: Self-evaluation of students (Unsuccessfully)

Given: I’m at the self-evaluation section of the Dashboard logged as X with the password PASSWD
When: I put my evaluations B, C, D, etc… on the rows and columns of their respectives goals
And: I try to save the self-evaluation
Then: I receive an error message displaying that all concepts must be evaluated


Controller Scenario: Self-evaluation of students (Unsuccessfully)

Given: The student is authenticated as X with password PASSWD
When: The student X filled in all but one or more of his self assessments
And: Requested saving the assessments onto the database
Then: The student X self evaluation is not stored on the system database
And: An error message is displayed

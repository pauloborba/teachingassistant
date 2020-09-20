Feature: Student self-evaluation
As a Teacher of a specific course
I want to allow students to self-evaluate on all learning goals said course possesses
So that relevant feedback regarding overall student growth, teaching methods and their effectiveness can be gathered.

Scenario: Performing a successful self-evaluation process as a student
Given that I am at the “Student” page
And I see no grades for any learning goals on the “Self-evaluation” section
When I select “Perform self-evaluation”
And input “MA, MANA and MPA” according to my perceived performance in each goal
And confirm the conclusion the evaluation
Then I see a message signaling I was successful
And I’m still at the “Student” page
And I can see the grades “MA, MANA and MPA” I input before displayed on the “Self-evaluation” section.

Scenario: Performing a successful self-evaluation process as a student
Given that the system has no grades stored on the self-evaluation section of my profile
When I input “MA, MANA and MPA” in the learning goals available and confirm
Then the system stores those grades accordingly in it’s database under the self-evaluation section
And now the system has “MA, MANA and MPA” in the respective learning goals stored on the self-evaluation section of my profile.

Scenario: Performing an unsuccessful self-evaluation process as a student
Given that I am at the “Student” page
And I see no grades for any goals on the “Self-evaluation” section
When I select “Perform self-evaluation”
And input “MA, MPA” according to my perceived performance in each learning goal, while leaving one or more learning goals in blank
And confirm the conclusion the evaluation
Then I see a message that states that I did not succeed
And I’m still at the “Student” page
And I see no grades for any goals on the “Self-evaluation” section.

Scenario: Performing an unsuccessful self-evaluation process as a student
Given that the system has no grades stored on the self-evaluation section of my profile
When I select “MA, MANA or MPA” in some learning goals, while leaving one or more of them in blank and confirm
Then the system does not store any grades whatsoever
And now the system has no grades stored on the self-evaluation section of my profile

Scenario: No discrepancies between self-evaluation and teacher evaluation
Given That I am logged as a teacher with username “teacher_1” and password “123” in the system
And I am at the “Class_1” page
When I select the “Avaliações discrepantes” option
Then I see a message stating that there are no self-evaluation discrepancies.

Scenario: Discrepancies found between self-evaluation and teacher evaluation
Given That I am logged as a teacher with username “teacher_1” and password “123” in the system
And I am at the “Class_1” page
When I select the “Avaliações discrepantes” option
Then the “Avaliações discrepantes” page opens up
And I see “Total = 1”, “Percentage of class = 33%”, and a list with the name “João Silva”. 

Feature: auto-avaliação
As a student from the class
I want to fill my goals with my self-evaluated grades
So that I can compare my grades with the results of teacher evaluation method

Feature: auto-avaliação
As a teacher from class
I want to see how many and whom students have discrepant grades
So that I can re-evaluate my method or judgement

Scenario: Unsuccessfully adding new grades (GUI)
Given: I am at the “Grades” page logged as “Vitor Sousa” at “SI” class
And I see my name with no self-evaluated grade for all goals
When I fulfill “IA” with “MA”, and “Machine Learning” with “MPA” but I do not fill “Neural Networks” grade
Then I am at “Grades” page with a error "warning: one or more missing self-evaluated grades"
And I can see my name with no self-evaluated grades for all goals

Scenario: Unsuccessfully adding new grades
Given: Student “Ricardo” are registered on “SI” class
And “Ricardo” has no grades fulfilled
When “Ricardo” fills “IA” grade with “MA”, after that he fills “Machine Learning” with “MA”
And “Ricardo” “Neural Networks” grade is empty
And “Ricardo” tries to submit his grades to the system
Then No one “Ricardo” grades are filled
And “Ricardo” grades “IA”, “Machine Learning”, “Neural Networks” are empty
Then “Ricardo” starts to fill “IA”, “Machine Learning”, “Neural Networks” grades again

Scenario: Observando notas da minha turma sem discrepância
Given: I am at the “Grades” page as “Vitor Sousa” in “IP” monitoring
And I see a list of student
Then I select “Paulo”
And I see “Paulo” has fill “MA” he received “MANA” in “OOP”
And I see “Paulo” has fill “MA” he received “MA” in “Arrays”
And I see “Paulo” has fill “MPA” he received “MPA” in “Strings”
And I see “Paulo” has fill “MA” he received “MPA” in “Primitive Types”
And I see “Paulo” has fill “MA” he received “MPA” in “Abstract Types”
When I filter for “Paulo” discrepant student grades
And I confirm “Paulo” has a discrepant grades on “OOP”
Then I can confirm “Paulo” has no others discrepant grades

Scenario: Observando notas da minha turma com discrepância
Given: I am the “Grades” page as “Vitor Sousa” in “IP” monitoring
And I see the quantity and percentage of discrepant grades
And I see “Paulo” has fill “MA” he received “MANA” in “OOP”
And I see “Henrique” has fill “MPA” he received “MPA” in “OOP”
And I see “Borba” has fill “MA” he received “MA” in “OOP”
When I filter for discrepant students
And I can see “Paulo” has a discrepant grade
Then I can see “Henrique” and “Borba” have not discrepant grades
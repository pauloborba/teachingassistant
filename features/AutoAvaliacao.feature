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

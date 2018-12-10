Feature: As a professor
         I want to register students
         So that I can manage their learning goals

Scenario: Registering student with non registered CPF
Given I am at the students page
Given I cannot see a student with CPF "683" in the students list
When I try to register the student "Paulo" with CPF "683"
Then I can see "Paulo" with CPF "683" in the students list

Feature: As a Teacher
		 I Want that the system automatically calculates each student average grade
		 So that I don’t have to do repetitive and extra work to calculate on a separate platform

Scenario: Student with missing grades
Given I’m at the grading page
And there’s a registered student called ”Arthur”
When I fill all of Arthur’s grades, except one
Then I can see “...” in Arthur’s average grade column with a title “Aluno sem nota definida”

Scenario: Student with all grades filled properly and passing
Given I’m at the grading page
And there’s a registered student called ”Arthur”
When I fill all of Arthur’s grades with valid grades, all "MA"s
Then I can see "10" in Arthur’s average grade column

Scenario: Student with one grade wrong 
Given I’m at the grading page
And there’s a registered student called ”Arthur”
When I fill all of Arthur’s grades with grades, all "MPA"s and one "MAA"
Then I can see “...” in Arthur’s average grade column with a title “Nota não reconhecida”

Scenario: Student with all grades filled properly and failing
Given I’m at the grading page
And there’s a registered student called ”Arthur”
When I fill all of a Arthur’s grades with valid grades, all "MANA"s
Then I can see "0", painted red, in Arthur’s average grade column
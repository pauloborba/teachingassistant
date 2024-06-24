Feature: As a professor
         I want to register students
         So that I can manage their learning goals

Scenario: Registering student with non registered CPF
Given I am at the students page
And I cannot see a student with CPF "683" in the students list
When I try to register the student "Maria" with CPF "683"
Then I can see "Maria" with CPF "683" in the students list

Scenario: Registering student with registered CPF
Given I am at the students page
Given I can see a student with CPF "683" in the students list
When I try to register the student "Pedro" with CPF "683"
Then I cannot see "Pedro" with CPF "683" in the students list
And I can see an error message

Scenario: Deleting student with registered CPF
Given I am at the students page
Given I can see the student "Maria" with CPF "683" in the students list
When I try to delete the student "Maria" with CPF "683"
Then I cannot see "Maria" with CPF "683" in the students list
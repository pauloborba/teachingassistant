Feature: As a professor
         I want to register students
         So that I can manage their learning goals

Scenario: Registering student with non registered CPF
Given I am at the students page
Given I cannot see a student with CPF "683" in the students list
When I try to register the student "Mari" with CPF "683"
Then I can see "Mari" with CPF "683" in the students list

Scenario: Registering student with registered CPF
Given I am at the students page
Given I can see a student with CPF "684" in the students list
When I try to register the student "Pedro" with CPF "684"
Then I cannot see "Pedro" with CPF "684" in the students list
And I can see an error message

Scenario: Registering student with non registered CPF, service
Given the system has no student with CPF "685" 
When I register the student "Paulo" with CPF "685"
Then the system now stores "Paulo" with CPF "685"

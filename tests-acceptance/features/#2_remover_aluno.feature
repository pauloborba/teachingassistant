Feature: As a professor
         I want to remove students
         So that I can manage my registered students

Scenario: Removing student with registered CPF from the GUI
Given I am at the "alunos" page
And I can see a student with CPF "1" in the students list
When I try to remove the student "Mario" with CPF "1"
Then I cannot see "Mario" with CPF "1" in the students list


Scenario: Removing student with registered CPF from the server
Given The student with CPF "2" is in the students list
When I try to remove the student with CPF "2" from the students list
Then The system erases the student with CPF "2" from the students list

Scenario: Removing student with unregistered CPF form the server
Given The student with CPF "0" is not in the students list
When I try to remove the student with CPF "0" from the students list
Then The system does not add the student with CPF "0" to the students list
Feature: As a professor
        I want to remove registered students
        So than I can manage the students list
    
Scenario: Removing registered student with unique name
Given I am at the students page
Given I have a student "Cid" with CPF "135" in the students list
When I try to remove the student "Cid" with CPF "135"
Then I cannot see "Cid" with CPF "135" in the students list

Scenario: Removing registered student with duplicate name
Given I am at the students page
Given I have a student "Dudu" with CPF "137" in the students list
Given I have a student "Dudu" with CPF "138" in the students list
When I try to remove the student "Dudu" with CPF "138"
Then I cannot see "Dudu" with CPF "138" in the students list
And I can see "Dudu" with CPF "137" in the students list
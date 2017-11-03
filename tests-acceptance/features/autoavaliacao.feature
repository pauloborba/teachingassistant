Feature: As a student
         I want to evaluate myself
         So that the professor can manage my learning goals

Scenario: Self evaluation of concepts
Given I am at the metas page
Given I can see the student "Paulo" with CPF "683" in the students list without concepts
When I try to register meta "MA" to student "Paulo" with CPF "683" in the "Requisitos" field
And I try to register meta "MA" to student "Paulo" with CPF "683" in the "Gerência de Configuração" field
And I reload the page
Then I can see the student "Paulo" with CPF "683" with meta "MA" in "Requisitos"
And I can see the student "Paulo" with CPF "683" with meta "MA" in "Gerência de Configuração".

Scenario: Invalid self evaluation of concepts
Given I am at the metas page
Given I can see the student "Paulo" with CPF "683" in the students list without concepts
When I try to register meta "MPA" to student "Paulo" with CPF "683" in the "Requisitos" field
And I reload the page
Then I can see the student "Paulo" with CPF "683" still without metas.
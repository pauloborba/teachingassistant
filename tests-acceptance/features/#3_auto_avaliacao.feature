Feature: As a student 
         I want to grade myself
         So that I can let the professor know how much I think I deserved

Scenario: Successful auto-evaluation from the GUI
Given I am at the "metas" page
When I grade the student with CPF "3" with "MA" at "Requisitos" and "MANA" at "Gerência de Configuração"
And Reload the "metas" page
Then I can still see "MA" at "Requisitos" and "MANA" at "Gerência de Configuração" of the student with CPF "3"
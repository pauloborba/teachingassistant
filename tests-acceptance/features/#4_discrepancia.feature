Feature: As a professor 
         I want to be notified when my student's grade is discrepant
         So that I can investigate what went wrong

Scenario: Discrepant evaluation from the GUI
Given I am at the "metas" page
When I grade my student with CPF "3" with "MA" at "RequisitosProf" and "MANA" at "Gerência de ConfiguraçãoProf"
Then I can see an alert, telling the grades are discrepant
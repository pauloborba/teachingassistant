Feature: auto-avaliação
As a student
I want to grade my effort
so that I can report to my professor how much I think I deserve 

Scenario: Auto evaluation
   GIVEN I am at the “Notas Metas” page
   AND I am logged in as “Matheus Borba”
   WHEN I grade myself with “MANA”, “MPA” and “MA”, respectively 
   AND confirm my choices
   THEN I can see “MANA”, “MPA” and “MA” as my grades on the “notas metas” page

Scenario: Auto evaluation 
   GIVEN the auto evaluation grades were still not informed to the system   
   AND the student is logged in as “Matheus Borba”
   WHEN the student submit “MANA”, “MPA” and “MA” as his grades, respectively
   THEN the system will have stored “MANA”, “MPA” and “MA” as the auto evaluation grades of “matheus borba”

Scenario: Auto evaluation with missing grades
   GIVEN I am at the “Notas Metas” page
   AND I am logged in as “Matheus Borba”
   WHEN I grade myself with “”, “MPA” and “”, respectively 
   AND confirm my choices
   THEN I can an error message, explaining all grades should be submitted at once 

Scenario: Auto evaluation with missing grades
   GIVEN the auto evaluation grades were still not informed to the system   
   AND the student is logged in as “Matheus Borba”
   WHEN the student submit “MANA”, “” and “MA” as his grades, respectively
   THEN the system will not store “MANA”, “” and “MA” as his grades

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
    AND additional step requested by the stakeholders

Scenario: Student Grade List with no conflict 
   GIVEN I am at the “Lista de Alunos” page
   AND There are three students, 
“Jorge Silva”, “Matheus Fonseca” and “Pedro Fernandes”, with grades, respectively, set as “MPA / MANA, MA / MPA, MA / MPA, MPA / MPA, MANA / MANA”,
“MPA / MA, MPA / MA, MPA / MA, MPA / MA, MPA / MA” and
“MA / MA, MA / MA, MA / MA, MA / MA, MA / MA”   
   AND I am logged in as “Professor Thiago Jorge”
   WHEN I access the “Lista de Alunos Discrepantes” page
   THEN I can see an list with the student “Jorge Silva”
   AND I can see his grades “MPA / MANA, MA / MPA, MA / MPA, MPA / MPA, MANA / MANA” 
   AND I can see information about how many are on the list, “1 (25%)”
    AND alteração do bug de Discrepantes, a pedidos dos stakeholders

// Primeira alteração Discrepantes

// Segunda alteração Discrepantes
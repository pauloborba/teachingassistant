Feature: auto-avaliacao
  As a student
	I want to assign grades to my goals
	So that i can contribute to my assessment in the class

Scenario: preenchimento bem sucedido da auto-avaliação
  Given that "João" is on the page "auto-avaliação"
  When "João" fill the fields "Requisitos, Gerência de Projetos, Projeto"
        with "MA, MANA, MANA"
  Then a confirmation message is displayed

Scenario: preenchimento bem sucedido da auto-avaliação
  Given that the student "João" doesn't have "self-assessment" goals
        registered in the system
  When "João" fill the fields "Requisitos, Gerência de Projetos, Projeto"
        with "MA, MANA, MANA"
  Then the "João" goals are stored correctly in the system

Scenario: preenchimento mal sucedido da auto-avaliação
  Given that "João" is on the page "auto-avaliação"
  When "João" fill the fields "Requisitos, Gerência de Projeto, Projeto"
        with "MA, MANA"
  Then a error message is displayed

Scenario: preenchimento mal sucedido da auto-avaliação
  Given that the student "João" doesn't have "self-assessment" goals
        registered in the system
  When "João" fill the fields "Requisitos, Gerência de Projeto, Projeto"
        with "MA, MANA"
  Then the "João" goals aren't stored in the system

Scenario: nenhuma auto-avaliação com discrepância
  Given that the teacher "Paulo" is on the page "Notas da turma 2019.1"
  And "João" goals are "MANA, MA, MA, MA, MA"
  And "João" self-ratings are "MA, MA, MA, MA, MA"
  And "Pedro" goals are "MA, MA, MA, MA, MA"
  And "Pedro" self-ratings are "MANA, MANA, MANA, MANA, MANA"
  And "Carol" goals are "MA, MA, MA, MA, MA"
  And "Carol" self-ratings are "MA, MA, MA, MA, MA"
  When "Paulo" asks for "Discrepância"
  Then the "Discrepância" column contains "Ok, Ok, Ok"

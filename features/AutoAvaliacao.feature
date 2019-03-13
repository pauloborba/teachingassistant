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

Feature: Auto-Avaliação
As a student 
I want to be able to do my self-evaluation
So that i can later question my grades to the teacher

Scenario: New Self Evaluation
	Given the system has the goals "Entender conceitos de requisitos” and “Especificar requisitos com qualidade”
	And there is no self evaluation from the student “Joaozinho”
	When “Joaozinho” tries to submit his self evaluation of the goals “Entender conceitos de requisitos” and “Especificar requisitos com qualidade” with “MPA” and “MANA”
	Then the system stores the self evaluation from the student “Joaozinho”
	
Scenario: New Self Evaluation Web
	Given I am in the “auto-avaliação” page
	And I do not see a self evaluation from the student “Joaozinho”
	When I submit the self evaluation as the student “Joaozinho” for the goals “Entender conceitos de requisitos” and “Especificar requisitos com qualidade” with “MPA” and “MANA”
	Then I see a confirmation message 
	And I see the self evaluation from the student “Joaozinho"

Scenario: Error in Self Evaluation 
	Given the system has the goals “Entender conceitos de requisitos” and “Especificar requisitos com qualidade” 
	And there is no self evaluation for the student “Joaozinho”
	When “Joaozinho” tries to submit his self evaluation with “MPA” for the goal “Entender conceitos de requisitos”
	And "Joaozinho" does not fill the grade for the goal “Especificar requisitos com qualidade”
	Then the system does not store the self evaluation from the student “Joaozinho”
	
Scenario: Error in Self Evaluation Web
	Given I am in the “auto-avaliação” page
	And I do not see a self evaluation from the student “Joaozinho”
	When I submit the self evaluation as the student “Joaozinho” for the goals “Entender conceitos de requisitos” and “Especificar requisitos com qualidade” with “MPA” and “”
	Then I see an error message 
	And I do not see the self evaluation from the student “Joaozinho"
	
Scenario: No Discrepancies Web
	Given I am at the “Auto-avaliação” page
	And I see the names of the students “Huguinho”, “Zezinho” and “Luisinho” on the student list
	And “Huguinho” received “MPA”, “MA”, “MPA”, “MANA” and “MA” on the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” on the teacher evaluation
	And “Huguinho” in his self evaluation gave the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” for the grades “MPA”, “MPA”, “MANA”, “MA” and “MPA”
	And “Zezinho” received “MA”, “MA”, “MA”, “MPA” e “MA” on the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” on the teacher evaluation
	And “Zezinho” in his self evaluation gave the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” for the grades “MPA”, “MPA”, “MANA”, “MPA” and “MPA”
	And “Luisinho” received “MPA”, “MA”, “MANA”, “MPA” e “MANA” on the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” on the teacher evaluation
	And “Luisinho” in his self evaluation gave the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” for the grades  “MPA”, “MA”, “MANA”, “MPA” and “MANA”
	When I request the discrepancies on the self-evaluation system
	Then I see a confirmation message on the screen
	And I do not see any names on the list of discrepancies 

Scenario: Discrepancies Web
	Given I am at the “Auto-avaliação” page
	And I see the names of the students “Huguinho”, “Zezinho” and “Luisinho” on the student list
	And “Huguinho” received MANA, “MPA”, “MPA”, “MANA” and “MA” on the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” on the teacher evaluation
	And “Huguinho” in his self evaluation gave the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” for the grades “MA”, “MA”, “MPA”, “MPA” and “MPA”
	And “Zezinho” received “MA”, “MA”, “MA”, “MPA” e “MA” on the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” on the teacher evaluation
	And “Zezinho” in his self evaluation gave the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” for the grades “MPA”, “MPA”, “MANA”, “MPA” and “MPA”
	And “Luisinho” received “MPA”, “MA”, “MANA”, “MPA” e “MANA” on the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” on the teacher evaluation
	And “Luisinho” in his self evaluation gave the goals “Requisitos”, “Configuração”, “Projetos”, “Refatoração” and “Testes” for the grades  “MPA”, “MA”, “MANA”, “MPA” and “MANA”
	When I request the discrepancies on the self-evaluation system
	Then I see a discrepancy message on the screen
	And I see the name of the student "Huguinho" on the list

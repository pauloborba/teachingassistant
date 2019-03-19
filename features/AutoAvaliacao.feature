Feature: auto-avaliação
Como um aluno
Eu quero ser capaz de atribuir minhas avaliações a cada meta e
comparar com as notas dadas pelo professor muito louco
Para que eu possa discutir com ele e reavaliar meu desempenho nas metas.

Scenario (serviço): Filling self evaluation correctly
Given: I am want to evaluate my goals
When: I fill my goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” with “MA”, “MPA”, “MANA” respectively
Then: the grades “MA”, “MPA”, “MANA”, are properly stored in the goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de 	gerência de configuração” respectively.

Scenario (GUI) Filling self evalutation correctly
Given: I am at the “self evaluation” page
And: i see the the grades for the goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” are “empty”, “empty, “empty”
And: the teacher evaluation for the goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” are “MANA” “MANA” “MANA”
When: I fill my goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” with “MA”, “MPA”, “MANA” respectively
Then: I can see both my evaluations and my teacher’s correctly placed in each goal.

Scenario (serviço): Trying self evaluation with missing grades for at least on goal
Given: I am want to evaluate my goals
When: I fill my goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” with “MA”, “MPA”, “” respectively
Then: the system does not store the grades due to missing concept for 
“Entender conceitos de gerência de configuração”

Scenario (GUI) Trying self evaluation with missing grades for at least on goal

Given: I am at the “self evaluation” page
And: i see the the grades for the goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” are “”, “”, “”
And: the teacher evaluation for the goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” are “MANA” “MANA” “MANA”
When: I fill my goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” with “MA”, “MPA”, “-” respectively
Then: I can see an error message

Scenario: Confirming grades with no discrepancy 
Given: I am logged as “Professor” at the “self evalution” page
And: I see a list of the students of my “ESS” class
And: I can see student “João” evaluated himself each of the goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Esboçar páginas relacionadas ao projeto”, “Realizar atividades em sala” with, “MA”, “MPA” “MANA”, “MPA”, “MA”
And: I can see student “Maria” evaluated herself each of the goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Esboçar páginas relacionadas ao projeto”, “Realizar atividades em sala” with, “MANA”, “MPA” “MANA”, “MPA”, “MANA”
And: I can see student “Ricardo” evaluated herself each of the goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Esboçar páginas relacionadas ao projeto”, “Realizar atividades em sala” with, “MANA”, “MANA” “MANA”, “MANA”, “MANA”
But: My grades for “João” in each of the goals“Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Esboçar páginas relacionadas ao projeto”, “Realizar atividades em sala” are “MPA”, “MPA” “MANA”, “MPA”, “MA”
But: And: My grades for “Maria” in each of the goals“Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Esboçar páginas relacionadas ao projeto”, “Realizar atividades em sala” are “MA”, “MA” “MA”, “MA”, “MA”
And: My grades for “Ricardo” in each of the goals“Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Esboçar páginas relacionadas ao projeto”, “Realizar atividades em sala” are “MANA”, “MANA” “MANA”, “MANA”, “MANA”
And: there are no other students on the list
When: I select the “Confirm grades” option
Then: I can see an error message

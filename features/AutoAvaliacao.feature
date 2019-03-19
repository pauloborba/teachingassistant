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
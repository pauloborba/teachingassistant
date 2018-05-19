Feature: As a professor
         I want to register students
         So that I can manage their learning goals

Scenario: Registering student with non registered CPF
Given I am at the students page
Given I cannot see a student with CPF "683" in the students list
When I try to register the student "Paulo" with CPF "683"
Then I can see "Paulo" with CPF "683" in the students list

Scenario: Preencher avaliacao do aluno "Paulo" GUI
Given estou na página de autoavaliacao
And consigo ver o nome "Paulo" na lista de nomes
And a meta “Entender conceitos de requisitos” esta com valor “” 
And a meta “Especificar requisitos com qualidade” esta com valor “” 
And a meta “Entender conceitos de gerência de configuração” esta com valor “” 
When mudo o valor do conceito “Entender conceitos de requisitos” para “MA” 
And mudo o valor do conceito “Especificar requisitos com qualidade” esta com valor” para “MA” 
And mudo o valor do conceito “Entender conceitos de gerência de configuração” para “MA”
And salvo as mudancas realizadas
Then eu recebo uma mensagem de confirmação

Scenario: Ver avaliações discrepantes com discrepância em 1 de 3 alunos GUI
Given estou na página do professor 
When vou para a pagina de auto avaliações discrepantes
Then consigo ver que a “quantidade de alunos” tem valor “1(33% do total de alunos)”
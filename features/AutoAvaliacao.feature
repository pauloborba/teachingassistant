Feature: Auto-avaliação 
As a: Aluno 
I want to: Me auto-avaliar em cada uma das metas enquanto vejo a avaliação atribuída pelo professor a mim.
So that: Eu possa comparar como eu avalio que eu fui e como o professor avalia que eu fui

Scenario: Auto-avaliação bem sucedida
Given Que estou logado como aluno 
And Estou na página de auto-avaliação
And Eu vejo os conceitos “Entender conceitos de requisitos”, "Especificar requisitos com qualidade", "Entender conceitos de gerência de configuração” e “Entender conceitos de gerência de projetos”
When Eu me avalio com com  "MA", "MA" , "MANA" e "MA" 
And Concluo o preenchimento
Then Eu estou na página de auto-avaliação
And Uma mensagem de conclusão bem sucedida aparece

Scenario: Auto-avaliação bem sucedida
Given Eu tenho acesso ao sistema como “aluno” com o nome de usuário “João Bento” e senha
When Eu me avalio com com  "MA", "MA" , "MANA", "MPA" e "MA" 
And: Solicito ao sistema a conclusão da operação de auto-avaliação 
Then: O sistema verifica que todos os conceitos foram auto-avaliados 
And: O sistema salva "MA", "MA" , "MANA", "MPA" e "MA"  na auto-avaliação do aluno João Bento
And: O sistema indica que a operação foi bem sucedida

Fazendo mudança

Mais uma mudança

Scenario: Auto-avaliação sem discrepância
Given Que estou logado como professor
And Estou na página de auto-avaliação
And Eu vejo a auto-avaliação dos alunos nos conceitos “Entender conceitos de requisitos”, "Especificar requisitos com qualidade", "Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos” e "Testes"
And Eu vejo que a avaliação de Melissa da Silva indica que foi "Superior", "igual", "igual", "igual" e "igual" nas metas respectivamente
And Eu vejo que a avaliação de Glória da Cunha indica que foi "igual", "igual", "igual", "igual" e "igual" nas metas respectivamente
And Eu vejo que a avaliação de Larissa Sales indica que foi "inferior", "inferior", "inferior", "inferior" e "inferior" nas metas respectivamente
When Eu solicito a opção de visualizar as auto-avaliações discrepantes
Then Eu sou levado para a página "auto-avaliações discrepantes"
And Eu vejo a indicação de que 0 alunos possuem notas discrepantes, de que 0% dos alunos possuem notas discrepantes e uma lista de alunos vazia

Scenario: Auto-avaliação com discrepância em 1 de 3 alunos
Given Que estou logado como professor
And Estou na página de auto-avaliação
And Eu vejo a auto-avaliação dos alunos nos conceitos “Entender conceitos de requisitos”, "Especificar requisitos com qualidade", "Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos” e "Testes"
And Eu vejo que a avaliação de Melissa da Silva indica que foi "Superior", "igual", "Superior", "igual" e "igual" nas metas respectivamente
And Eu vejo que a avaliação de Glória da Cunha indica que foi "igual", "igual", "igual", "igual" e "igual" nas metas respectivamente
And Eu vejo que a avaliação de Larissa Sales indica que foi "inferior", "inferior", "inferior", "inferior" e "inferior" nas metas respectivamente
When Eu seleciono a opção de visualizar as auto-avaliações discrepantes
Then Eu sou levado para a página "auto-avaliações discrepantes"
And Eu vejo a indicação de que 1 aluno possui notas discrepantes, de que 33,33% dos alunos possuem notas discrepantes e uma lista de alunos com apenas Melissa da Silva mostrando sua auto-avaliação foi "Superior", "igual", "Superior", "igual" e "igual" nas metas respectivamente
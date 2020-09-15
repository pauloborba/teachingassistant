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
Feature: auto-avaliaçao de metas das disciplinas do Cin
As a Aluno
I want to atribuir conceito (MANA, MA ou MPA) a todas as metas de uma dada disciplina
so that dado que o professor preencheu sua avaliaçao, preencherei as minhas consequentemente e poderei fazer uma comparaçao com as notas do professor e as minhas.

Scenario: Autoavaliaçao das metas de uma dada disciplina bem sucedido
Given eu loguei com meu cpf "12312312312" e nome "Juliano"
And que estou na tela de auto-avaliaçao da disciplina "ESS"
And o professor já preencheu suas notas
When eu preencho minhas notas, em "Requisitos ", com "MA",  "Gerência de Configuraçao ", com  "MA" e em "Validaçao e Teste" com "MA"
Then finalizo minha avaliaçao 
And recebo uma mensagem de confirmaçao
And vejo minha notas "MA", "MA", "MA" em "Requisitos", "Gerência de Configuraçao" e  "Validaçao e Teste" da disciplina "ESS" na tela de auto-avaliaçao

Scenario: Autoavaliaçao das metas de uma dada disciplina  mal sucedido
Given eu loguei com meu cpf "12312312312" e nome "Juliano"
And que estou na tela de auto-avaliaçao da disciplina "ESS"
And o professor já preencheu suas notas
When eu preencho parcialmente minhas notas, em  "Requisitos ", com "MA",  "Gerência de Configuraçao ", com  "MA" e "Validaçao e Teste" com "" 
Then tento finalizar minha avaliaçao 
And recebo uma mensagem de que falta preencher uma nota
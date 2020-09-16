Feature: Auto-Avaliação
As um aluno usuário do sistema
I want to preencher todos os conceitos das metas na seção de auto-avaliação
So that eu posso ver os conceitos que eu preenchi e os preenchidos pelo professor na seção de auto-avaliação



GUI Scenario
Scenario: preenchimento de auto-avaliação bem sucedido
Given Eu estou na página  “Auto-Avaliação”
And Eu vejo os conceitos das metas  “Entender conceitos de requisitos”, “Especificar Requisitos com Qualidade” e “Entender conceitos de gerência de configuração” em branco
And Seleciono para alterar o conceito de cada uma das as metas
And Preencho os conceitos com “MA” para “Entender conceitos de requisitos”, “MPA” para Especificar Requisitos com Qualidade e “MA” para “Entender conceitos de gerência de configuração”
And Seleciono para enviar
Then Uma mensagem é exibida mostrando que o preenchimento foi concluído
And os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade” e “MA” em   “Entender conceitos de gerência de configuração” aparecem na coluna correspondente a Auto-Avaliação




Service Scenario
Scenario: Auto-avaliação bem sucedida
Given o estudante “João Santos” está com as metas “Entender conceitos de requisitos”, “Especificar Requisitos com Qualidade” e “Entender conceitos de gerência de configuração” sem conceito de Auto-Avaliação armazenados no sistema
When os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade” e “MA” em  “Entender conceitos de gerência de configuração”  na relacionados a Auto-Avaliação são enviados
Then os conceitos  “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade” e “MA” em “Entender conceitos de gerência de configuração”  relacionados a Auto-Avaliação do aluno “João Santos” são armazenados no sistema
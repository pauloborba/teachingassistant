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

Scenário: Preenchimento de Auto-avaliação mal sucedido
Given Eu estou na página  “Auto-Avaliação”
And Eu vejo os conceitos das metas  “Entender conceitos de requisitos”, “Especificar Requisitos com Qualidade” e “Entender conceitos de gerência de configuração” em branco
And Seleciono para alterar o conceito de cada uma das as metas
And Preencho os conceitos com “MA” para “Entender conceitos de requisitos” e “MPA” para Especificar Requisitos com Qualidade
And Deixo a meta  “Entender conceitos de gerência de configuração” com seu conceito de auto-avaliação em branco
And Seleciono para enviar
Then Uma mensagem é exibida alertando que todos campos devem ser preenchidos

Cenário: Nenhuma discrepância
Given estou na página de auto-avaliações 
And o aluno “João Oliveira” está com os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MA” em  “Entender conceitos de gerência de configuração”, “MPA” em “Entender conceitos de gerência de projetos” e “MPA” em “Entender conceitos de testes” preenchidos em sua Auto-Avaliação
And  o aluno “João Oliveira” está com os conceitos “MPA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MA” em  “Entender conceitos de gerência de configuração”, “MA” em “Entender conceitos de gerência de projetos” e “MPA” em “Entender conceitos de testes” preenchidos por mim
And a aluna “Ana Souza”  está com os conceitos “MPA” em “Entender conceitos de requisitos” , “MANA” em “Especificar Requisitos com Qualidade”, “MPA” em  “Entender conceitos de gerência de configuração”, “MANA” em “Entender conceitos de gerência de projetos” e “MPA” em “Entender conceitos de testes” preenchidos em sua Auto-Avaliação
And a aluna “Ana Souza” está com os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MA” em  “Entender conceitos de gerência de configuração”, “MPA” em “Entender conceitos de gerência de projetos” e “MA” em “Entender conceitos de testes” preenchidos por mim
And a aluna “Maria Almeida” está com os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MPA” em  “Entender conceitos de gerência de configuração”, “MPA” em “Entender conceitos de gerência de projetos” e “MA” em “Entender conceitos de testes” preenchidos em sua Auto-Avaliação
And a aluna “Maria Almeida” está com os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MPA” em  “Entender conceitos de gerência de configuração”, “MPA” em “Entender conceitos de gerência de projetos” e “MA” em “Entender conceitos de testes” preenchidos por mim
When seleciono mostrar auto-avaliações discrepantes
Then uma mensagem dizendo que não existe nenhuma auto-avaliação discrepante aparece

Service Scenario
Scenario: Auto-avaliação bem sucedida
Given o estudante “João Santos” está com as metas “Entender conceitos de requisitos”, “Especificar Requisitos com Qualidade” e “Entender conceitos de gerência de configuração” sem conceito de Auto-Avaliação armazenados no sistema
When os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade” e “MA” em  “Entender conceitos de gerência de configuração”  na relacionados a Auto-Avaliação são enviados
Then os conceitos  “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade” e “MA” em “Entender conceitos de gerência de configuração”  relacionados a Auto-Avaliação do aluno “João Santos” são armazenados no sistema

Scenario: Auto-avaliação mal sucedida
Given o estudante “João Santos” está com as metas “Entender conceitos de requisitos”, “Especificar Requisitos com Qualidade” e “Entender conceitos de gerência de configuração” sem conceito de Auto-Avaliação armazenados no sistema
When preenchidos os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”  na coluna de Auto-Avaliação
And a meta “Entender conceitos de gerência de configuração” está sem conceito
And os conceitos são enviados
Then uma mensagem de preenchimento mal sucedido é enviada pelo sistema


Cenário de GUI:
Scenário: Discrepância em 1 de 3 alunos
Given estou na página de auto-avaliações 
And o aluno “João Oliveira” está com os conceitos “MA” em “Entender conceitos de requisitos” , “MA” em “Especificar Requisitos com Qualidade”, “MA” em  “Entender conceitos de gerência de configuração”, “MPA” em “Entender conceitos de gerência de projetos” e “MPA” em “Entender conceitos de testes” preenchidos em sua Auto-Avaliação
And  o aluno “João Oliveira” está com os conceitos “MPA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MA” em  “Entender conceitos de gerência de configuração”, “MA” em “Entender conceitos de gerência de projetos” e “MPA” em “Entender conceitos de testes” preenchidos por mim
And a aluna “Ana Souza”  está com os conceitos “MPA” em “Entender conceitos de requisitos” , “MANA” em “Especificar Requisitos com Qualidade”, “MPA” em  “Entender conceitos de gerência de configuração”, “MANA” em “Entender conceitos de gerência de projetos” e “MPA” em “Entender conceitos de testes” preenchidos em sua Auto-Avaliação
And a aluna “Ana Souza” está com os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MA” em  “Entender conceitos de gerência de configuração”, “MPA” em “Entender conceitos de gerência de projetos” e “MA” em “Entender conceitos de testes” preenchidos por mim
And a aluna “Maria Almeida” está com os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MPA” em  “Entender conceitos de gerência de configuração”, “MPA” em “Entender conceitos de gerência de projetos” e “MA” em “Entender conceitos de testes” preenchidos em sua Auto-Avaliação
And a aluna “Maria Almeida” está com os conceitos “MA” em “Entender conceitos de requisitos” , “MPA” em “Especificar Requisitos com Qualidade”, “MPA” em  “Entender conceitos de gerência de configuração”, “MPA” em “Entender conceitos de gerência de projetos” e “MA” em “Entender conceitos de testes” preenchidos por mim
When seleciono mostrar auto-avaliações discrepantes
Then uma mensagem mostrando 1 aluno está com auto-avaliação discrepante, mostrando a porcentagem de 33% e uma lista contendo “João Oliveira”
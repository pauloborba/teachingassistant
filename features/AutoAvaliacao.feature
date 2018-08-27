Feature: Auto-Avaliação das Metas
Como um professor
Eu quero que os alunos possam se auto-avaliar para cada uma das metas e que eu possa visualizar quantos e quais alunos têm pelo menos 25% da suas auto-avaliações superiores às atribuídas pelo professor
para que eu possa identificar que alunos estão com auto-avaliações muito discrepantes

Scenario: Preenchimento de auto-avaliação bem sucedido
Given que eu ainda não auto-avaliei as metas para a turma de “ESS 2018.2” 
And o professor já as avaliou  
When eu submeto, nesta ordem, as auto-avaliações  “MA, MPA, MA, MA e MPA” para as metas.
Then as auto-avaliações são armazenadas corretamente no sistema.

Scenario: Preenchimento de auto-avaliação bem sucedido
Given eu estou na página de “auto-avaliação” para a disciplina “ESS 2018.2” 
When eu preencho, nesta ordem, “MA, MPA, MA, MA, MPA” para as auto-avaliações das metas e seleciono a opção de salvar. 
Then eu sou redirecionado para a tela de usuário e o sinal de auto-avaliação pendente não aparece.

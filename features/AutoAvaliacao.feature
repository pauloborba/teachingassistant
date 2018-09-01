Feature: Auto-Avaliação das Metas
As a um professor
I want to quero que os alunos possam se auto-avaliar para cada uma das metas e que eu possa visualizar quantos e quais alunos têm pelo menos 25% da suas auto-avaliações superiores às atribuídas pelo professor
So that i possa identificar que alunos estão com auto-avaliações muito discrepantes

Scenario: Preenchimento de auto-avaliação bem sucedido.
Given que eu ainda não auto-avaliei as metas para a turma de “ESS 2018.2” 
And o professor já as avaliou  
When eu submeto, nesta ordem, as auto-avaliações  “MA, MPA, MA, MA e MPA” para as metas.
Then as auto-avaliações são armazenadas corretamente no sistema.

Scenario: Preenchimento de auto-avaliação bem sucedido.
Given eu estou na página de “auto-avaliação” para a disciplina “ESS 2018.2” 
When eu preencho, nesta ordem, “MA, MPA, MA, MA, MPA” para as auto-avaliações das metas e seleciono a opção de salvar. 
Then eu sou redirecionado para a tela de usuário 
And o sinal de auto-avaliação pendente não aparece.

Scenario: Nenhum aluno tem discrepância.
Given eu só tenho apenas 3 alunos cadastrados: ”Carlos”, “Maria” e “João”
And “Carlos”  auto-avaliou os conceitos:  “MA, MPA, MA, MPA, MA” e eu avaliei os conceitos: “MA, MPA, MA, MPA, MPA”
And “Maria” se auto-avaliou os conceitos: “MPA, MPA, MPA, MPA, MANA” e eu avaliei os conceitos: “MA, MA, MA, MA, MPA”
And “João” se auto-avaliou os conceitos  “MPA, MPA, MPA, MA, MA” e eu avaliei os conceitos “MPA, MPA, MPA, MA, MA”
When eu seleciono a opção “Visualizar auto-avaliações discrepantes”
Then  é exibida a página de “auto-avaliações” que exibe as seguintes informações: existem 0 auto-avaliações discrepantes, 
sendo elas 0% do total de avaliações e a lista de alunos com auto-avaliações discrepantes está vazia.

Scenario: Um aluno tem discrepância.
Given eu só tenho apenas 3 alunos cadastrados: ”Carlos”, “Maria” e “João”
And “Carlos”  auto-avaliou os conceitos:  “MA, MPA, MA, MPA, MA” e eu avaliei os conceitos: “MPA, MPA, MPA, MPA, MPA”
And “Maria” se auto-avaliou os conceitos: “MPA, MPA, MPA, MPA, MANA” e eu avaliei os conceitos: “MA, MA, MA, MA, MPA”
And “João” se auto-avaliou os conceitos  “MPA, MPA, MPA, MA, MA” e eu avaliei os conceitos “MPA, MPA, MPA, MA, MA”
When eu seleciono a opção “Visualizar auto-avaliações discrepantes”
Then é exibida a página de “auto-avaliações” que exibe as seguintes informações: existem 1 auto-avaliação discrepante, sendo ela 33.33% do total de avaliações e a lista de alunos com auto-avaliações discrepantes tem apenas o nome de “Carlos”. 

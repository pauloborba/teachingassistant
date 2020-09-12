[Feature: auto-avaliação]
[Crítico] Cada aluno usuário do sistema deve ser capaz de atribuir apenas um dos conceitos (MA, MPA, MANA) que ele acha que merece em cada uma das diferentes metas estabelecidas pelo professor de uma dada disciplina.
[Desejável] Seria interessante que cada professor usuário do sistema ter a possibilidade de visualizar a quantidade, o percentual e uma lista de alunos com auto-avaliações discrepantes (com viés prejudicial ao aluno) em relação às avaliações feitas pelo professor. Uma auto-avaliação é discrepante quando em, no mínimo, 25% das metas avaliadas o aluno atribuiu um conceito a si mesmo maior que aquele atribuído pelo professor em questão (MA > MPA > MANA).

Cenário 1: aluno preenchendo auto-avaliação
[GUI]
Given: eu estou na página “Preenchimento de auto-avaliação”
And: eu estou logado como “estudante” com nome “Tales” e senha “123” 
When: eu preencho “todas” as minhas metas com “MA”
And: eu submeto o preenchimento
Then: eu ainda estou na página “Preenchimento de auto-avaliação”
And: ainda logado como “estudante” com nome “Tales”
And: consigo ver a mensagem “Submissão bem sucedida”
[Serviço]
Given: o sistema não tem os dados de preenchimento do “aluno” “Tales” armazenados
When: usuário “Tales” preenche “todas” as suas metas com “MP”
And: usuário “Tales” submete suas respostas
Then: o sistema tem os dados de preenchimento do “aluno” “Tales” armazenados


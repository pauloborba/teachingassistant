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
[GUI]
Given: eu estou na página “Preenchimento de auto-avaliação”
And: eu estou logado como “estudante” com nome “James” e senha “2020” 
When: eu preencho “algumas” das minhas metas com “MANA”
And: eu não preencho as “metas restantes”
And: eu submeto o preenchimento
Then: eu ainda estou na página “Preenchimento de auto-avaliação”
And: ainda logado como “estudante” com nome “James”
And: consigo ver a mensagem “Submissão negada: preencha todas as metas”
[Serviço]
Given: o sistema não tem os dados de preenchimento do “aluno” “Lebron” armazenados
When: usuário “Lebron” preenche “algumas” das suas metas com “MP”
And: usuário “Lebron” não preenche as “metas restantes”
And: usuário “Lebron” submete suas respostas
Then: o sistema não tem os dados de preenchimento do “aluno” “Tales” armazenados
And: passo adicional requisitado pelos stakeholders
Cenário 2: professor observando auto-avaliações não discrepantes
Given eu estou logado como “professor” com login “phmb” e senha “1968”
And eu estou na página “auto-avaliação dos alunos”
When eu seleciono a opção “Visualizar auto-avaliações discrepantes”
Then eu estou na página “auto-avaliação discrepantes”
And eu vejo “0” no campo “quantidade”
And eu vejo “0%” no campo “percentual”
And eu vejo “lista vazia” no campo “lista de alunos com auto-avaliações discrepantes”
Cenário 3: professor observando auto-avaliações discrepantes
Given eu estou logado como “professor” com login “phmb” e senha “1968”
And eu estou na página “auto-avaliação dos alunos”
And eu vejo o aluno "Joao" com auto-avaliação "MA" e avaliação do professor "MPA"
And eu vejo o aluno "Kleber" com auto-avaliação "MPA" e avaliação do professor "MPA"
And eu vejo o aluno "Silva" com auto-avaliação "MA" e avaliação do professor "MA"
When eu seleciono a opção “Visualizar auto-avaliações discrepantes”
Then eu estou na página “auto-avaliações discrepantes”
And eu vejo “1” no campo “quantidade”
And eu vejo “33.3%” no campo “percentual”
And eu vejo o “aluno” “Joao” no campo “lista de alunos com auto-avaliações discrepantes”

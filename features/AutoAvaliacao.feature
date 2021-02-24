Importação de alunos a partir de uma planilha como a de Nomes e Login


Cenário: Fazendo a autoavaliação com sucesso

Given eu estou logado como um "aluno" com o login “tiago” e a senha “1234”
And eu estou na tela de “autoavaliação”
And há uma tabela a ser preenchida com os conceitos de cada meta estabelecida pelo professor da disciplina
When eu selecionar os conceitos (“MANA, MPA OU MA”) de todas as metas
And apertar o botão de "confirmar"
Then aparecerá uma mensagem na tela sinalizando que fiz a operação com sucesso
And eu estarei na tela de “autoavaliação” porém não será possível preencher os conceitos de cada meta novamente
And a discrepância da avaliação do professor será analisada, e caso necessário, meu nome será adicionado à lista de discrepâncias

Cenário: Fazendo a autoavaliação sem selecionar algum conceito

Given que eu estou logado como um aluno com o login “tiago” e a senha “1234”
And eu estou na tela de “autoavaliação”
And há uma tabela a ser preenchida com os conceitos de cada meta estabelecida pelo professor da disciplina
When eu selecionar apenas “MA” e “MPA”, dos três conceitos a serem preenchidos, e apertar o botão de enviar
Then aparecerá uma mensagem na tela sinalizando a falha na operação
And eu estarei na tela de “autoavaliação” com a possibilidade de preencher cada meta novamente
And não houve mudanças na lista de discrepâncias de metas já avaliadas
And as avaliações já realizadas não mudaram

Cenário: Fazendo relatório de auto-avaliação sem discrepância

Given que eu sou um professor logado no sistema	
And eu selecionei a opção “avaliações discrepantes”
And eu selecionei a turma “ESS”
And houver discrepância entre mais de uma meta avaliada pelo aluno “Joaquim” comparadas com a do professor
When eu clico em gerar um relatório da turma “ESS”
Then o sistema apresentará um relatório contendo o aluno “Joaquim” na lista de avaliações discrepantes

Cenário: Fazendo relatório de auto-avaliação com discrepância

Given que eu sou um "professor" logado no sistema	
And eu selecionei a opção “avaliações discrepantes”
And eu selecionei a turma “ESS”
And houver discrepância entre mais de uma meta avaliada pelo aluno “Joaquim” comparadas com a do professor
When eu clico em gerar um relatório da turma “ESS”
Then o sistema apresentará um relatório contendo o aluno “Joaquim” na lista de avaliações discrepantes

Duas linhas
quaisquer
Scenario: Cadastrar notas da AutoAvaliação
Dado Que eu loguei como "Aluno" com o login "jpgj" e a senha "1234"
E Eu estou na página "Notas"
Quando eu seleciono "Editar AutoAvaliação"
E preencho a nota para a meta "Requerimento" com "MPA"
E preencho a nota para a meta "Gerência de configuração" com "MA"
E Confirmo a alteração
Então eu vejo uma mensagem de sucesso do procedimento
E sou reencaminhado para a página de "notas"
E vejo na parte autoavaliação minha nota "MPA" para "requerimentos"
E vejo na parte autoavaliação minha nota "MA" para "Gerência de configuração"

Scenario:Cadastrar notas de Requerimentos fora da data
Dado Que eu loguei como "Aluno" com o login "jpgj" e a senha "1234"
E Eu estou na página "Notas"
Quando eu seleciono "Editar AutoAvaliação"
E preencho a nota para a meta "Requerimento" com "MPA" que já foi dada como terminada
E preencho a nota para a meta "Gerência de configuração" com "MA" que não foi dada como terminada
E Confirmo a alteração
Então eu vejo uma mensagem de erro no procedimento
E sou reencaminhado para a página de "notas"
E a tabela de autoavaliação não foi atualizada



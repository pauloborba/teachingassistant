Scenario: Cadastrar notas da AutoAvaliação
Dado Que eu loguei como "Aluno" com o login "jpgj" e a senha "1234"
Oi :)
E Eu estou na página "Notas"
Quando eu seleciono "Editar AutoAvaliação"
E preencho a nota para a meta "Requerimento" com "MPA"
E preencho a nota para a meta "Gerência de configuração" com "MA"
E Confirmo a alteração
Então eu vejo uma mensagem de sucesso do procedimento
E sou reencaminhado para a página de "notas"
E vejo na parte autoavaliação minha nota "MPA" para "requerimentos"
E vejo na parte autoavaliação minha nota "MA" para "Gerência de configuração" 

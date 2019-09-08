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
E preencho a nota para a meta "Gerência de configuração" com "MA"que não foi dada como terminada
E Confirmo a alteração
Então vejo uma mensagem de erro no procedimento
E sou reecaminhado para a página de "notas"
E o sistema não é atualizado

Scenario: Não há discrepância

Dado que loguei como "Professor" como o login "Psgd" e a senha "1234"
E O estudante "João Pedro Jordão" se autoavaliou com "MPA, MPA, MPA"
E as notas atribuídas pelo "Professor" oi "MPA, MPA, MPA"
E estou na página de "notas"
Quando peço ao sistema para checar se há discrepância
Então eu estou na página de "notas"
E o sistema relata que não há discrepâncias

Scenario: Não há discrepância

Dado que loguei como "Professor" como o login "Psgd" e a senha "1234"
E O estudante "João Pedro Jordão" se autoavaliou com "MPA, MA, MPA"
E as notas atribuídas pelo "Professor" oi "MPA, MPA, MPA"
E estou na página de "notas"
Quando peço ao sistema para checar se há discrepância
Então eu estou na página de "notas"
E o sistema relata que há discrepâncias
#Teste1

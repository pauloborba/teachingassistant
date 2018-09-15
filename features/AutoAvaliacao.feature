R1: Conversar com o professor.
	R2: Pedir reteste.
	R3: Solicitar revisão das provas, questionários, formulários…
		R4: Solicitar arredondamento.
		R5: Avaliar método de cálculo.

Feature autoavaliação
    Cenário nova auto-avaliação
        Dado que está preenchida “MA” na “primeira unidade” da autoavaliação do aluno “Gustavo César”
        E está preenchida “MPA” na “segunda unidade” da autoavaliação do aluno “Gustavo César”
    E está preenchida “MA” na “terceira unidade” da autoavaliação do aluno “Gustavo César”
        Quando o aluno “Gustavo César” solicita o cadastro de uma nova autoavaliação
        Então “Gustavo César” recebe uma mensagem de confirmação “notas cadastradas com sucesso”
    E a autoavaliação de “Gustavo César” deve ser cadastrada com sucesso

    Cenário Preenchimento bem sucedido da auto-avaliação
    Dado que estou na página “meu perfil” da cadeira “Algoritmos”
        E preenchi “MA” na “primeira unidade” da autoavaliação
        E preenchi “MPA” na “segunda unidade” da autoavaliação
    E preenchi “MA” na “terceira unidade” da autoavaliação
        Quando solicito cadastro das notas da autoavaliação
        Então posso ver uma mensagem de confirmação “notas cadastradas com sucesso”
        E vejo minhas notas da autoavaliação no sistema como “aprovado”

Cenário Preenchimento mal sucedido da auto-avaliação devido a nem todas as notas foram preenchidas
	Dado que estou logado como aluno “Lucas Aurelio” matriculado na cadeira “Algoritmos”
E estou na página “meu perfil” da cadeira “Algoritmos”
	E preenchi “MA” na “primeira unidade” da autoavaliação
 	E preenchi “MPA” na “segunda unidade” da autoavaliação
	Quando solicito cadastro das notas da autoavaliação
	Então posso ver uma mensagem de erro “notas não cadastradas, pois uma das notas não foi preenchida”.
    then "resultados esperados"

Cenário não há discrepância
Dado que estou na página “Notas Alunos” da cadeira “Cálculo I”
E “Cálculo I” têm “3” alunos
	E o aluno “José Fernando” cadastrou “MPA” nas “5” autoavaliações
	E o aluno “José Fernando” tem como cadastrado “MPA” nas “5” avaliações do professor
	E o aluno “Pedro Augusto” cadastrou “MPA” nas “5” autoavaliações
	E o aluno “Pedro Augusto” tem como cadastrado “MA” nas “5” avaliações do professor
	E o aluno “Daniel Melo” cadastrou “MPA” nas 1º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MPA” nas 1º avaliação do professor
	E o aluno “Daniel Melo” cadastrou “MPA” nas 2º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MPA” nas 2º avaliação do professor
	E o aluno “Daniel Melo” cadastrou “MPA” nas 3º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MPA” nas 3º avaliação do professor
E o aluno “Daniel Melo” cadastrou “MPA” nas 4º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MPA” nas 4º avaliação do professor
E o aluno “Daniel Melo” cadastrou “MA” nas 5º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MPA” nas 5º avaliação do professor
	Quando pesquiso por “alunos discrepantes”
	Então não vejo nenhum aluno
	E recebo uma mensagem de que não há alunos discrepantes

Cenário há discrepância
Dado que estou na página “Notas Alunos” da cadeira “Cálculo I”
E “Cálculo I” têm “3” alunos
	E o aluno “José Fernando” cadastrou “MPA” nas “5” autoavaliações
	E o aluno “José Fernando” tem como cadastrado “MPA” nas “5” avaliações do professor
	E o aluno “Pedro Augusto” cadastrou “MPA” nas “5” autoavaliações
	E o aluno “Pedro Augusto” tem como cadastrado “MA” nas “5” avaliações do professor
	E o aluno “Daniel Melo” cadastrou “MPA” nas 1º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MPA” nas 1º avaliação do professor
	E o aluno “Daniel Melo” cadastrou “MA” nas 2º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MPA” nas 2º avaliação do professor
	E o aluno “Daniel Melo” cadastrou “MPA” nas 3º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MANA” nas 3º avaliação do professor
E o aluno “Daniel Melo” cadastrou “MA” nas 4º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MANA” nas 4º avaliação do professor
E o aluno “Daniel Melo” cadastrou “MA” nas 5º autoavaliação
E o aluno “Daniel Melo” tem como cadastrado “MPA” nas 5º avaliação do professor
	Quando pesquiso por “alunos discrepantes”
	Então vejo o nome do aluno “Daniel Melo”
commit 1 da questao 14 do discrepantes
commit 2 da questao 14 do discrepantes
	E recebo uma mensagem pesquisa bem sucedida.

Alteracao para 1commit da questao 14
Alteracao para 2commit da questao 14

Cenário de visualização de percentual de discrepância
	Dado que o aluno "Jose Ferreira" tem como cadastrado "MANA" na avaliação 1 do professor "Armando Pedro".
		E que o aluno "Jose Ferreira" tem como cadastrado "MANA" na avaliação 2 do professor "Armando Pedro".
		E que o aluno "Jose Ferreira" tem como cadastrado "MANA" na avaliação 3 do professor "Armando Pedro".
		E que o aluno "Jose Ferreira" tem como cadastrado "MA" na autoavaliação 1.
		E que o aluno "Jose Ferreira" tem como cadastrado "MA" na autoavaliação 2.
		E que o aluno "Jose Ferreira" tem como cadastrado "MPA" na autoavaliação 3.
	Quando o professor "Armando Pedro" pesquisa seus alunos com discrepância
	Então o professor "Armando Pedro" pode ver o nome de "Jose Ferreira" como discrepante.
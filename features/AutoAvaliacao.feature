Esta feature descreve como um aluno pode fazer sua auto-avaliação usando o Teaching assistant e sua tabela de conceito de meta.

Cenário 1: Fazendo auto-avaliação com sucesso
	Dado que eu estou logado como aluno de login "mgrf" e senha "123456" no sistema
	E estou na tela de "auto-avaliação"
	E há uma tabela apresentando os conceitos de cada meta
	E as metas "Meta 1", "Meta 2" e "Meta 3" não estão preenchidas
	E as metas "Meta 1", "Meta 2" e "Meta 3" estão disponíveis para serem preenchidas
	Quando eu atribuir
		o conceito "MPA" para "Meta 1"
		E o conceito "MA" para "Meta 2"
		E o conceito "MA" para "Meta 3"
	E confirmar as alterações
	Então um diálogo será exibido com a mensagem "sucesso"
	E as metas "Meta 1", "Meta 2" e "Meta 3" estão preenchidas com "MPA", "MA" e "MA" respectivamente.
	E o botão de confirmação não estará mais disponível.

Cenário 2: Fazendo auto-avaliação sem sucesso
        Dado que eu estou logado como aluno de login "mgrf" e senha "123456$
        E estou na tela de "auto-avaliação"
        E há uma tabela apresentando os conceitos de cada meta
        E as metas "Meta 1", "Meta 2" e "Meta 3" não estão preenchidas
        E as metas "Meta 1", "Meta 2" e "Meta 3" estão disponíveis para ser$
        Quando eu atribuir
                o conceito "MPA" para "Meta 1"
                E o conceito "MA" para "Meta 2"
                E o conceito nenhum para "Meta 3"
        E confirmar as alterações
        Então um diálogo será exibido com uma mensagem de falha
	E a meta "Meta 1" estará preenchida com "MPA".
	E a meta "Meta 2" estará preenchida com "MA".
        E a meta "Meta 3" não estará preenchida.
	E as alterações não foram salvas no sistema.
        E o botão de confirmação não estará mais disponível.

Cenário 3: Fazendo auto-avaliação sem discrepância
        Dado que eu estou logado como aluno de login "mgrf" e senha "123456$
        E estou na tela de "auto-avaliação"
        E há uma tabela apresentando os conceitos de cada meta
        E as metas "Meta 1", "Meta 2" e "Meta 3" não estão preenchidas
        E as metas "Meta 1", "Meta 2" e "Meta 3" estão disponíveis para serem preenchidas
        Quando eu atribuir
                o conceito "MA" para "Meta 1"
                E o conceito "MANA" para "Meta 2"
                E o conceito "MA" para "Meta 3"
        E confirmar as alterações
        Então um diálogo será exibido com uma mensagem de sucessoa
        E as alterações foram salvas no sistema.
        E o botão de confirmação não estará mais disponível.

Cenário 4: Fazendo auto-avaliação com discrepância
        Dado que eu estou logado como aluno de login "mgrf" e senha "123456$
        E estou na tela de "auto-avaliação"
        E há uma tabela apresentando os conceitos de cada meta
        E as metas "Meta 1", "Meta 2" e "Meta 3" não estão preenchidas
        E as metas "Meta 1", "Meta 2" e "Meta 3" estão disponíveis para serem preenchidas
        Quando eu atribuir
                o conceito "MA" para "Meta 1"
                E o conceito "MA" para "Meta 2"
                E o conceito "MA" para "Meta 3"
        E confirmar as alterações
        Então um diálogo será exibido com uma mensagem de erro "Há discrepância entre a auto-avaliação e a avaliação fornecida pelo professsor".
        E as alterações não foram salvas no sistema.
        E o botão de confirmação estará disponível.

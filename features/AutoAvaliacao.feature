Feature: Auto-avaliação
		As a aluno
		I want to informar ao professor quanto acho que mereço em cada uma das metas avaliadas
		So that minha nota seja revisada caso haja uma incongruência alarmante.
Scenario: Usuário faz preenchimento completo da auto-avaliação 
		Given estou na página “Planilha de Metas/Conceitos”
		And as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When preencho a coluna "Auto-avaliação" com o conceito "MA" para a meta "Conceitos Requisitos", "MA" para "Especificar Requisitos", "MPA" para "Conceitos Gerência" e "MPA" para "Testes"
		Then uma mensagem de confirmação é exibida.
Scenario: Preenchimento bem sucedido da auto-avaliação
		Given as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When submeto ao sistema a "Planilha de Metas/Conceitos" com a coluna "Auto-avaliação" preenchida com os conceitos "MA", "MA", "MPA" e "MPA" para as metas "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes", respectivamente
		Then o sistema atualiza os dados de "Planilha de Metas/Conceitos".
Scenario: Usuário faz preenchimento incompleto da auto-avaliação
		Given estou na página “Planilha de Metas/Conceitos”
		And as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When preencho a coluna de "Auto-avaliação" com o conceito "MA" para a meta "Conceitos Requisitos", "MA" para "Especificar Requisitos" e "MPA" para "Conceitos Gerência"
		Then vejo a célula correspondente a linha de "Testes" e a coluna de "Auto-avaliação" destacada
		And um aviso sobre campo obrigatório é exibido.
Scenario: Preenchimento incompleto da auto-avaliação
		Given as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When submeto ao sistema a "Planilha de Metas/Conceitos" com a coluna "Auto-avaliação" preenchida com os conceitos "MA", "MA" e "MPA" para as metas "Conceitos Requisitos", "Especificar Requisitos" e "Conceitos Gerência", respectivamente
		Then o sistema não atualiza os dados de "Planilha de Metas/Conceitos"
		And o sistema avisa que não salvou os dados.
	Scenario: Auto-avaliação de 3 alunos sem discrepância
             	Given estou na página "Opções de funcionalidades”
             	And o aluno "Pedro Silva" tirou "MPA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
             	And o aluno “Pedro Silva” se auto-avaliou com “MA”, ”MA”, ”MA”, ”MA” e ”MA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
				And a aluna "Ana Lima" tirou "MA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
             	And a aluna "Ana Lima" se auto-avaliou com “MPA”, ”MPA”, ”MPA”, ”MPA” e ”MPA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
				And o aluno " Thiago Vieira" tirou "MA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
             	And o aluno “Thiago Vieira" se auto-avaliou com “MA”, ”MA”, ”MA”, ”MA” e ”MA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
             	When vou para a página “Estatísticas Auto-avaliação” da turma “ESS”
             	Then vejo “0” em “Quantidade de alunos com auto-avaliações discrepantes”
             	And vejo “0”% em “Percentual”
             	And vejo a planilha “Lista” vazia. 
Scenario: Auto-avaliação discrepante em 1 de 3 alunos
             	Given estou na página "Opções de funcionalidades”
             	And o aluno "Pedro Silva" tirou "MPA", "MPA", "MANA", "MPA" e "MPA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
             	And o aluno “Pedro Silva” se auto-avaliou com “MA”, ”MA”, ”MA”, ”MA” e ”MA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
				And a aluna "Ana Lima" tirou "MA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
             	And a aluna "Ana Lima" se auto-avaliou com “MPA”, ”MPA”, ”MPA”, ”MPA” e ”MPA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
				And o aluno " Thiago Vieira" tirou "MA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
             	And o aluno “Thiago Vieira" se auto-avaliou com “MA”, ”MA”, ”MA”, ”MA” e ”MA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
             	When vou para a página “Estatísticas Auto-avaliação” da turma “ESS”
             	Then vejo “1” em “Quantidade de alunos com auto-avaliações discrepantes”
             	And vejo “33”% em “Percentual”
             	And vejo o nome do aluno “Pedro Silva” na planilha “Lista”.
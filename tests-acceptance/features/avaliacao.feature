Feature:	As a aluno
			I want to informar ao professor quanto acho que mereço em cada uma das metas avaliadas
			So that minha nota seja revisada caso haja uma incongruência alarmante.


Scenario: Usuário faz preenchimento completo da auto-avaliação 
		Given estou na página Planilha de Avaliacao
		Given as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When preencho a coluna "Auto-avaliação" com o conceito "MA" para a meta "Conceitos Requisitos"
		When preencho a coluna "Auto-avaliação" com o conceito "MA" para a meta "Especificar Requisitos"
		When preencho a coluna "Auto-avaliação" com o conceito "MPA" para a meta "Conceitos Gerência"
		When preencho a coluna "Auto-avaliação" com o conceito "MPA" para a meta "Testes"
		When salvo a Planilha de Avaliacao
		Then uma mensagem de confirmação é exibida

Scenario: Usuário faz preenchimento incompleto da auto-avaliação
		Given estou na página Planilha de Avaliacao
		Given as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When preencho a coluna "Auto-avaliação" com o conceito "MA" para a meta "Conceitos Requisitos"
		When preencho a coluna "Auto-avaliação" com o conceito "MA" para a meta "Especificar Requisitos"
		When preencho a coluna "Auto-avaliação" com o conceito "MPA" para a meta "Conceitos Gerência"
		When salvo a Planilha de Avaliacao
		Then vejo a célula correspondente a linha de "Testes" e a coluna de "Auto-avaliação" destacada
		Then um aviso sobre campo obrigatório é exibido

Scenario: Auto-avaliação de 3 alunos sem discrepância
             	Given estou na página dos professores
             	And aluno de nome "Pedro Silva" tirou "MPA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”
             	And aluno de nome“Pedro Silva” se auto-avaliou com “MA”, ”MA”, ”MA”, ”MA” e ”MA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”
				And aluno de nome "Ana Lima" tirou "MA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”
             	And aluno de nome "Ana Lima" se auto-avaliou com “MPA”, ”MPA”, ”MPA”, ”MPA” e ”MPA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”
				And aluno de nome " Thiago Vieira" tirou "MA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”
             	And aluno de nome “Thiago Vieira" se auto-avaliou com “MA”, ”MA”, ”MA”, ”MA” e ”MA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”
             	When vou para a página Estatísticas Auto-avaliação
             	Then vejo 0 em quantidade de alunos com auto-avaliações discrepantes
             	And vejo 0% em percentual
             	And vejo a lista de alunos vazia

Scenario: Auto-avaliação discrepante em 1 de 3 alunos
                  Given estou na página "Opções de funcionalidades”
                  And o aluno "Pedro Silva" tirou "MPA", "MPA", "MANA", "MPA" e "MPA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
                  And o aluno “Pedro Silva” se auto-avaliou com “MA”, ”MA”, ”MA”, ”MA” e ”MA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
				  And a aluna "Ana Lima" tirou "MA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
                  And a aluna "Ana Lima" se auto-avaliou com “MPA”, ”MPA”, ”MPA”, ”MPA” e ”MPA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
				  And o aluno " Thiago Vieira" tirou "MA", "MA", "MA", "MA" e "MA" nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
                  And o aluno “Thiago Vieira" se auto-avaliou com “MA”, ”MA”, ”MA”, ”MA” e ”MA” nas metas "Testes", "Conceitos", "Gerência", "Implementação”, "Refatoração”, respectivamente
                  When vou para a página “Estatísticas Auto-avaliação” da turma “ESS”
                  Then vejo "1" em quantidade de alunos com auto-avaliações discrepantes
                  And vejo “33”% em percentual
                  And vejo o nome do aluno “Pedro Silva” na lista de alunos
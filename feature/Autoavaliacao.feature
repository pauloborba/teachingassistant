Feature: Auto-Avaliação.
	AS A: Aluno Cadastrado em uma Turma.
	I WANT TO: Dar a cada uma das metas apresentadas uma Auto-Avaliação.
	SO THAT: Eu consigo visualizar minha Auto-Avaliação em paralelo com
	         as notas dadas pelo Professor à cada meta.

Scenario: Preenchimento de Auto-Avaliação bem sucedido.
		Given: O aluno “Pedro César” está cadastrado como aluno na turma
			   “A”.
		AND: Estou logado na conta de “Pedro César”.
		AND: Estão cadastradas na turma “A” as metas “Entender Conceitos de
		     Requisitos” e “Especificar Requisitos com Qualidade”.
		AND: Para o aluno “Pedro César”, a meta “Entender
		     Conceitos de Requisitos” apresenta a nota “MPA”.
		AND: Para o aluno “Pedro César”, a meta “Especificar
		     Requisitos com Qualidade” apresenta nota “MA”.
		AND: Estou na página de “Auto-Avaliação”.
		WHEN: Eu preencho a Auto-Avaliação de forma que as metas
			  “Entender Conceitos de Requisitos” possui a nota “MA” e
			  “Especificar Requisitos com Qualidade” possui a nota “MPA”.
		THEN: Eu vejo as notas “MPA” para a meta “Entender Conceitos de 
		      Requisitos” e “MA” para “Especificar Requisitos com Qualidade”.
		AND:  Eu vejo a Auto-Avaliação com as notas “MA” para a meta
			  “Entender Conceitos de Requisitos” e “MPA” para “Especificar
			  Requisitos com Qualidade”.

Scenario: Erro de Preenchimento em Auto-Avaliação.
		Given: O aluno “Pedro César” está cadastrado como aluno na turma
			   “A”.
		AND: Estou logado na conta de “Pedro César”.
		AND: Estão cadastradas na turma “A” as metas “Entender Conceitos de
		     Requisitos” e “Especificar Requisitos com Qualidade”.
		AND: Estou na página de “Auto-Avaliação”.
		WHEN: Eu preencho a Auto-Avaliação de forma que as metas
			  “Entender Conceitos de Requisitos” possui a nota “MA” e
			  “Especificar Requisitos com Qualidade” não possui nota.
		THEN: Eu recebo uma mensagem de erro avisando que na 
		      Auto-Avaliação todas as metas devem ser preenchidas.
		THEN: O aluno "Pedro César" não possui Auto-Avaliacao no sistema.
				  
Scenario: Turma sem alunos Discrepantes.
		Given: O professor “Marcelo” realizou o cadastro da turma "B”.
		AND: Estou logado como professor “Marcelo”.
		AND: Os alunos “Pedro César” e “César Silva” estão cadastrados como
			 Alunos da turma “B”.
		AND: Estão cadastradas na turma “B” as metas “Entender Conceitos de
		     Requisitos” e “Especificar Requisitos com Qualidade”.
		AND: Estou na página “Turma A”.
		AND: O aluno “Pedro César” possui Auto-Avaliações “MANA” e “MPA”
			 e notas “MPA” e “MPA” para as metas “Entender Conceitos de
			 Requisitos” e “Especificar Requisitos com Qualidade”
			 Respectivamente.
		AND: O aluno “César Silva” possui Auto-Avaliações “MPA” e “MPA”
			 e notas “MPA” e “MPA” para as metas “Entender Conceitos de
			 Requisitos” e “Especificar Requisitos com Qualidade”
			 Respectivamente.
		WHEN: Eu solicito verificar os alunos com discrepância.
		THEN: Eu recebo uma mensagem avisando que na “Turma A” não há
			  alunos discrepantes.

Scenario: Turma com alunos Discrepantes.
		Given: O professor “Marcelo” realizou o cadastro da turma “A”.
		AND: Estou logado como professor “Marcelo”.
		AND: Os alunos “Pedro César” e “César Silva” estão cadastrados como
			 Alunos da turma “A”.
		AND: Estão cadastradas na turma “A” as metas “Entender Conceitos de
		     Requisitos” e “Especificar Requisitos com Qualidade”.
		AND: Estou na página “Turma A”.
		AND: O aluno “João Pedro” possui Auto-Avaliações “MA” e “MPA”
			 e notas “MPA” e “MPA” para as metas “Entender Conceitos de
			 Requisitos” e “Especificar Requisitos com Qualidade”
			 Respectivamente.
		AND: O aluno “César Silva” possui Auto-Avaliações “MPA” e “MPA”
			 e notas “MPA” e “MPA” para as metas “Entender Conceitos de
			 Requisitos” e “Especificar Requisitos com Qualidade”
			 Respectivamente.
		WHEN: Eu solicito verificar os alunos com discrepância.
		THEN: Eu visualizo o aluno “João Pedro” e suas notas Discrepantes.

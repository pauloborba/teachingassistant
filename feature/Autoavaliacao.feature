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
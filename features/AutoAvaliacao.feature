Feature: Auto avaliação
	As a Um professor da turma
	I want to Verificar as informações relacionadas aos alunos com notas discrepantes da autoavaliação
	So that Eu posso identificar quais alunos estão sendo ‘prejudicados’

	Scenario: Verificando informações sobre as auto-avaliações dos alunos
		Given Eu entro no sistema logado como professor
		When Eu verifico as estatísticas relacionadas às Auto-avaliações
		Then O sistema retorna os valores com os campos (quantidade = 0, percentual = 0%, lista = NULL)


	Scenario: Verificando informações sobre as auto-avaliações dos alunos
		Given Eu entro no sistema logado como professor
		When Eu verifico as estatísticas relacionadas às Auto-avaliações
		Then O sistema retorna os valores com os campos (quantidade = 1, percentual = 33,33%, lista = Mikael Vidal da Silva)
		And Um aluno é salvo no sistema como tendo uma nota discrepante
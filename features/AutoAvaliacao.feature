Feature: Realização de auto-avaliação pelo aluno.
	As a aluno de uma classe
	I want to adicionar notas de avaliação para cada meta
	So that será possível calcular a média final

Gui Scenario: preenchimento bem-sucedido da auto-avaliação
	Given eu estou na “página de atribuição” de notas
	And eu preencho os campos de notas com “MA” para cada meta existente
	When seleciono a opção “Cadastrar”
	Then eu posso ver as notas de auto-avaliação na plataforma

System Scenario: preenchimento bem-sucedido auto-avaliação
	Given que o sistema recebeu “MA” para todas as notas de auto-avaliação do aluno “Gabriel”
	When é pedido as notas de “Gabriel” ao sistema
	Then o sistema retorna as todas as notas “MA” para cada meta que existe

Gui Scenario: preenchimento mal-sucedido da auto-avaliação
	Given eu estou na “página de atribuição de notas”
	And eu avalio apenas a meta “Entender conceitos de requisitos” como “MA”
	When eu seleciono a opção “Cadastrar”
	Then eu posso ver um aviso de cadastro mal-sucedido pela falta de informação

System Scenario: preenchimento mal-sucedido auto-avaliação
	Given que o sistema recebeu as notas de auto-avaliação de um aluno
	When o sistema percebe a ausência de pelo menos 1 campo
	Then ele retorna uma mensagem de erro


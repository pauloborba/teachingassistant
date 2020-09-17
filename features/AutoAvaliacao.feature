Feature: Auto-avaliação
	As a Aluno de Graduação do Centro de Informática da Faculdade Federal de Pernambuco.
	I want to adicionar, remover e atualizar os conceitos das metas auto-avaliadas das matérias em que estou matriculado
	so that eu possa registrar o que acho que mereço por cada meta

	Scenario: adicionando auto-avaliação sem erro
		Given Eu estou na seção “Notas”
		And Eu vejo os conceitos “MPA”, ”MPA”, “MPA” respectivamente para cada meta avaliada pelo docente.
		And Eu estou com a auto-avaliação pendente
		When Eu adiciono respectivamente os conceitos “MA, “MPA”, “MA”, para cada meta da auto-avaliação
		Then Eu continuo na seção “Notas”
		And Eu vejo que a auto-avaliação foi concluída

	Scenario: adicionando auto-avaliação sem erro
		Given que o estudante “José Bezerra” está salvo no sistema com os conceitos “MPA”, “MPA”, “MPA” respectivamente para cada meta avaliada pelo docente
		When Eu peço ao sistema para adicionar ao estudante “José Bezerra” os respectivos conceitos “MA”, “MPA”, “MA” auto-avaliados pelo aluno para cada meta
		Then o estudante “José Bezerra” é salvo no sistema com os respectivos conceitos auto-avaliados “MA”, “MPA”, “MA”
		And o estudante “José Bezerra” continua com os respectivos conceitos “MPA”, “MPA”, “MPA”  avaliados pelo docente

	Scenario: adicionando auto-avaliação com erro
		Given Eu estou na seção “Notas”
		And Eu vejo os conceitos “MPA”, ”MPA”, “MPA” respectivamente para cada meta avaliada pelo docente.
		And Eu estou com a auto-avaliação pendente
		When Eu adiciono respectivamente os conceitos “MA, “-”, “MA”, para cada meta da auto-avaliação
		Then Eu continuo na seção “Notas”
		And Eu vejo que a auto-avaliação continua pendente.
		And Eu sou apresentado a uma mensagem de erro.


	Scenario: adicionando auto-avaliação com erro
		Given que o estudante “José Bezerra” está salvo no sistema com os conceitos “MPA”, “MPA”, “MPA” respectivamente para cada meta avaliada pelo docente
		When Eu peço ao sistema para adicionar ao estudante “José Bezerra” os respectivos conceitos “MA”, “-”, “MA” auto-avaliados pelo aluno para cada meta
		Then o sistema retorna uma mensagem de erro.
		And o estudante “José Bezerra” continua com os respectivos conceitos “MPA”, “MPA”, “MPA”  avaliados pelo docente

	Scenario: checando discrepâncias
		Given Eu estou na seção “Notas” de todos os alunos do sistema
		And Eu vejo os conceitos “MA, MPA, MPA, MPA, MPA” respectivamente para cada meta auto-avaliada pelo Aluno “José”.
		And Eu vejo os conceitos apenas conceitos “MANA” respectivamente para cada meta auto-avaliada pelo Aluno “João”.
		And Eu vejo os conceitos “MPA, MPA, MPA, MPA, MPA” respectivamente para cada meta auto-avaliada pelo Aluno “Fernando”.
		And Eu vejo os conceitos “MPA, MPA, MPA, MPA, MPA” respectivamente para cada meta avaliada por mim ao Aluno “José”.
		And Eu vejo os conceitos “MPA, MPA, MPA, MPA, MPA” respectivamente para cada meta avaliada por mim ao Aluno “João”.
		And Eu vejo os conceitos “MPA, MPA, MPA, MPA, MPA” respectivamente para cada meta avaliada por mim ao Aluno “Fernando”.
		When Eu solicito ao sistema de notas que me mostre as discrepâncias de notas
		Then Eu continuo na seção “Notas” de todos os alunos do sistema
		And Eu vejo que a avaliação de discrepância foi concluída sem erros.
		And Não vejo nenhuma discrepância na listagem.
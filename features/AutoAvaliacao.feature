Feature: Auto-avaliação
	As um aluno, I want to atribuir um conceito para cada meta avaliada, so that eu possa realizar uma auto-avaliação enquanto vejo os conceitos atribuídos pelo professor.

	Scenario: nova auto-avaliação
		Given o sistema não tem auto-avaliação registrada de “Fulano de Tal”
		When Eu envio uma auto-avaliação como “Fulano de Tal”
		And a auto-avaliação tem conceitos atribuídos a todas as metas
		Then a auto-avaliação de “Fulano de Tal” é registrada no sistema.

	Scenario: nova auto-avaliação GUI
		Given estou na página “auto-avaliação”
		And estou logado como “Fulano de Tal”
		And o sistema não tem auto-avaliação registrada de “Fulano de Tal”
		When Eu envio uma auto-avaliação
		And a auto-avaliação tem conceitos atribuídos a todas as metas
		Then eu recebo uma mensagem informando que a auto-avaliação foi corretamente registrada.

	Scenario: auto-avaliação incompleta
		Given o sistema não tem auto-avaliação registrada de “Fulano de Tal”
		When Eu envio uma auto-avaliação como “Fulano de Tal”
		And a auto-avaliação tem uma ou mais metas com conceitos não atribuídos
		Then a auto-avaliação de “Fulano de Tal” não é registrada no sistema
	
	Scenario: auto-avaliação incompleta GUI
		Given estou na página “auto-avaliação”
		And estou logado como “Fulano de Tal”
		And o sistema não tem auto-avaliação registrada de “Fulano de Tal”
		When Eu envio uma auto-avaliação
		And a auto-avaliação tem uma ou mais metas com conceitos não atribuídos
		Then eu recebo uma mensagem informando que a auto-avaliação foi preenchida incorretamente.
		Then alguma coisa.

	Scenario: nenhum aluno discrepante
		Given a auto-avaliação de “Fulano de Tal” é “MA/MA/MA/MA/MA”
		And a auto-avaliação de “Beltrana” é “MPA/MPA/MPA/MPA/MPA”
		And a auto-avaliação de “Juninho” é “MA/MA/MA/MA/MA”
		And a avaliação de “Fulano de Tal” é “MA/MA/MA/MA/MANA”
		And a avaliação de “Beltrana” é “MA/MA/MA/MA/MA”
		And a avaliação de “Juninho” é “MA/MA/MA/MA/MA”
		When eu vou para a página “auto-avaliações discrepantes”
		Then eu vejo a porcentagem “0%” de auto-avaliações discrepantes
		And eu vejo o número “0” de auto-avaliações discrepantes
		And não há alunos na lista de alunos com auto-avaliações discrepantes.

	Scenario: um aluno discrepante
		Given a auto-avaliação de “Fulano de Tal” é “MA/MA/MA/MA/MA”
		And a auto-avaliação de “Beltrana” é “MPA/MPA/MPA/MPA/MPA”
		And a auto-avaliação de “Juninho” é “MA/MA/MA/MA/MA”
		And a avaliação de “Fulano de Tal” é “MPA/MA/MPA/MA/MANA”
		And a avaliação de “Beltrana” é “MA/MA/MA/MA/MA”
		And a avaliação de “Juninho” é “MA/MA/MA/MA/MA”
		When eu vou para a página “auto-avaliações discrepantes”
		Then eu vejo a porcentagem “33%” de auto-avaliações discrepantes
		And eu vejo o número “1” de auto-avaliações discrepantes
		And o aluno “Fulano de Tal” está na lista de alunos com auto-avaliações discrepantes.
		And eu recebo uma notificação.

	Scenario: Mais um teste.
	
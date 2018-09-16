Feature: Auto-Avaliação
    As a estudante da cadeira "Engenharia de Sistemas de Software".
    I want to poder me auto-avaliar diante aos conceitos e metas pré-definidas e poder ver a avaliação do professor.
    So that fique registrado para posteriores casos de avaliação do professor.

    Scenario: preenchimento bem sucedido da auto-avaliação
		Given estou logado como “Aluno” de login “Pedro” e senha “euamominhamae”
		And estou na página da disciplina “Disciplina 1”
		And estou no menu de “Auto-avaliação” da disciplina “Disciplina 1”
    And não há registros de auto-avaliação pelo aluno “Pedro”
		When atribuo às metas os conceitos “MA”, “MANA” e “MA”
		And seleciono a opção “Finalizar auto-avaliação”
		Then aparecerá uma mensagem informando “A auto-avaliação foi concluída com sucesso”

    Scenario: preenchimento bem sucedido da auto-avaliação
		Given as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” foram configuradas pelo professor no sistema
		And os conceitos “MA”, “MPA” e “”MANA” foram configuradas pelo professor ao sistema
		When atribuo às metas os conceitos “MA”, “MANA” e “MA”
		Then serão armazenados ao sistema no aluno “Pedro” os conceitos “MA”, “MANA” e “MA” às metas

    Scenario: preenchimento mal sucedido da auto-avaliação
		Given estou logado como “Aluno” de login “Pedro” e senha “euamominhamae”
		And estou na página da disciplina “Disciplina 1”
		And estou no menu de “Auto-avaliação” da disciplina “Disciplina 1”
		And não há registros de auto-avaliação pelo aluno “Pedro”
		When atribuo às metas os conceitos “ ”, “MANA” e “MA” 
		And seleciono a opção “Finalizar auto-avaliação”
		Then aparecerá uma mensagem de erro informando “Pelo menos umas das metas não foram preenchidas, por favor, preencha-as”

    Scenario: preenchimento mal sucedido da auto-avaliação
		Given as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” foram configuradas pelo professor no sistema
		And os conceitos “MA”, “MPA” e “”MANA” foram configuradas pelo professor ao sistema
		When atribuo às metas os conceitos “ ”, “MANA” e “MA”
		Then os conceitos não serão armazenados ao sistema
		And (Passo adicional)

		Scenario: nenhuma discrepância no preenchimento da auto-avaliação
		Given estou logado como “Professor” de login “Paulo” e senha “seeyouspacecowboy”
		And estou na página da disciplina “Disciplina 1”
		And estou no menu de “Avaliação” da disciplina “Disciplina 1”
		And “Aluno 1” se auto-avaliou com os conceitos “MA”, “MANA”, “MPA”, “MA” e “MPA”
		And “Aluno 2” se auto-avaliou com os conceitos “MPA”, “MANA”, “MPA”, “MANA” e “MPA”
		And “Aluno 3” se auto-avaliou com os conceitos “MA”, “MANA”, “MPA”, “MA” e “MPA”
		When avalio o “Aluno 1” com os conceitos “MA”, “MANA”, “MANA”, “MA” e “MPA”
		And avalio o “Aluno 2” com os conceitos “MA”, “MPA”, “MA”, “MPA” e “MA”
		And avalio o “Aluno 3” com os conceitos “MA”, “MANA”, “MPA”, “MA” e “MPA”
		And seleciono a opção de visualizar lista de discrepantes
		Then eu vejo a lista vazia com “Quantidade = 0” e “Percentual = 0%”

		Scenario: discrepância no preenchimento da auto-avaliação
		Given estou logado como “Professor” de login “Paulo” e senha “seeyouspacecowboy”
		And estou na página da disciplina “Disciplina 1”
		And estou no menu de “Avaliação” da disciplina “Disciplina 1”
		And “Aluno 1” se auto-avaliou com os conceitos “MA”, “MA”, “MPA”, “MA” e “MPA”
		And “Aluno 2” se auto-avaliou com os conceitos “MPA”, “MANA”, “MPA”, “MANA” e “MPA”
		And “Aluno 3” se auto-avaliou com os conceitos “MA”, “MANA”, “MPA”, “MA” e “MPA”
		When avalio o “Aluno 1” com os conceitos “MPA”, “MANA”, “MANA”, “MA” e “MPA”
		And avalio o “Aluno 2” com os conceitos “MA”, “MPA”, “MA”, “MPA” e “MA”
		And avalio o “Aluno 3” com os conceitos “MA”, “MANA”, “MPA”, “MA” e “MPA”
		And seleciono a opção de visualizar lista de discrepantes
		Then eu vejo a “Quantidade = 1” e “Percentual = 33,33%” e a lista com o nome do “Aluno ”
		And (Atualização mais significativa no cenário)

		(Para realizar o commit para o rebase na branch master)
		(Modificação de novo cenário de percentual de discrepância)
		(Ajuste no novo cenário de percentual de discrepância)
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

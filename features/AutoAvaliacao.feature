Feature:
	Como um aluno envolvido com o sistema.
	Eu quero poder me auto-avaliar conforme conceitos(MPA,  etc) em relação a metas(Entender conceitos de requisitos, etc) e ver conceitos que meu professor me atribuiu.
	
Scenario: Preencher uma auto-avaliação
	Given que eu estou logado no sistema
	And em minha própria página de “Avaliação”
	And eu fui avaliado pelo professor “Sergio”
	When eu cadastrar os conceitos “MA”, “MPA” ou “MANA” para cada uma de minhas metas
	And eu clicar “Ok”
	Then eu poderei ver os conceitos cadastrados para suas respectivas metas
	And os conceitos “MA”, “MPA” ou “MANA” atribuídos para cada uma das metas pelo professor “Sergio”.

Scenario: Preencher uma auto-avaliação incompleta
	Given que eu estou logado no sistema
	And em minha própria página de “Avaliação”
	When eu cadastrar os conceitos “MA”, “MPA” ou “MANA” para cada uma de minhas metas exceto “Especificar Requisitos com Qualidade”
	And eu clickar “Ok”
	Then nenhuma avaliação será entrada no sistema
	And será mostrada um aviso de “Erro: Meta não preenchida”
	Then os stakeholders estarão felizes
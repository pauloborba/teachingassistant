#Feature: AutoAvaliação
	As a estudante 
	I want to atribuir um conceito para cada meta da disciplina 
	so that eu posso comparar minha autoavaliação com o conceito atribuído pelo professor

- - - - - - Scenarios - - - - - -

#GUI based# Scenario: Preenchimento da autoAvaliação
	Given eu estou na página de “autoavaliação” da disciplina “Engenharia de Software”
	And eu vejo as metas “Entender Conceitos de Requisitos”, “Especificar Requisitos com qualidade” e “Entender Conceitos de Gerência” com conceito de autoavaliação em branco
	When eu adiciono “MPA” para “Entender Conceitos de Requisitos”, “MANA” para “Especificar Requisitos com qualidade” e “MPA” para “Entender Conceitos de Gerência”
	And eu envio
	Then eu vejo  as metas “Entender Conceitos de Requisitos”, “Especificar Requisitos com qualidade” e  “Entender Conceitos de Gerência” com “MPA”, “MANA” e “MPA”, respectivamente

#Service based# Scenario: Nova autoAvaliação
	Given o sistema não tem conceitos de autoavaliação atribuídos às metas  “Entender Conceitos de Requisitos”, “Especificar Requisitos com qualidade” e “Entender Conceitos de Gerência” da disciplina “Engenharia de Software”
	When eu adiciono “MPA” para “Entender Conceitos de Requisitos”, “MANA” para “Especificar Requisitos com qualidade” e “MPA” para “Entender Conceitos de Gerência”
	And eu envio
	Then  o sistema tem os conceitos de autoavaliação “MPA”, “MANA” e “MPA” associados às metas “Entender Conceitos de Requisitos”, “Especificar Requisitos com qualidade” e  “Entender Conceitos de Gerência”, respectivamente

#GUI based# Scenario: Preenchimento incompleto da autoAvaliação
	Given eu estou na página de “autoavaliação” da disciplina “Engenharia de Software”
	And eu vejo as metas “Entender Conceitos de Requisitos”, “Especificar Requisitos com qualidade” e “Entender Conceitos de Gerência” sem conceito de autoavaliação.
	When eu adiciono “MPA” para “Entender Conceitos de Requisitos” e “MPA” para “Entender Conceitos de Gerência”
	And envio
	Then  eu vejo uma mensagem de erro

#Service based# Scenario: Nova autoAvaliação incompleta
	Given o sistema não tem conceitos de autoavaliação atribuídos às metas  “Entender Conceitos de Requisitos”, “Especificar Requisitos com qualidade” e “Entender Conceitos de Gerência” da disciplina “Engenharia de Software”
	When eu adiciono “MPA” para “Entender Conceitos de Requisitos” e “MPA” para “Entender Conceitos de Gerência”
	And envio
	Then as metas  “Entender Conceitos de Requisitos”, “Especificar Requisitos com qualidade” e “Entender Conceitos de Gerência” da disciplina “Engenharia de Software” não têm conceitos de autoavaliação




- - - - - - Descrição da Feature - - - - - -

#Feature: AutoAvaliação
	As a estudante 
	I want to atribuir um conceito para cada meta da disciplina 
	so that eu posso comparar minha autoavaliação com o conceito atribuído pelo professor

- - - - - - Scenarios - - - - - -

  - - - AutoAvaliacao - - - 
 
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
	Then eu vejo uma mensagem de erro
	And as metas  “Entender Conceitos de Requisitos”, “Especificar Requisitos com qualidade” e “Entender Conceitos de Gerência” da disciplina “Engenharia de Software” não têm conceitos de autoavaliação

  - - - Discrepancia - - - 

#GUI based# Scenario: Visualização de quando não há discrepância
	Given eu estou na página de “Listagem de Alunos” da disciplina “Engenharia de Software”
	And eu vejo os alunos “Aline Gouveia”, “Íris Soares”, “Magnon Paulinho”, “Rebeca Oliveira” com conceitos atribuídos MPA, MPA e MA, respectivamente, além desses mesmos conceitos para autoavaliação
	And “Lucas Mendonça” com conceitos atribuídos MA, MPA, MPA, MPA, MA e respectivamente a cada meta, MA, MA, MPA, MPA, MA para autoavaliação
	When eu filtro para visualizar apenas os alunos com discrepância
	Then eu vejo uma mensagem que indica lista vazia

#GUI based# Scenario: Visualização de quando há discrepância
	Given eu estou na página de “Listagem de Alunos” da disciplina “Engenharia de Software”
	And eu vejo a aluna “Aline Gouveia” com conceitos atribuídos MPA, MPA, MA, e respectivamente a cada meta, MPA, MPA, MA para autoavaliação
	And “Lucas Mendonça” com conceitos atribuídos MA, MPA, MPA, e respectivamente a cada meta, MA, MA, MPA para autoavaliação
	When eu filtro para visualizar apenas os alunos com discrepância
	Then eu vejo apenas o aluno “Lucas Mendonça”



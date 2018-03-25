Feature: auto-avaliação
		Como um aluno com o nome “Cicrano da Silva”
		Eu quero adicionar as notas da auto-avaliação das minhas metas e visualizar os conceitos atribuídos pelos professores
		De modo que eu possa registrar a minha auto-avaliação no sistema


Scenario:	Adicionar os conceitos às metas de avaliação
			Given eu estou na página “Atribuição de conceitos”
			When eu preencho “MA” para  a meta “conceitos de requisitos”
			And eu preencho “MPA” para a meta “Requisitos com qualidade”
			And eu preencho “MPA” para a meta “Conc. ger. de conf.”
			Then eu vejo na tela uma mensagem de confirmação

Scenario:	Adicionar conceitos às metas
			Given o sistema não está com a auto-avaliação do “Aluno” “Cicrano da Silva” atribuido
			When	eu tento atribuir a auto-avaliação de “Cicrano da Silva”
			Then o sistema armazena a auto-avaliação de “Cicrano da Silva”


Scenario:	Adicionar os conceitos às metas de avaliação faltando uma meta
			Given eu estou na página “Atribuição de conceitos”
			When eu preencho “MA” para  a meta “conceitos de requisitos”
			And eu preencho “MPA” para a meta “Conc. ger. de conf.”
			Then eu vejo na tela a mensagem de erro “há metas que não foram auto-avaliadas” 

Scenario:	Adicionar conceitos às metas 
			Given o sistema não está com a auto-avaliação do “Aluno” “Cicrano da Silva” atribuido
			When	eu tento atribuir a auto-avaliação de “Cicrano da Silva” 
			Then a auto-avaliação de “Cicrano da Silva” não é armazenada no sistema

Scenario:	ver as auto-avaliações de “1” “Aluno” com nenhuma discrepância
			Given eu estou na página “lista de alunos”
			And o aluno “Adalberto Araújo” tem “1” conceito inferior 
			And o aluno “Cicrano da Silva” tem “todos” conceitos superiores
			And a aluna “Fulana Soares” tem “todos” conceitos iguais
			When eu tento ver as auto-avaliações da aluna “Fulana Soares”
			Then eu vejo as “notas” dados por mim e a aluna “Fulana Soares” iguais

Scenario:	ver as auto-avaliações de “1” “Aluno” com discrepância
			Given eu estou na página “lista de alunos”
			And o aluno “Adalberto Araújo” tem “1” conceito inferior 
			And o aluno “Cicrano da Silva” tem “2” conceitos superiores
			And a aluna “Fulana Soares” tem “todos” conceitos iguais
			When eu tento ver as auto-avaliações do aluno “Cicrano da Silva”
			Then eu vejo as “notas” do aluno “Cicrano da Silva”
			And vejo que o aluno é discrepância

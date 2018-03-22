Feature auto avaliação
		Como Estudante
		Gostaria de fazer a auto avaliação
		Para ter minhas notas no sistema

Scenario Preencher avaliacao do aluno “Mario” GUI
		Given estou na página de metas de “Mario”
		And a meta “Entender conceitos de requisitos” esta com valor “” and a meta “Especificar requisitos com qualidade” esta com valor “” and a meta “Entender conceitos de gerência de configuração” esta com valor “” 
		When eu mudo o valor do conceito “Entender conceitos de requisitos” para “MA” and mudo o valor do conceito “Especificar requisitos com qualidade” esta com valor” para “MA” and mudo o valor do conceito “Entender conceitos de gerência de configuração” para “MA” 
		Then	eu recebo uma mensagem de confirmação

Scenario Salvar nota da meta “Entender conceitos de requisitos”, do aluno “Mario”, com “MA” Controller
		Given o aluno “Mario” esta logado no sistema
		And  o aluno “Mario” esta com a meta “Entender conceitos de requisitos”  esta com valor “” and a meta “Especificar requisitos com qualidade” esta com valor “” and a meta “Entender conceitos de gerência de configuração” esta com valor “”
		When o aluno “Mario” muda o valor do conceito “Entender conceitos de requisitos” para “MA” and o valor do conceito “Especificar requisitos com qualidade” esta com valor” para “MA” and o valor do conceito “Entender conceitos de gerência de configuração” para “MA” 
		Then	a meta “Entender conceitos de requisitos”  esta com valor “MA” and a meta “Especificar requisitos com qualidade” esta com valor “MA” and a meta “Entender conceitos de gerência de configuração” esta com valor “MA”
		And alteração do stackholder

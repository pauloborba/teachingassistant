Feature Auto-avaliação
	As a Aluno
	I want to Atribuir conceitos para cada meta
	So that Eu possa me avaliar como eu acredito que mereço.

Scenario: nova auto-avaliação gui
Given Eu loguei como “Aluno” com o login “gap” e a senha “1234”
And Eu vejo que não preenchi minha auto-avaliação da disciplina “Engenharia de Software”
And Eu vejo apenas as metas “Entender conceitos de requisitos” e “Especificar requisitos com qualidade” na disciplina “Engenharia de Software”
When Eu seleciono “Preencher auto-avaliação” de “Engenharia de Software”
And Eu preencho minha auto-avaliação de “Entender conceitos de requisitos” com “MA”
And Eu preencho minha auto-avaliação de “Especificar requisitos com qualidade” com “MPA”
Then Uma mensagem de confirmação é exibida
And Eu vejo o conceito “MA” na minha auto-avaliação de “Entender conceitos de requisitos” em “Engenharia de Software”
And Eu vejo o conceito “MPA” na minha auto-avaliação de “Especificar requisitos com qualidade” em “Engenharia de Software”

Scenario: nova auto-avaliação serviço
Given O sistema não têm a auto-avaliação do aluno com login “gap” na disciplina “Engenharia de Software”
And O sistema tem apenas as metas “Entender conceitos de requisitos” e “Especificar requisitos com qualidade” na disciplina “Engenharia de Software” 
When Eu cadastro a auto-avaliação do aluno “gap” com “MA” em “Entender conceitos de requisitos”
And Eu cadastro a auto-avaliação do aluno “gap” com “MPA” em “Especificar requisitos com qualidade”
Then O sistema guarda que o aluno “gap” cadastrou a auto-avaliação
And O sistema guarda o conceito “MA” na auto-avaliação de “Entender conceitos de requisitos” do aluno “gap”
And O sistema guarda o conceito “MPA” na auto-avaliação de “Especificar requisitos com qualidade” do aluno “gap”
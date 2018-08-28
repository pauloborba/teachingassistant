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

Scenario: nova auto-avaliação parcial gui
Given Eu loguei como “Aluno” com o login “gap” e a senha “1234”
And Eu vejo que não preenchi minha auto-avaliação da disciplina “Engenharia de Software”
And Eu vejo apenas as metas “Entender conceitos de requisitos” e “Especificar requisitos com qualidade” na disciplina “Engenharia de Software”
When Eu seleciono “Preencher auto-avaliação” de “Engenharia de Software”
And Eu preencho minha auto-avaliação de “Entender conceitos de requisitos” com “MA”
And Eu não preencho minha auto-avaliação de “Especificar requisitos com qualidade”
Then Uma mensagem de erro é exibida

Scenario: nova auto-avaliação parcial serviço
Given O sistema não têm a auto-avaliação do aluno com login “gap” na disciplina “Engenharia de Software”
And O sistema tem apenas as metas “Entender conceitos de requisitos” e “Especificar requisitos com qualidade” na disciplina “Engenharia de Software” 
When Eu cadastro a auto-avaliação do aluno “gap” com “MA” em “Entender conceitos de requisitos”
And Eu não cadastro a auto-avaliação do aluno “gap” em “Especificar requisitos com qualidade”
Then O sistema não registra a auto-avaliação do aluno “gap” em “Engenharia de Software”
And O sistema registra que o aluno "gap" tentou mas não concluiu a auto-avaliação em "Engenharia de Software"

Scenario: Página de estatisticas de auto-avaliações sem discrepancia
Given Eu loguei como “Professor” com o login “gap” e a senha “1234”
And Eu vejo 5 metas na minha disciplina “Engenharia de Software”
And Eu vejo apenas os alunos “Zézinho”, “Huguinho” e “Luizinho” na lista de alunos de “Engenharia de Software”
And Eu vejo que avaliei “Zézinho” com “MA, MA, MA, MA, MPA” em “Engenharia de Software”
And Eu vejo que “Zézinho” se auto-avaliou com “MPA, MANA, MPA, MPA, MANA” em “Engenharia de Software”
And Eu vejo que avaliei “Huguinho” com “MPA, MANA, MPA, MPA, MANA” em “Engenharia de Software”
And Eu vejo que “Huguinho” se auto-avaliou com  “MPA, MANA, MPA, MPA, MANA” em “Engenharia de Software”
And Eu vejo que avaliei “Luizinho” com “MANA, MPA, MPA, MA, MA” em “Engenharia de Software”
And Eu vejo que “Luizinho” se auto-avaliou com  “MPA, MPA, MPA, MA, MA” em “Engenharia de Software”
When Eu acesso a página de “Estatísticas das auto-avaliações” da disciplina “Engenharia de Software”
Then Eu vejo “0” alunos na quantidade de alunos com auto-avaliações discrepantes
And Eu vejo “0”% na porcentagem de alunos com auto-avaliações discrepantes
And Eu não vejo nenhum aluno na lista de alunos com auto-avaliações discrepantes

Scenario: Página de estatisticas de auto-avaliações com discrepancia
Given Eu loguei como “Professor” com o login “gap” e a senha “1234”
And Eu vejo 5 metas na minha disciplina “Engenharia de Software”
And Eu vejo apenas os alunos “Zézinho”, “Huguinho” e “Luizinho” na lista de alunos de “Engenharia de Software”
And Eu vejo que avaliei “Zézinho” com “MA, MA, MA, MA, MPA” em “Engenharia de Software”
And Eu vejo que “Zézinho” se auto-avaliou com “MPA, MANA, MPA, MPA, MANA” em “Engenharia de Software”
And Eu vejo que avaliei “Huguinho” com “MPA, MANA, MPA, MPA, MANA” em “Engenharia de Software”
And Eu vejo que “Huguinho” se auto-avaliou com  “MPA, MANA, MPA, MPA, MANA” em “Engenharia de Software”
And Eu vejo que avaliei “Luizinho” com “MANA, MPA, MPA, MA, MA” em “Engenharia de Software”
And Eu vejo que “Luizinho” se auto-avaliou com  “MPA, MA, MPA, MA, MA” em “Engenharia de Software”
When Eu acesso a página de “Estatísticas das auto-avaliações” da disciplina “Engenharia de Software”
Then Eu vejo “1” alunos na quantidade de alunos com auto-avaliações discrepantes
And Eu vejo “33”% na porcentagem de alunos com auto-avaliações discrepantes
And Eu vejo apenas “Luizinho” na lista de alunos com auto-avaliações discrepantes

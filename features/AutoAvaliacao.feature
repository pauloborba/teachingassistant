Feature: [Auto Avaliação]
As a [Aluno]
I want to [Atribuir conceitos que eu acho justos às minhas metas e, ao mesmo tempo, observar os conceitos que o professor me atribuiu]
so that [Eu posso relacionar as avaliações]

Scenario: Preenchimento correto de Auto Avaliação (GUI)
Given Eu estou na tela de “auto avaliação” logado como “Aluno”
And os conceitos dados pelo professor para as metas já aparecem na tela
When Eu tenho enviar um formulário preenchido com todas as avaliações
Then É exibida uma mensagem de sucesso

Scenario: Preenchimento correto de Auto Avaliação (Serviço)
Given O sistema apresenta as avaliações do professor para as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração, Etc.” do aluno “Saulo Guilhermino”, mas não apresenta as auto avaliações do aluno “Saulo Guilhermino”
When O aluno “Saulo Guilhermino” preenche os campos de avaliação das metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração, Etc.” com as avaliações “MANA, MPA, MA, MA”  e envia o formulário para o servidor
Then O sistema armazena as avaliações nos campos necessários.

Scenario: Preenchimento incompleto de Auto Avaliação (GUI)
Given Eu estou na tela de “Auto avaliação” logado como “Saulo Guilhermino”
And as avaliações do professor para as metas já aparecem na tela
When Eu tento enviar um formulário com um campo não preenchido
Then É exibida uma mensagem de erro

Scenario: Preenchimento incompleto de Auto Avaliação (Serviço)
Given O sistema apresenta as avaliações dados pelo professor para as metas  do aluno “Saulo Guilhermino”, mas não apresenta as auto-avaliações do aluno “Saulo Guilhermino”
When O aluno tenta enviar para o servidor as avaliações um formulário com um campo não preenchido
Then O sistema não armazena as avaliações enviadas incorretamente

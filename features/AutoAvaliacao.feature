Feature: Autoavaliação 
As a estudante de uma disciplina
I want to auto-avaliar cada meta e visualizar o conceito dado pelo professor so that o professor poderá ver em uma lista se a minha autoavaliação é discrepante com a dele.

Scenario: Nova Autoavaliação sem erro (web)
Given eu estou na página “Autoavaliação”
When eu preencher o formulário os conceitos:  “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
And tentar enviar a autoavaliação
Then aparecerá uma mensagem de confirmação
And serei redirecionado para a página “Autoavaliação já respondida”

Scenario: Nova Autoavaliação sem erro (server)
Given estou cadastrado na disciplina “ESS”
And ainda não enviei o questionário de autoavaliação
And os campos “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” foram respondidos
When eu tento enviar a autoavaliação
Then será enviado ao professor um relatório
And no relatório os campos “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” estarão preenchidos

Scenario: Autoavaliação com erro, pois falta um campo (web)
Given eu estou na página de “autoavaliação”
When eu preencher o formulário com os conceitos:  “Entender conceitos de requisitos” e “Especificar requisitos com qualidade” 
And tentar enviar a autoavaliação
Then aparecerá uma mensagem de erro
And voltarei a página de “autoavaliação” com os campos vazios

Scenario: Autoavaliação com erro, pois falta um campo (server)
Given estou cadastrado na disciplina “ESS”
And ainda não enviei o questionário de autoavaliação
And os campos “Entender conceitos de requisitos” e “Entender conceitos de gerência de configuração” foram respondidos
And o campo  “Especificar requisitos com qualidade” não foi respondido
When eu tento enviar a autoavaliação
Then um relatório com todos os conceitos da disciplina “ESS” autoavaliados não será enviado ao professor 

Scenario: "Alunos discrepantes" sem alunos na lista (web)
Given estou logado como “professor”
And o estudante “João” tem conceitos “MA” em “Entender conceitos de requisitos”, “MPA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MANA” em Entender modelos de documentação, “MA” em “Elicitar requisitos”
And  o estudante “João” se autoavaliou com“MA” em “Entender conceitos de requisitos”, “MA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MANA” em Entender modelos de documentação, “MA” em “Elicitar requisitos”
And a estudante “Maria” tem conceitos “MA” em “Entender conceitos de requisitos”, “MPA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MA” em Entender modelos de documentação, “MA” em “Elicitar requisitos”
And a estudante “Maria”  se autoavaliou “MPA” em “Entender conceitos de requisitos”, “MANA” em “Especificar requisitos com qualidade”, “MANA” em “Entender conceitos de gerência de configuração”, “MPA” em Entender modelos de documentação, “MANA” em “Elicitar requisitos”
And o estudante “Paulo” tem conceitos “MANA” em “Entender conceitos de requisitos”, “MPA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MANA” em Entender modelos de documentação, “MPA” em “Elicitar requisitos”
And o estudante “Paulo”  se autoavaliou com “MANA” em “Entender conceitos de requisitos”, “MPA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MANA” em Entender modelos de documentação, “MPA” em “Elicitar requisitos”
When eu for para a página de “Alunos discrepantes”
Then eu verei o campo de quantidade de alunos com avaliação discrepante com “0”
And o campo de porcentagem com “0%” 
And a lista de alunos discrepantes estará vazia

Scenario: Página "Alunos discrepantes" com apenas um aluno na lista (web)
Given estou logado como “professor”
And o estudante “João” tem conceitos “MA” em “Entender conceitos de requisitos”, “MPA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MANA” em Entender modelos de documentação, “MA” em “Elicitar requisitos”
And  o estudante “João” se autoavaliou com“MA” em “Entender conceitos de requisitos”, “MA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MA” em Entender modelos de documentação, “MA” em “Elicitar requisitos”
And a estudante “Maria” tem conceitos “MA” em “Entender conceitos de requisitos”, “MPA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MA” em Entender modelos de documentação, “MA” em “Elicitar requisitos”
And a estudante “Maria”  se autoavaliou “MPA” em “Entender conceitos de requisitos”, “MANA” em “Especificar requisitos com qualidade”, “MANA” em “Entender conceitos de gerência de configuração”, “MPA” em Entender modelos de documentação, “MANA” em “Elicitar requisitos”
And o estudante “Paulo” tem conceitos “MANA” em “Entender conceitos de requisitos”, “MPA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MANA” em Entender modelos de documentação, “MPA” em “Elicitar requisitos”
And o estudante “Paulo”  se autoavaliou com “MANA” em “Entender conceitos de requisitos”, “MPA” em “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de configuração”, “MANA” em Entender modelos de documentação, “MPA” em “Elicitar requisitos”
When eu for para a página de “Alunos discrepantes”
Then eu verei o campo de quantidade de alunos com avaliação discrepante com “1”
And o campo de porcentagem com “33.3%” 
And a lista de alunos discrepantes terá o nome "João"
And ao lado de cada nome de aluno terá um botão para ir a página "Comparação de Conceitos"
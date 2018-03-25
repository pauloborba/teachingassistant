Feature: auto-avaliação
As an aluno,
I want to atribuir os conceitos MA, MANA ou MPA a cada uma das metas avaliadas,
so that eu posso acompanhar meu progresso.

Scenario: preenchimento bem-sucedido
Given O aluno “João” não fez sua auto-avaliação
When O aluno “João” preenche “Entender conceitos de requisitos” com “MA”, “Especificar requisitos com qualidade” com “MANA” e “Entender conceitos de gerência de configuração com “MPA”.
Then o sistema armazena o preenchimento da auto-avaliação de “João”.

Scenario: preenchimento bem-sucedido
Given Eu estou na página de auto-avaliação
When Eu preencho os campos “Entender conceitos de requisitos” com “MA”, “Especificar requisitos com qualidade” com “MANA” e “Entender conceitos de gerência de configuração com “MPA”.
Then Eu vejo uma mensagem de confirmação
And Os conceitos atribuídos aparecem na minha lista de metas

Scenario: preenchimento mal-sucedido devido à ausência de conceitos
Given O aluno “Victor” não fez sua auto-avaliação
When O aluno “Victor” preenche “Entender conceitos de requisitos” com “MA” e “Especificar requisitos com qualidade” com “MANA”
And O aluno “Victor” não preenche “Entender conceitos de gerência de configuração”
Then O sistema não registra os conceitos atribuídos

Scenario: preenchimento mal-sucedido devido à ausência de conceitos
Given Eu estou na página de auto-avaliação
When Eu preencho os campos “Entender conceitos de requisitos” com “MA”, “Especificar requisitos com qualidade” com “MANA”
And Eu não preencho o campo “Entender conceitos de gerência de configuração”
Then Eu vejo uma mensagem de erro
And Sou redirecionado para a página "Página Inicial"

Scenario: nenhuma discrepância
Given Eu estou na lista de auto-avaliações dos alunos
And O aluno “João” possui “1” conceito de “5” superior aos meus
And O aluno “Victor” possui nenhum conceito superior aos meus
And O aluno “Ferraz” possui conceitos iguais aos meus
When Eu filtro a lista por auto-avaliações discrepantes
Then Eu vejo que a quantidade de alunos e o percentual de alunos com auto-avaliação discrepante é 0 e 0%, respectivamente
And Eu vejo que a lista está vazia

Scenario: discrepância
Given Eu estou na lista de auto-avaliação dos alunos
And O aluno “Coutinho” possui uma auto-avaliação discrepante 
And A lista possui “3” entradas
When Eu filtro a lista por auto-avaliações discrepantes
Then Eu vejo que a quantidade de alunos e o percentual de alunos com auto-avaliação discrepante é “1” e “33%”, respectivamente
And Eu vejo o aluno “Coutinho” na lista

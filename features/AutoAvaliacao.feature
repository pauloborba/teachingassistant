Feature: Auto-Avaliação
As a estudante
I want to visualizar as notas que o professor me atribuiu para cada conceito e cadastrar uma auto-avaliação sobre cada uma so that o professor possa ver caso minha avaliação sobre mim mesmo seja discrepante da dele.

Scenario: Auto-Avaliação bem-sucedida GUI
Given Eu estou logado como estudante
And Eu estou na tela de “cadastro auto-avaliação”.
When Eu seleciono as notas MPA, MPA e MA respectivamente para as três metas na linha de Auto-Avaliação.
And Eu clico no botão Finalizar.
Then Eu posso ver a mensagem de confirmação
And Eu posso ver que as informações cadastradas foram MPA, MPA e MA respectivamente para as três metas.

Scenario: Auto-Avaliação bem-sucedida 
Given Eu estou logado como estudante.
When Eu cadastro as notas MPA, MPA e MA respectivamente para as três metas em minha auto-avaliação.
Then As notas MPA, MPA e MA ficam salvas no sistema respectivamente para as três metas de minha auto-avaliação.

Scenario: Auto-Avaliação mal-sucedida GUI
Given Eu estou logado como estudante
And Eu estou na tela de “cadastro auto-avaliação”.
When Eu seleciono as notas MPA e MPA respectivamente para as duas primeiras metas na linha de Auto-Avaliação.
And Eu deixo o campo para a terceira nota não-preenchido.
And Eu clico no botão Finalizar.
Then Eu posso ver a mensagem de erro.
And Eu posso ver que o campo da terceira meta está vazio por meio de uma mensagem de erro.

Scenario: Auto-Avaliação mal-sucedida 
Given Eu estou logado como estudante.
When Eu cadastro as notas MPA e MPA respectivamente para as duas primeiras metas na linha de Auto-Avaliação sem cadastrar uma terceira nota.
Then Um erro é gerado.
And As notas não são salvas no sistema.
And O código de erro é registrado em um arquivo.

Scenario: Nenhuma discrepância Encontrada
Given Eu estou logado como professor
And Eu estou na tela de “Avaliações discrepantes”.
And Em auto-avaliação, um aluno tem conceito superior ao do professor em 1 de 5 metas
And Em auto-avaliação, um aluno só tem conceitos inferiores ao do professor
And Em auto-avaliação, um aluno só tem conceitos iguais aos do professor
When Eu olho a lista de alunos com avaliação discrepante.
Then Eu vejo a lista vazia.

Scenario: Uma discrepância Encontrada
Given Eu estou logado como professor
And Eu estou na tela de “Avaliações discrepantes”.
And Em auto-avaliação, o aluno "Jorge" tem conceito superior ao do professor em 4 de 5 metas
And Em auto-avaliação, um aluno só tem conceitos inferiores ao do professor
And Em auto-avaliação, um aluno só tem conceitos iguais aos do professor
When Eu olho a lista de alunos com avaliação discrepante.
Then Eu vejo na lista apenas o nome “Jorge”.

Scenario: Visualização de Percentual de Discrepância
Given Eu estou logado como professor
And Eu estou na tela de “Avaliações discrepantes”.
And Em auto-avaliação, o aluno "Jorge" tem conceito superior ao do professor em 4 de 5 metas
And Em auto-avaliação, um aluno só tem conceitos inferiores ao do professor
And Em auto-avaliação, um aluno só tem conceitos iguais aos do professor
When Eu olho a lista de alunos com avaliação discrepante.
Then Eu vejo na lista apenas o nome “Jorge”.
And Eu vejo o percentual de discrepâncias ao seu lado.
Feature: Auto-Avaliação
As a estudante
I want to visualizar as notas que o professor me atribuiu em cada conceito e cadastrar uma auto-avaliação sobre cada uma so that o professor possa ver caso minha avaliação sobre mim mesmo seja discrepante da dele.

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
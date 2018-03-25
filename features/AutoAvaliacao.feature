Scenario Auto-avaliação bem sucedida
	Given Eu estou logado no sistema com login "Abc@abc.com" e senha "123456"
	And Eu estou na página de auto-avaliação
	When Eu preencho minha auto-avaliação
	And Salvo os dados
	Then A auto-avaliação é salva

Scenario Preenchimento de Auto-avaliação mal sucedido
	Given Eu estou logado no sistema com login "Abc@abc.com" e senha "123456"
	And Eu estou na página de auto-avaliação
	When Eu preencho minha auto-avaliação
	And Deixo apenas uma avaliação faltando
	And Salvos os dados
	Then Sou redirecionado para página principal
	
Scenario Não há Discrepancia de auto-avaliaçao
	Given Eu estou logado no sistema como professor e na página de listar avaliações
	And Não há discrepancias
	When Eu clico no botão submeter
	Then As avaliações dos alunos são salvas com successo
	
Scenario Discrepancia de auto availiação
	Given Eu estou logado no sistema como professor
	And Eu esou na página de lista avaliações dos alunos
	When Existe uma discrepancia nas avaliações dos alunos
	And Eu clico no botão submeter
	Then As avaliações não são salvas com sucesso.
	
#Comentario de discrepancias

#Comment from master

Scenario Visualização percentual de Auto-Avaliação
	Given Eu estou logado como alunos
	And Estou na página de minhas auto-avaliações
	When Eu Seleciono na disciplina "ESS"
	Then Eu vejo o meu percentual de auto-avaliação para "ESS"



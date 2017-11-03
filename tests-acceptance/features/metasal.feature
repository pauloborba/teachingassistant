Feature: As a professor
         I want to register students
		 So that I can manage their learning goals
		 
Scenario: Autoavaliação com erro, pois falta o campo “Entender conceitos de gerência de configuração” (web)
Given eu estou na página “Autoavaliação”
And eu estiver logado com cpf "683"
When eu preencher o campo “Requisitos” com "MA"
And eu tentar enviar a autoavaliação
Then aparecerá uma mensagem de erro

Scenario: Nova Autoavaliação sem erro (web)
Given eu estou na página “Autoavaliação”
And eu estiver logado com cpf "683"
When eu preencher o campo “Requisitos” com "MA"
And eu preencher o campo “Gerência de Configuração" com "MA"
And eu tentar enviar a autoavaliação
Then serei redirecionado para a página inicial
And aparecerá uma mensagem de confirmação
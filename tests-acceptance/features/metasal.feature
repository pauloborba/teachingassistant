Feature: As a professor
         I want to register students
		 So that I can manage their learning goals
		 
Scenario: Autoavaliação com erro, pois falta o campo “Entender conceitos de gerência de configuração” (web)
Given eu estou na página autoavaliação
When eu estiver logado com cpf "683"
And eu preencher o campo "req" com "MA"
And eu tentar enviar a autoavaliação
Then aparecerá uma mensagem de erro

Scenario: Nova Autoavaliação sem erro (web)
Given eu estou na página autoavaliação
When eu estiver logado com cpf "683"
And eu preencher o campo "req" com "MA"
And eu preencher o campo "ger" com "MA"
And eu tentar enviar a autoavaliação
Then aparecerá uma mensagem de confirmação

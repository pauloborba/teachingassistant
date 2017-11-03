Feature: As a professor
         I want to register students
		 So that I can manage their learning goals
		 
Scenario: Nova Autoavaliação sem erro (web)
Given eu estou na página “Autoavaliação”
When eu preencher o campo “Entender conceitos de requisitos” com "MA"
And eu preencher o campo “Especificar requisitos com qualidade” com "MA"
And eu preencher o campo “Entender conceitos de gerência de configuração” com "MA"
And eu tentar enviar a autoavaliação
Then serei redirecionado para a página inicial
And aparecerá uma mensagem de confirmação


Scenario: Autoavaliação com erro, pois falta o campo “Especificar requisitos com qualidade” (web)
Given eu estou na página “Autoavaliação”
When eu preencher o campo “Entender conceitos de requisitos” com "MA"
And eu preencher o campo “Entender conceitos de gerência de configuração” com "MA"
And eu tentar enviar a autoavaliação
Then aparecerá uma mensagem de erro

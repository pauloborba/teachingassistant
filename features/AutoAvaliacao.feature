Feature: Auto-avaliação
As a: estudante da turma
I want to: Poder adicionar minha auto-avaliação para todas as metas
so that: Eu possa comparar a minha auto-avaliação com a do professor

GUI:
Scenario: auto-avaliação bem sucedida
Given: Eu estou na página de “Auto-avaliação”
And: Eu vejo que as metas “Entender conceitos de requisitos”, “Entender conceitos de gerência” e “Especificar requisitos com qualidade” na coluna “Aluno” não foram preenchidas
When: Eu preencho completamente a coluna “Aluno” com a auto-avaliação das metas  “Entender conceitos de requisitos” com “MPA”, “Entender conceitos de gerência” com “MANA” e “Especificar requisitos com qualidade” com  “MA” 		
And: Eu aperto o botão “Enviar”	
Then: Eu ainda estou na página de “Auto-avaliação”
And: Surge uma mensagem sinalizando que o procedimento foi bem sucedido
And: Agora é possível visualizar a coluna “Professor” com as notas das metas “Entender conceitos de requisitos”, “Entender conceitos de gerência” e “Especificar requisitos com qualidade” 
		
Service: 
Scenario: auto-avaliação bem sucedida
Given: o estudante “André Vasconcelos” não realizou a auto-avaliação ainda 
When: o estudante “André Vasconcelos” preenche a auto-avaliação das metas “Entender conceitos de requisitos” com “MPA”, “Entender conceitos de gerência” com “MANA” e “Especificar requisitos com qualidade” com  “MA” 
Then: o sistema avalia se foi completamente preenchido
And: a auto-avaliação do estudante “André Vasconcelos” é armazenada no sistema com as notas preenchidas para as metas “Entender conceitos de requisitos”, “Entender conceitos de gerência” e “Especificar requisitos com qualidade” 

GUI
Scenario: Auto-avaliação mal sucedida
Given: Eu estou na página de “Auto-avaliação”
And: Eu vejo que as metas “Entender conceitos de requisitos”, “Entender conceitos de gerência” e “Especificar requisitos com qualidade” na coluna “Aluno” não foram preenchidas
When: Eu preencho a coluna “Aluno” com a auto-avaliação das metas  “Entender conceitos de requisitos” com “MPA”, “Entender conceitos de gerência” com “MANA”
And: Não é atribuída nota para “Especificar requisitos com qualidade” 
Then:	Eu ainda estou na página de “Auto-avaliação”
And: Eu recebo uma mensagem informando o erro
And: Eu não consigo visualizar a coluna “Professor” com as notas para as metas “Entender conceitos de requisitos”, “Entender conceitos de gerência” e “Especificar requisitos com qualidade”


Service:
Scenario: Auto-avaliação mal sucedida
Given: o estudante “André Vasconcelos” não realizou a auto-avaliação ainda 
When: o estudante “André Vasconcelos” preenche a auto-avaliação das metas “Entender conceitos de requisitos” com “MPA”, “Entender conceitos de gerência” com “MANA”
And: Não é atribuída nota para “Especificar requisitos com qualidade” 
Then: O sistema avalia se o procedimento foi realizado corretamente
And: a auto-avaliação do estudante “André Vasconcelos” das metas “Entender conceitos de requisitos”, “Entender conceitos de gerência” e “Especificar requisitos com qualidade” não é armazenada no sistema

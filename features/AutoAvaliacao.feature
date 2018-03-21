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
Feature: Auto-avaliacao
As a Aluno
I want to Atribuir um conceito (MA, MPA, e MANA) a cada uma de minhas metas.
So that Minha auto-avaliação seja adicionada ao meu perfil em cada uma de minhas metas.

Scenario: Auto-avaliacao bem sucedida
Given Estou na página 'Auto-avaliação'.
When Eu envio as notas 'MA', 'MPA', e 'MA' para as metas 'Conceitos de requisitos', 'Especificar requisitos', e 'Gerência de configuração'.
Then Estou na página 'Detalhamento do aluno'.
And Posso ver que tenho as notas 'MA', 'MPA', e 'MA' para as metas 'Conceitos de requisitos', 'Especificar requisitos', e 'Gerência de configuração' respectivamente na coluna 'Auto-avaliação'.

Scenario: Auto-avaliação mal sucedida
Given Estou na página 'Auto-avaliação'.
When Eu envio as notas 'MA', e 'MPA' para as metas 'Conceitos de requisitos', e 'Especificar requisitos' mas deixo 'Gerência de configuração' em branco.
Then Ainda estou na página 'Auto-avaliação'.
And Posso ver uma mensagem de erro que diz 'Todos os campos devem ser preenchidos'.
Feature: Controle de metas
   Como professor resposável, 
   eu quero adicionar, editar e remover as metas associadas a diferentes turmas

Scenario: Adicionar meta com sucesso
Given estou na página de metas
And não posso ver a meta de nome "Aprender o conceito de git flow"
When preencho o nome da meta com "Aprender o conceito de git flow"
And confirmo a criação
Then posso ver a meta de nome "Aprender o conceito de git flow" listada apenas "1" vez

Scenario: Adicionar meta repetida
Given estou na página de metas
And posso ver a meta de nome "Aprender o conceito de git flow" listada apenas "1" vez
When preencho o nome da meta com "Aprender o conceito de git flow"
And confirmo a criação
Then posso ver a meta de nome "Aprender o conceito de git flow" listada apenas "1" vez

Scenario: Adicionar meta com nome inválido
Given estou na página de metas
When preencho o nome da meta com ""
And confirmo a criação
Then não posso ver a meta de nome ""

Scenario: Editar meta
Given estou na página de metas
When preencho o nome da meta com "Aprender a utilizar controle de versão"
And seleciono a opção "Editar" da meta de nome "Aprender o conceito de git flow"
Then posso ver a meta de nome "Aprender a utilizar controle de versão" listada apenas "1" vez
And não posso ver a meta de nome "Aprender o conceito de git flow" 

Scenario: Remover meta
Given estou na página de metas
When seleciono a opção "Remover" da meta de nome "Aprender o conceito de git flow"
Then não posso ver a meta de nome "Aprender o conceito de git flow"
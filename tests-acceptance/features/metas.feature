Feature: Controle de metas
   Como professor resposável, 
   eu  quero adicionar, editar e remover as metas associadas a diferentes turmas

Scenario: Adicionar meta com sucesso
Given estou na página da turma "ESS 2019.1"
And seleciono a opção "Metas"
When preencho o campo "Nome da nova meta" com "Aprender o conceito de git flow"
And confirmo a criação
Then posso ver a meta de nome "Aprender o conceito de git flow" listada 

Scenario: Adicionar meta repetida
Given estou na página da turma "ESS 2019.1"
And seleciono a opção "Metas"
And posso ver a meta de nome "Aprender o conceito de git flow" listada
When preencho o campo "Nome da nova meta" com "Aprender o conceito de git flow"
And confirmo a criação
Then posso ver a meta de nome "Aprender o conceito de git flow" listada apenas "1" vez

Scenario: Adicionar meta com nome inválido
Given estou na página da turma "ESS 2019.1"
And seleciono a opção "Metas"
When preencho o campo "Nome da nova meta" com nome ""
And confirmo a criação
Then não posso ver a meta de nome ""

Scenario: Editar meta
Given estou na página da turma "ESS 2019.1"
And seleciono a opção "Metas"
And seleciono a meta com nome "Aprender o conceito de git flow"
When preencho o campo "Nome da meta" com nome "Aprender a utilizar controle de versão"
And confirmo a edição
Then posso ver a meta de nome "prender a utilizar controle de versão" listada apenas "1" vez
And não posso ver a meta de nome "Aprender o conceito de git flow"

Scenario: Remover meta
Given estou na página da turma "ESS 2019.1"
And seleciono a opção "Metas"
And seleciono a meta com nome "Aprender o conceito de git flow"
When seleciono a opção "Remover"
And confirmo a remoção
Then não posso ver a meta de nome "Aprender o conceito de git flow"
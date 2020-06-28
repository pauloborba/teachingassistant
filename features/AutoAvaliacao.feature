Feature: [Auto-avaliação]
As a [Aluno]
I want to [Auto avaliar minhas metas acerca dos conceitos apresentados] - 0
So that [Eu posso comparar as notas que eu acho que é devida com a nota fornecida pelo professor]

Scenario: Inserção de dados para auto-avaliação

Given Estou logado como “aluno”
And Estou na sessão de “Notas” - modified
When Eu insiro as notas auto-avaliadas associadas a cada uma das metas
Then Eu consigo ver as notas que inseri na auto-avaliação

Scenario: Inserção de dados para auto-avaliação

Given Estou logado como “aluno”
And Estou na sessão de “Notas”
When Eu insiro as notas auto-avaliadas em apenas metade das disponíveis
Then Eu recebo um erro informando que não é possível deixar campos para auto-avaliações de metas vazios
Then Eu sou lançado para a página inicial
Then Eu recebo um alert perguntando se eu quero inserir as notas novamente

Scenario: Verificar discrepância

Given Estou logado como “professor administrador”
And Estou na sessão de “Alunos”
When Eu seleciono em “Discrepância”
Then Eu recebo uma janela que mostra as seguintes mensagens:
“Existem 0 avaliações discrepantes.”
“0% dos alunos têm auto-avaliações discrepantes.”
“A lista dos alunos com auto-avaliação discrepantes é vazia.”

Adicionando modificação 1
Adicionando modificação 2
Ajustando modificação 3

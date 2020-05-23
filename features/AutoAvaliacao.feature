Feature: [Auto-avaliação]
As a [Aluno]
I want to [Auto avaliar minhas metas acerca dos conceitos apresentados] - 0
So that [Eu posso comparar as notas que eu acho que é devida com a nota fornecida pelo professor]

Scenario: Inserção de dados para auto-avaliação

Given Estou logado como “aluno”
And Estou na sessão de “Notas” -0
When Eu insiro as notas auto-avaliadas associadas a cada uma das metas
Then Eu consigo ver as notas que inseri na auto-avaliação


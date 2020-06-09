Feature: auto-avaliação
As aluno da disciplina
I want to me auto-avaliar nas metas mencionadas
So that eu possa ver meu progresso na disciplina

Scenario GUI: Cliente enviando auto-avaliação
Given Estou logado como “vefg”
And Eu estou na página “auto-avaliação”
When Eu preencho todas as metas com “MPA”
And Eu clico no botão “avaliar”
Then Eu estou na página “auto-avaliação” com um alerta dizendo “Parabéns, auto-avaliação efetuada com sucesso”

Scenario Service: Armazenar auto-avaliação do aluno
Given O aluno “Victor” está cadastrado no sistema
And Esse aluno ainda não possui uma auto-avaliação
When O sistema recebe a auto-avaliação de “Victor”
And O sistema verifica como válida
Then O aluno “Victor” fica com uma auto-avaliação relacionada a ele salva no sistema

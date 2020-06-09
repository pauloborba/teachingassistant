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

Scenario GUI: Envio falho de auto-avaliação
Given Eu estou logado como “vefg”
And Eu estou na página “auto-avaliação”
And A meta “gerência de configuração” está sem avaliação
And Todas as outras metas estão avaliadas com “MA”
When Eu clico no botão “avaliar”
Then Eu estou na página “auto-avaliação” com um alerta dizendo “Todas as metas devem ser preenchidas antes do envio”

Scenario Service: Auto-avaliação inválida para armazenar no sistema
Given O aluno “Victor” está cadastrado no sistema
And Esse ainda não possui uma auto-avaliação
When O sistema recebe a auto-avaliação de “Victor”
And O sistema verifica como inválida
Then O aluno “Victor” continua sem uma auto-avaliação relacionada a ele salva no sistema

Scenario: Não há alunos discrepantes
    Given Eu estou logado como “professor”
    And Eu estou na página “discrepâncias”
    And Não há alunos discrepantes
    When Eu aperto na barra
    Then Eu vejo uma lista vazia
    And acima da lista aparece 0 aluno(s)(0%)
    
Scenario: Há alunos discrepantes
    Given Eu estou logado como “professor”
    And Eu estou na página “discrepâncias”
    And Há 1 aluno discrepante
    When Eu aperto na barra
    Then Uma lista aparece com o nome de “victor”
    And acima da lista aparece escrito 1 aluno(s)(33%)

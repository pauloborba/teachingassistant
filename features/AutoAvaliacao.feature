Feature: auto-avaliação
As a aluno
I want to avaliar a si mesmo em cada meta
so that poder comparar ambos os conceitos em cada meta

Scenario: auto-avaliação bem sucedida GUI
    Given Eu estou na pagina de auto-avaliação
    When Eu preencher todas as metas com algum conceito
    Then Aparece uma mensagem de sucesso

Scenario: auto-avaliação bem sucedida Controlador
    Given O sistema não tem auto-avaliação para o aluno "Luiz"
    When For criada uma auto-avaliação para o aluno "Luiz"
    And Todas as metas foram avaliadas
    Then A avaliação para o aluno "Luiz" é salva

Scenario: auto-avaliação mal sucedida GUI
    Given Eu estou na pagina de auto-avaliação
    When Eu não preencher todas as metas com algum conceito
    Then Aparece uma mensagem de erro

Scenario: auto-avaliação mal sucedida Controlador
    Given O sistema não tem auto-avaliação para o aluno "Luiz"
    When For criada uma auto-avaliação para o aluno "Luiz"
    And Alguma a meta não for avaliada
    Then A avaliação para o aluno "Luiz" é não é salva
    And Mudança solicitada pelos stakeholders

Scenario: Nenhum aluno com discrepância
    Given Eu estou na página de discrepância
    When Todos os alunos tiverem em suas auto-avaliações, todos os conceitos superiores ou todos os conceitos iguais ou só um único conceito inferior
    Then Aparece que não existem alunos com discrepância

Scenario: Alunos com discrepância
    Given Eu estou na página de discrepância
    When 1 entre 3 alunos tiver com discrepância em sua auto-avaliação
    Then Aparece na tela que só tem 1 único aluno com auto-avaliação discrepante, que 33% da turma teve discrepância e mostra uma lista com esse aluno na lista
    And alteração feita para corrigir erros

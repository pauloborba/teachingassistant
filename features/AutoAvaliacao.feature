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

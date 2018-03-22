Feature: auto-avaliação dos alunos
    As a professor
    I want to obter a auto-avaliação dos meus alunos
    so that eu saiba que conceitos eles acham que merecem

    Scenario: nova auto-avaliação web
        Given Eu estou na “tela de auto-avaliação”
        And Eu vejo as metas “a”, “b”, “c”, “d”, “e”
        When Eu avalio “MA” para a meta “a”, “MPA” para a meta “b”, “MPA” para a meta “c”, “MA” para a meta “d”, “MA” para a meta “e”
        And Eu envio a auto-avaliação
        Then Eu vejo uma mensagem de confirmação

    Scenario: nova auto-avaliação
        Given o sistema não possui a auto-avaliação do aluno “x” 
        And as metas são “a”, “b”, “c”, “d”, “e”
        When aluno envia a avaliação com “MA” para a meta “a”, “MPA” para a meta “b”, “MPA” para a meta “c”, “MA” para a meta “d”, “MA” para a meta “e”
        Then auto-avaliação do aluno “x" é salva no sistema
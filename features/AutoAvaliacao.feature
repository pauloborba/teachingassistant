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

    Scenario: auto-avaliação incompleta web
        Given Eu estou na “tela de auto-avaliação”
        And Eu vejo as metas “a”, “b”, “c”, “d”, “e”
        When Eu avalio “MA” para a meta “a”
        And Eu envio a auto-avaliação
        Then: Eu vejo uma mensagem de erro

    Scenario: auto-avaliação incompleta
        Given o sistema não possui a autoavaliação do aluno “y”
        And as metas são “a”, “b”, “c”, “d”, “e”
        When aluno envia avaliação “MPA” para meta “a”
        Then avaliação não é salva no sistema
        And alguma coisa que os stakeholders querem

    Scenario: professor autoavaliação web
        Given eu estou logado como “professor”
        When eu abro a “lista de notas”
        Then eu vejo que o aluno “Alberto” avaliou-se com os conceitos “MA”, “MPA”, “MPA”, “MANA” e “MANA” e eu avaliei-o com os conceitos “MPA”, “MPA”, “MPA”, “MANA” e “MANA”.
        And eu vejo que o aluno “Bernardo” avaliou-se com os conceitos “MPA”, “MPA”, “MPA”, “MPA” e “MPA” e eu avaliei-o com os conceitos “MA”, “MA”, “MA”, “MA” e “MA”
        And eu vejo que a aluna “Cláudia” avaliou-se com os conceitos “MA”, “MA”, “MA”, “MA” e “MA”, e eu avaliei-a com os conceitos “MA”, “MA”, “MA”, “MA” e “MA”

    Scenario: professor autoavaliação discrepância web
        Given eu estou logado como “professor”
        When eu abro a “lista de notas”
        Then eu vejo que o aluno “Danilo” avaliou-se com os conceitos “MPA” para a meta "a", “MPA” para a meta "b", “MPA” para a meta "c", “MPA” para a meta "d" e “MPA” para a meta "e" e eu avaliei-o com os conceitos “MPA” para a meta "a", “MPA” para a meta "b", “MPA” para a meta "c", “MANA” para a meta "d" e “MANA” para a meta "e", então está discrepante.
        And eu vejo que o aluno “Érico” avaliou-se com os conceitos “MPA” para a meta "a", “MPA” para a meta "b", “MPA” para a meta "c", “MANA” para a meta "d" e “MPA” para a meta "e" e eu avaliei-o com os conceitos  “MA” para a meta "a", “MA” para a meta "b", “MA” para a meta "c", “MPA” para a meta "d" e “MA” para a meta "e", não está discrepante
        And eu vejo que a aluna “Fábia” avaliou-se com os conceitos “MPA” para a meta "a", “MA” para a meta "b", “MA” para a meta "c", “MA” para a meta "d" e “MPA” para a meta "e", e eu avaliei-a com os conceitos  “MPA” para a meta "a", “MA” para a meta "b", “MA” para a meta "c", “MA” para a meta "d" e “MPA” para a meta "e", não está discrepante

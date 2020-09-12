Feature: auto-avaliação
    As a estudante da disciplina
    I want to visualizar os conceitos atribuídos pelo professor a mim na mesma tela em que me auto-avalio
    So that eu possa levar em consideração a nota do professor para decidir que conceito eu mereço para cada meta

    Scenario: auto-avaliação completa
        Given eu estou na página de auto-avaliação
        And eu consigo ver que o professor me atribuiu os conceitos "MA" e "MA" para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        And eu não vejo conceitos atribuídos por mim para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        When eu adiciono os conceitos "MA" e "MPA" para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        Then eu continuo na página de auto-avaliação
        And eu consigo ver que o professor me atribuiu os conceitos "MA" e "MA" para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        And eu consigo ver que eu me atribuí os conceitos "MA" e "MPA" para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"

    Scenario: auto-avaliação completa
        Given eu estou armazenado no sistema com os conceitos "MA" e "MA", atribuídos pelo professor, para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        And não há conceitos atribuídos por mim para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade" armazenados no sistema
        When eu adiciono os conceitos "MA" e "MPA" para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        Then eu estou armazenado no sistema com os conceitos "MA" e "MA", atribuídos pelo professor, e "MA" e "MPA", atribuídos por mim, para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"

    Scenario: auto-avaliação incompleta
        Given eu estou na página de auto-avaliação
        And eu consigo ver que o professor me atribuiu os conceitos "MA" e "MA" para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        And eu não vejo conceitos atribuídos por mim para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        When eu tento adicionar o conceito "MA" para a meta "Entender conceitos de Requisitos"
        Then eu vejo uma mensagem de erro sobre a auto-avaliação não ter sido completada
        And eu continuo na página de auto-avaliação
        And eu consigo ver que o professor me atribuiu os conceitos "MA" e "MA" para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        And eu não vejo conceitos atribuídos por mim para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"

    Scenario: auto-avaliação incompleta
        Given eu estou armazenado no sistema com os conceitos "MA" e "MA", atribuídos pelo professor, para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        And não há conceitos atribuídos por mim para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade" armazenados no sistema
        When eu tento adicionar o conceito "MA" para a meta "Entender conceitos de Requisitos"
        Then o sistema retorna um erro sobre a auto-avaliação não ter sido completada
        And eu estou armazenado no sistema com os conceitos "MA" e "MA", atribuídos pelo professor, para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade"
        And não há conceitos atribuídos por mim para as metas "Entender conceitos de requisitos" e "Especificar requisitos com qualidade" armazenados no sistema
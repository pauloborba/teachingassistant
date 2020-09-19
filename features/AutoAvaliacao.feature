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
        And mais alguma coisa

    Scenario: não há alunos com auto-avaliações discrepantes em 25% ou mais das metas avaliadas
        Given eu estou na página de visualização de conceitos
        And eu vejo o aluno "João das Neves" com auto-avaliação "MPA", "MA", "MPA", "MPA" e "MANA" e avaliação "MANA", "MA", "MPA", "MPA" e "MANA" para as metas estabelecidas
        And eu vejo a aluna "Raquel dos Santos" com auto-avaliação "MPA", "MPA", "MANA", "MPA" e "MANA" e avaliação "MA", "MA", "MA", "MA" e "MPA" para as metas estabelecidas
        And eu vejo a aluna "Rosa Maria" com auto-avaliação "MA", "MA", "MA", "MPA", "MPA" e avaliação "MA", "MA", "MA", "MPA" e "MPA" para as metas estabelecidas
        When eu solicito informação sobre quantidade, percentual e lista de alunos com auto-avaliações discrepantes
        Then eu estou na página de discrepâncias
        And eu vejo "0" para quantidade de alunos com auto-avaliações discrepantes
        And eu vejo "0%" para percentual de alunos com auto-avaliações discrepantes
        And eu vejo uma lista vazia de alunos com auto-avaliações discrepantes

    Scenario: há discrepância em 1 de 3 alunos
        Given eu estou na página de visualização de conceitos
        And eu vejo o aluno "João das Neves" com auto-avaliação "MPA", "MA", "MPA", "MPA" e "MANA" e avaliação "MANA", "MA", "MPA", "MPA" e "MANA" para as metas estabelecidas
        And eu vejo a aluna "Raquel dos Santos" com auto-avaliação "MPA", "MA", "MANA", "MPA" e "MANA" e avaliação "MANA", "MPA", "MA", "MA" e "MPA" para as metas estabelecidas
        And eu vejo a aluna "Rosa Maria" com auto-avaliação "MA", "MA", "MA", "MPA", "MPA" e avaliação "MA", "MA", "MA", "MPA" e "MPA" para as metas estabelecidas
        When eu solicito informação sobre quantidade, percentual e lista de alunos com auto-avaliações discrepantes
        Then eu estou na página de discrepâncias
        And eu vejo "1" para quantidade de alunos com auto-avaliações discrepantes
        And eu vejo "33,33%" para percentual de alunos com auto-avaliações discrepantes
        And eu vejo uma lista com a aluna "Raquel do Santos"

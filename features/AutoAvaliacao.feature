Feature: [auto-avaliação]
    As aluno
    I want to atribuir um conceito para cada uma das minhas metas
    So que eu possa inferir sobre uma possível injustiça que o professor venha a cometer.

Scenario: preenchimento das metas
    Given que estou na página de preenchimento de metas para auto-avaliação
    When eu preencho as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade e Entender conceitos de gerência de configuração” com os conceitos “MA, MPA e MANA”
    Then eu posso ver uma mensagem de confirmação

Scenario: armazenamento das metas
    Given que o sistema não tem a auto-avaliação do aluno “João Paulo” cadastrada no sistema
    When eu tento cadastrar os conceitos “MA, MPA e MANA” para as respectivas metas “Entender conceitos de requisitos, Especificar requisitos com qualidade e Entender conceitos de gerência de configuração” de “João Paulo”
    Then eu vejo as metas de “João Paulo” com os conceitos “MA, MPA, MANA” armazenadas no sistema

Scenario: preenchimento mal sucedido da auto-avaliação
    Given que estou na página de preenchimento de metas para auto-avaliação
    When eu preencho as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade e Entender conceitos de gerência de configuração” com os conceitos “MA, MPA e MARIA”
    Then eu posso ver uma mensagem de erro

Scenario: armazenamento mal sucedido da auto-avaliação
    Given que o sistema não tem a auto-avaliação do aluno “João Paulo” cadastrada no sistema
    When eu tento cadastrar os conceitos “MA, MPA e MARIA” para as respectivas metas “Entender conceitos de requisitos, Especificar requisitos com qualidade e Entender conceitos de gerência de configuração” de “João Paulo”
    Then eu não armazeno as metas de “João Paulo” no sistema
    And os valores da metas tem valor nulo

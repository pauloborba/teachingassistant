Feature: Auto-avaliação
    As a aluno de uma determinada turma
    I want to preencher um espaço de conceitos avaliados com metas 
    So that poder me auto avaliar com os conceitos que julgo ter atingido nas avaliações


Scenario: preenchimento bem sucedido da auto-avaliação
    Given o aluno “Lucas” está na página de “auto-avaliação”
    And existem as metas “Requisitos”, “Gerência de projetos” e “Refatoração” a serem preenchidas
    When ele preenche as metas mencionadas com “MA”, “MPA, e “MANA” respectivamente e confirma
    Then “Lucas” ainda está na página de “auto-avaliação”
    And recebe uma mensagem de confirmação 
    And consegue ver todas as metas preenchidas com sucesso

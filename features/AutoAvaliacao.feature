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

Scenario: preenchimento mal sucedido da auto-avaliação
    Given o aluno “Gabriel” está na página de “auto-avaliação”
    And existem as metas “Gerência de configuração”, “Projeto e implementação” e “Testes” a serem preenchidas
    When ele preenche “Projeto e implementação” e “Testes” com “MA” e “MA”, mas deixa de preencher a outra meta e confirma
    Then “Gabriel” ainda está na página de “auto-avaliação”
    And recebe uma mensagem de erro mostrando que ele não preencheu todas as metas corretamente 

Scenario: ausência de discrepâncias
    Given eu estou na página de “notas”
    And eu vejo o aluno “Alberto” com somente o conceito de auto-avaliação “Requisitos” superior ao da avaliação feita por mim
    And eu vejo o aluno “Caleb” com todos os conceitos de auto-avaliação inferiores ao da avaliação feita por mim
    When eu calculo o nível de discrepância dos alunos
    Then eu vejo uma mensagem que diz que não houveram discrepâncias entre os alunos

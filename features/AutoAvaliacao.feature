Feature: auto-avaliação
    As a estudante de "Engenharia de Software e Sistema"
    I want to preencher e modificar meus conceitos de auto-avaliações
    So that eu possa atribuir os conceitos que acho que mereço em cada uma das metas

# GUI Scenario
Scenario: preencher os conceitos de auto-avaliação de todas as metas 
    Given eu estou logada como estudante "Maria" no sistema SGM
    And eu estou na página "preenchimento de auto-avaliação"
    And eu vejo os conceitos atribuídos pelos meus professores
    And vejo os conceitos de auto-avaliação das metas em branco
    When eu preencho todas as metas com "MA"
    Then eu ainda estou na página "preenchimento de auto-avaliação"
    And eu consigo ver todos os conceitos de auto-avaliação das metas
    preenchidos com "MA"
    And eu consigo ver os conceitos atribuídos pelos professores

# Service Scenario:
Scenario: armazenar os conceitos de auto-avaliação de todas as metas 
Given eu vejo que o sistema não tem os conceitos de auto-avaliação das metas
And eu vejo os conceitos atribuídos pelos meus professores
When eu preencho todas as metas com "MA"
And peço para o sistema armazenar esses conceitos
Then o sistema retorna uma mensagem de confirmação de armazenamento
And eu consigo ver todos os conceitos de auto-avaliação das metas
preenchidos com "MA"
And eu ainda consigo ver os conceitos atribuídos pelos meus professores

# GUI Scenario:
Scenario:  inserir o conceito de auto-avaliação parcial
    Given eu estou logada como estudante "Maria" no sistema SGM
    And eu estou na página "preenchimento de auto-avaliação"
    And eu vejo os conceitos atribuídos pelos meus professores
    And vejo os conceitos de auto-avaliação das metas em branco
    When eu preencho a meta "Entender conceitos de requisito" com "MA"
    Then eu ainda estou na página "preenchimento de auto-avaliação"
    And eu vejo a mensagem de erro "não é possível auto-avaliação parcial"
    And eu vejo os conceitos de auto-avaliação das metas ainda em branco
    And eu consigo ver os conceitos atribuídos pelos professores

# Service Scenario:
Scenario: armazenar conceito de auto-avaliação parcial
    Given eu vejo que o sistema não tem os conceitos de auto-avaliação das metas
    When eu preencho a meta "Entender conceitos de requisito" com "MA"
    And peço para o sistema armazenar esse conceito
    Then o sistema retorna uma mensagem de erro
    And eu vejo que o sistema continua sem os conceitos de auto-avaliação das metas

#GUI Senario - Discrepancia
Scenario: visualizar dados sobre discrepância das avaliações dos conceitos
    Given eu estou logado como professor "Sérgio" no sistema SGM
    And eu estou na página "notas dos alunos"
    And eu vejo que a aluna "Maria" tem conceito superior aos atribuídos por mim em 1 de 5 metas
    And eu vejo que o aluno "João" tem apenas conceitos inferiores aos atribuídos por mim
    And eu vejo que o aluno "José" tem apenas conceitos iguais aos atribuídos por mim
    When eu clico para ver a lista de alunos com conceitos discrepantes 
    Then eu vejo que não há alunos com conceitos discrepantes
    And eu vejo uma lista vazia

Scenario: visualizar dados sobre discrepância das avaliações dos conceitos
    Given eu estou logado como professor "Sérgio" no sistema SGM
    And eu estou na página "notas dos alunos"
    And eu vejo que a lista de alunos tem "3" alunos
    When eu clico para ver a quantidade e lista de alunos com conceitos discrepantes 
    Then eu vejo que a quantidade de alunos com conceito discrepante é 1 de 3
    And eu vejo a lista com apenas o aluno "Miguel"



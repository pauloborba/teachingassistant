Feature: auto-avaliação
    As a estudante de "Engenharia de Software e Sistema"
    I want to preencher e modificar meus conceitos de auto-avaliações
    So that eu possa atribuir os conceitos que acho que mereço em cada uma das metas

# GUI Scenario:
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

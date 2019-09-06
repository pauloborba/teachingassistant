Feature: Auto-avaliação
As a Aluno
I want to adicionar conceitos referentes a cada uma das metas avaliadas pelo professor.
So that eu posso comparar discrepâncias entre meus conceitos e do professor.

Feature: Auto-avaliação
As a Professor
I want to ver a quantidade, o percentual e a lista de alunos com auto-avaliações discrepantes.
So that eu posso gerenciar as discrepâncias entre conceitos atribuídos aos alunos e suas respectivas auto-avaliações.




Cenario de GUI

Scenario: Nova auto-avaliação mal sucedida 
Given eu estou na página de preenchimento de conceitos
And preencho a meta “Entender conceitos de requisitos” com MA
And preencho a meta “Especificar requisitos com qualidade” com MPA
And não preencho a meta “Entender conceitos de gerência de configuração”
    When eu tento confirmar o preenchimento dos conceitos
    Then recebo uma mensagem de preenchimento mal sucedido
    And volto para página de preenchimento de conceitos
Cenário de serviço

Scenario: Nova auto-avaliação mal sucedida
Given estou logado como “Pedro”
And a meta “Entender conceitos de requisitos” está preenchida
And a meta “Especificar requisitos com qualidade” está preenchida
And a meta “Entender conceitos de gerência de configuração” não está preenchida

    When confirmo a auto-avaliação
Then o sistema retorna uma mensagem de preenchimento mal sucedido
And auto-avaliação não é armazenada no sistema





Cenario de GUI
Scenario: Nova auto-avaliação mal sucedida 
    Given eu estou na página de preenchimento de conceitos
    And preencho a meta “Entender conceitos de requisitos” com MA
And preencho a meta “Especificar requisitos com qualidade” com MPA
And não preencho a meta “Entender conceitos de gerência de configuração”
    When eu tento confirmar o preenchimento dos conceitos
    Then recebo uma mensagem de preenchimento mal sucedido
    And volto para página de preenchimento de conceitos
Cenário de serviço
Scenario: Nova auto-avaliação mal sucedida
    Given estou logado como “Pedro”
And a meta “Entender conceitos de requisitos” está preenchida
And a meta “Especificar requisitos com qualidade” está preenchida
And a meta “Entender conceitos de gerência de configuração” não está preenchida

    When confirmo a auto-avaliação
Then o sistema retorna uma mensagem de preenchimento mal sucedido
And auto-avaliação não é armazenada no sistema
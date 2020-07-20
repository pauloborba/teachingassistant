Feature: autoavaliação
    As a aluno matriculado na disciplina
    I want to realizar minha autoavaliação adicionando conceitos às metas
    So that eu possa avaliar meu desempenho e dedicação à disciplina

Scenario: preenchimento bem-sucedido da autoavaliação
    Given eu estou na página “Autoavaliação” logado como o aluno “Paulo”
    And eu vejo o conceito “MPA” para “Gerência de Requisitos” e o conceito “MPA” para “Gerência de Configuração” atribuídos pelo professor
    When eu preencho a meta “Gerência de Requisitos” com o conceito “MA” e a meta “Gerência de Configuração” com o conceito “MPA”
    And eu seleciono a opção de enviar
    Then eu vejo o conceito “MA” para “Gerência de Requisitos” e o conceito “MPA” para “Gerência de Configuração” atribuídos por “Paulo”
    And eu vejo o conceito “MPA” para “Gerência de Requisitos” e o conceito “MPA” para “Gerência de Configuração” atribuídos pelo professor

Scenario: preenchimento bem-sucedido da autoavaliação (serviços)
    Given o aluno “Paulo” está armazenado no sistema com o conceito “MPA” para a meta “Gerência de Requisitos” e o conceito “MPA” para a meta “Gerência de Configuração” atribuídos pelo professor
    When é enviado ao sistema os conceitos “MA” para “Gerência de Requisitos” e “MPA” para “Gerência de Configuração”
    Then o sistema retorna num código de confirmação “1”
    And o sistema armazena os conceitos “MA” para “Gerência de Requisitos” e “MPA” para “Gerência de Configuração” atribuídos pelo aluno “Paulo”

Scenario: preenchimento mal-sucedido da autoavaliação
    Given eu estou na página “Autoavaliação” logado como o aluno “Paulo”
    And eu vejo o conceito “MPA” para “Gerência de Requisitos” e o conceito “MPA” para “Gerência de Configuração” atribuídos pelo professor
    When eu preencho a meta “Gerência de Requisitos” com o conceito “MA”
    And eu seleciono a opção de enviar
    Then uma mensagem de erro é exibida
    And eu vejo o conceito “MPA” para “Gerência de Requisitos” e o conceito “MPA” para “Gerência de Configuração” atribuídos pelo professor

Scenario: preenchimento mal-sucedido da autoavaliação (serviço)
    Given o aluno “Paulo” está armazenado no sistema com o conceito “MPA” para a meta “Gerência de Requisitos” e o conceito “MPA” para a meta “Gerência de Configuração” atribuídos pelo professor
    When é enviado ao sistema os conceitos “MA” para “Gerência de Requisitos”
    Then o sistema retorna num código de confirmação “0”
    And o sistema não armazena o conceito “MA” para “Gerência de Requisitos” atribuído pelo aluno “Paulo”

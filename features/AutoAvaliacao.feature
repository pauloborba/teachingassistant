Feature: Auto-avaliação do estudante
        Como um aluno, eu desejo poder me auto-avaliar em comparação com os conceitos atribuídos pelo professor para que eu possa saber no que eu teria que melhorar.

    Cenário: Conceitos atribuídos
        Given: Eu estou na aba de preenchimento.
        When: Eu atribuo todos os conceitos.
        Then: Uma mensagem de confirmação (mostrando o sucesso) é mostrada.

    Cenário: Preenchimento sucedido
        Given: “Sujeito” não tem avaliação registrada.
        When: “Sujeito” preenche todos os conceitos.
        Then: Os conceitos são registrados.
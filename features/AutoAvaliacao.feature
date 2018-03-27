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

    Cenário: Conceitos não atribuídos
        Given: Eu estou na aba de preenchimento.
        When: Eu preencho o conceito de gerencia de configuração.
        And: Eu preencho o conceito de gerenção de projeto.
        Then: Uma mensagem de erro é mostrada solicitando o preenchimento dos conceitos restantes.
        And: Um atalho é mostrado para que o aluno possa preencher o conceito mais rapidamente.

    Cenário: Falha no preenchimento
        Given: “Sujeito” não tem avaliação registrada.
        When: “Sujeito” preenche os conceitos 2 e 3.
        Then: Os conceitos não são registrados.
        
    Cenário: Nenhuma discrepância 
        Given: Aluno X tem conceito inferior na meta 2.
        And: Aluno Y só tem conceitos superiores.
        And: Aluno Z só tem conceitos iguais.
        When: Eu vou para a visualização do balanceamento.
        Then: Eu vejo que existem 3 alunos equilibrados e nenhum discrepante.

    Cenário: Uma discrepância
        Given: Aluno X tem conceito inferior nas metas 2 e 4.
        And: Aluno Y só tem conceitos superiores.
        And: Aluno Z só tem conceitos iguais.
        When: Eu vou para a visualização do balanceamento.
        Then: Eu vejo que existem 2 alunos equilibrados e um discrepante na lista com o nome X.
        And: Uma mensagem aparece mostrando os contatos do aluno discrepante.

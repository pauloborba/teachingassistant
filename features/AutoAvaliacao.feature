Feature: Auto-avaliação
	As aluno que recebeu todos os conceitos
	I preciso adicionar conceitos do meu desempenho nas etapas.
	So o professor consiga manter controle sobre a minha ideia do que foi passado de forma indireta.

Scenario:  Preenchimento da autoavaliação bem sucedido.
    Given Estou na página de notas.
    And A autoavaliação está habilitada.
    When Eu preencho todas os conceitos e os envio.
    Then Recebo um aviso de sucesso.
    And A autoavaliação aparece junto aos conceitos.

Scenario:  Armazenamento da autoavaliação bem sucedido.
    Given Não há autoavaliação feita para o aluno “João Pedro” cujo CPF é “656.636.569.56”.
    When Eu submeto a autoavaliação de “João Pedro” para armazenamento.
    Then A autoavaliação é armazenada com sucesso.

Scenario:  Preenchimento da autoavaliação mal sucedido.
    Given Estou na página de notas
    And A autoavaliação está habilitada
    When Eu preencho todas menos a primeira etapa e submeto
    Then Recebo um aviso de falha
    And A autoavaliação continua habilitada na espera do término.

Scenario:  Armazenamento da autoavaliação mal sucedido.
    Given Não há autoavaliação feita para o aluno “João Pedro” cujo CPF é “656.636.569.56”
    When Eu submeto a autoavaliação de “João Pedro” para armazenamento faltando um conceito
    Then A autoavaliação não é armazenada e um erro é disparado.
    And .....

Scenario:  Verificar discrepâncias de autoavaliação.
    Given Estou na página de turma
    And A autoavaliação foi preenchida por todos
    When Eu faço requisição para visualizar alunos com discrepâncias
    And .... ++++ ---- //// \\\\
    Then Recebo um aviso de não existência
    And A página não se altera.

Scenario:  Existem discrepâncias de autoavaliação.
    Given Estou na página de turma
    And A autoavaliação foi preenchida por todos
    When Eu faço requisição para visualizar alunos com discrepâncias
    And .... ++++ ---- //// \\\\
    Then Recebo um aviso de existência
    And A página se altera para mostrar alunos com discrepância.

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



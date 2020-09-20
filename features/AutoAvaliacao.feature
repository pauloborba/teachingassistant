Feature: auto-avaliacao de alunos.
As a: aluno.
I want to: registrar as minhas auto-avaliações para cada meta de aprendizado de uma determinada disciplina.
So that: o professor consiga ter acesso a essas auto-avaliacoes.

Scenario: preenchimento bem sucedido de auto-avaliação.
Given: dado que o aluno esteja na página de auto-avaliação da disciplina “ESS” onde existem as metas ‘Conceitos de Requisitos’ e ‘Especificação de Requisitos’, para as quais não existem notas de auto-avaliação registradas.
When: quando o aluno preenche as notas ‘MA’ e ‘MPA’ para ambas as metas ‘Conceitos de Requisitos’ e ‘Especificação de Requisitos’, respectivamente.
Then: apareça uma mensagem de confirmação das auto-avaliações na tela.

Scenario: preenchimento bem sucedido de auto-avaliação.
Given: que o aluno ‘Maria Julia‘ de CPF ‘1234’ esteja cadastrado na memória do sistema.
And: esteja na página de auto-avaliação da disciplina “ESS” onde existem as metas ‘Conceitos de Requisitos’ e ‘Especificação de Requisitos’, para as quais não existem notas de auto-avaliação registradas na memória do sistema.
When: quando o aluno ‘Maria Julia’ preenche as notas ‘MA’ e ‘MPA’ para ambas as metas ‘Conceitos de Requisitos’ e ‘Especificação de Requisitos’, respectivamente.
Then: as notas de auto-avaliação ‘MA’ para 	‘Conceitos de Requisitos’ e ‘MPA’ para ‘Especificação de Requisitos’ do aluno ‘Maria Julia’ sejam armazenadas na memória do sistema.
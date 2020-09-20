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

Scenario: preenchimento mal sucedido de auto-avaliação.
Given: dado que o aluno esteja na página de auto-avaliação da disciplina ‘ESS’ onde existem as metas ‘Conceitos de Requisitos’ e ‘Especificação de Requisitos’, para as quais não existem notas de auto-avaliação registradas.
When: quando o aluno preenche apenas a nota ‘MPA’ para a meta ‘Conceitos de Requisitos’.
Then: apareça uma mensagem de erro na tela avisando que as auto-avaliações não foram concluídas.

Scenario: preenchimento mal sucedido de auto-avaliação.
Given: que o aluno ‘Maria Júlia’ de CPF ‘1234’ esteja cadastrado na memória do sistema.
And: esteja na página de auto-avaliação da disciplina ‘ESS’ onde existem as metas ‘Conceitos de Requisitos’ e ‘Especificação de Requisitos’, para as quais não existem notas de auto-avaliação registradas na memória do sistema.
When: quando o aluno preenche apenas a nota ‘MPA’ para a meta ‘Conceitos de Requisitos’.
Then: o aluno ‘Maria Júlia’ de CPF ‘1234’ continue sem nenhuma meta de auto-avaliação registrada na memória do sistema.

Scenario: não há discrepâncias nas auto-avaliações dos alunos.
Given: o professor da disciplina ESS está na página de análise das auto-avaliações dos alunos 
And: a disciplina possui cinco metas de aprendizado ‘Conceitos de Requisitos’ , ‘Especificação de Requisitos’, ‘Gerência de Projeto’, ‘Identificação de Erros’ e ‘Gerência de Versões’.
And: os alunos ‘Ana’, ‘Maria’ e ‘João’ já realizaram suas auto-avaliações com sucesso em todas as metas.
And: dado que o aluno ‘Ana’ registrou ‘MA’, ‘MPA’, ‘MPA’, ‘MPA’ e ‘MPA’ para as metas, respectivamente e o professor registrou ‘MPA’, ‘MPA’, ‘MPA’, ‘MPA’ e ‘MPA’.
And: o aluno ‘Maria’ registrou ‘MPA’, ‘MPA’, ‘MPA’, ‘MPA’ e ‘MPA’ para as metas, respectivamente e o professor registrou ‘MA’, ‘MA’, ‘MA’, ‘MA’ e ‘MA’.
And: o aluno ‘João’ registrou ‘MPA’, ‘MPA’, ‘MPA’, ‘MPA’ e ‘MPA’ para as metas, respectivamente e o professor registrou ‘MPA’, ‘MPA’, ‘MPA’, ‘MPA’ e ‘MPA’.
When: quando o professor solicitar a análise.
Then: aparecer na tela que não há alunos com discrepâncias.
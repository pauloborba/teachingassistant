Feature: Auto-avaliacao
	As a: aluno do sistema
	I want to: avaliar o meu desempenho
	So that: eu posso comparar a minha avaliacao com a do professor
Scenario: Aluno se auto-avalia
	Given: O aluno está na página de “auto-avaliacao” logado com nome "aluno_x" e senha "123"
	And: o aluno pode ver a lista de metas com os campos “Entender_motivacao_e_conceitos_de_requisitos”, “Entender_motivacao_e_conceitos_de_gerencia_de_configuracao”, “Entender_motivacao_e_conceitos_de_gerencia_de_projetos”, “Entender_motivacao_e_conceitos_de_testes” e “Entender_motivacao_e_conceitos_de_implementacao”
	When: O aluno tenta submeter sua avaliacao com “MANA” em “Entender_motivacao_e_conceitos_de_requisitos”, “MPA” em “Entender_motivacao_e_conceitos_de_gerencia_de_configuracao”, “MPA” em “Entender_motivacao_e_conceitos_de_gerencia_de_projetos”, “MA” em “Entender_motivacao_e_conceitos_de_testes” e “MA” em “Entender_motivacao_e_conceitos_de_implementacao”
	Then: O aluno pode ver no campo correspondente a sua auto-avaliacao “MANA” em “Entender_motivacao_e_conceitos_de_requisitos”, “MPA” em “Entender_motivacao_e_conceitos_de_gerencia_de_configuracao”, “MPA” em “Entender_motivacao_e_conceitos_de_gerencia_de_projetos”, “MA” em “Entender_motivacao_e_conceitos_de_testes” e “MA” em “Entender_motivacao_e_conceitos_de_implementacao”
Scenario: Tentativa de auto-avaliacao incompleta
	Given: O aluno está na página de “auto-avaliacao”
	And: o aluno pode ver na lista de metas os campos “Entender_motivacao_e_conceitos_de_requisitos”, “Entender_motivacao_e_conceitos_de_gerencia_de_configuracao”, “Entender_motivacao_e_conceitos_de_gerencia_de_projetos”, “Entender_motivacao_e_conceitos_de_testes” e “Entender_motivacao_e_conceitos_de_implementacao”
	When: O aluno tenta submeter sua avaliacao com “” em “Entender_motivacao_e_conceitos_de_requisitos”, “MPA” em “Entender_motivacao_e_conceitos_de_gerencia_de_configuracao”, “MPA” em “Entender_motivacao_e_conceitos_de_gerencia_de_projetos”, “MA” em “Entender_motivacao_e_conceitos_de_testes” e “MA” em “Entender_motivacao_e_conceitos_de_implementacao”
	Then: O aluno recebe uma mensagem de que a auto-avaliacao nao foi realizada
	And: O aluno permanece na página de “auto-avaliacao”

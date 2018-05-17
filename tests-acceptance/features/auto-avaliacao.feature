Feature: Auto-avaliacao
	As a: aluno do sistema
	I want to: avaliar o meu desempenho
	So that: eu posso comparar a minha avaliacao com a do professor
Scenario: Aluno se auto-avalia
	Given: O aluno está na página de “auto-avaliacao”
	And: o aluno pode ver a lista de metas com os campos “Entender motivacao e conceitos de requisitos”, “Entender motivacao e conceitos de gerencia de configuracao”, “Entender motivacao e conceitos de gerencia de projetos”, “Entender motivacao e conceitos de testes” e “Entender motivacao e conceitos de implementacao”
	When: O aluno tenta submeter sua avaliacao com “MANA” em “Entender motivacao e conceitos de requisitos”, “MPA” em “Entender motivacao e conceitos de gerencia de configuracao”, “MPA” em “Entender motivacao e conceitos de gerencia de projetos”, “MA” em “Entender motivacao e conceitos de testes” e “MA” em “Entender motivacao e conceitos de implementacao”
	Then: O aluno pode ver no campo correspondente a sua auto-avaliacao “MPA” na célula correspondente a “Entender conceitos de Requisitos”, “MA” na célula correspondente a “Especificar requisitos com qualidade” e “MA” na célula correspondente a “Entender conceitos de Gerencia de Configuracao”
Scenario: Tentativa de auto-avaliacao incompleta
	Given: O aluno está na página de “auto-avaliacao”
	And: o aluno pode ver na lista de metas os campos “Entender motivacao e conceitos de requisitos”, “Entender motivacao e conceitos de gerencia de configuracao”, “Entender motivacao e conceitos de gerencia de projetos”, “Entender motivacao e conceitos de testes” e “Entender motivacao e conceitos de implementacao”
	When: O aluno tenta submeter sua avaliacao com “” em “Entender motivacao e conceitos de requisitos”, “MPA” em “Entender motivacao e conceitos de gerencia de configuracao”, “MPA” em “Entender motivacao e conceitos de gerencia de projetos”, “MA” em “Entender motivacao e conceitos de testes” e “MA” em “Entender motivacao e conceitos de implementacao”
	Then: O aluno recebe uma mensagem de que a auto-avaliacao nao foi realizada
	And: O aluno permanece na página de “auto-avaliacao”

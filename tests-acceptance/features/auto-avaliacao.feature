Feature: Auto-avaliacao
	As a: aluno do sistema
	I want to: avaliar o meu desempenho
	So that: eu posso comparar a minha avaliação com a do professor
Scenario: Aluno se auto-avalia
	Given: O aluno está na página de “auto-avaliacao”
	And: o aluno pode ver a lista de metas com os campos “Entender conceitos de Requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de Gerência de Configuração”
	When: O aluno tenta submeter sua avaliação com “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “MA” em “Entender conceitos de Gerência de Configuração”
	Then: O aluno pode ver no campo correspondente a sua auto-avaliacao “MPA” na célula correspondente a “Entender conceitos de Requisitos”, “MA” na célula correspondente a “Especificar requisitos com qualidade” e “MA” na célula correspondente a “Entender conceitos de Gerência de Configuração”
Scenario: Tentativa de auto-avaliacao incompleta
	Given: O aluno está na página de “auto-avaliacao”
	And: o aluno pode ver na lista de metas os campos “Entender conceitos de Requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de Gerência de Configuração”
	When: O aluno tenta submeter sua avaliação com “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “” em “Entender conceitos de Gerência de Configuração”
	Then: O aluno recebe uma mensagem de que a auto-avaliacao não foi realizada
	And: O aluno permanece na página de “auto-avaliacao”

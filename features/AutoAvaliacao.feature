Feature: Auto-Avaliação
	As a: Aluno do sistema
	I want to: avaliar o meu desempenho
	So that: eu posso comparar a minha avaliação com a do professor

	Cenário de GUI:
Scenario: Aluno se auto-avalia
Given: O aluno “x” está na página de “auto-avaliação”
And: o sistema tem as metas “Entender conceitos de Requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de Gerência de Configuração”
When: O aluno tenta submeter sua avaliação com “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “MA” em “Entender conceitos de Gerência de Configuração”
Then: O aluno “x” pode ver no campo correspondente a sua auto-avaliação “MPA” na célula correspondente a “Entender conceitos de Requisitos”, “MA” na célula correspondente a “Especificar requisitos com qualidade” e “MA” na célula correspondente a “Entender conceitos de Gerência de Configuração”
Cenário de Servico:
Scenario: Autoavaliação bem-sucedida no sistema
Given: O aluno “x” ainda não submeteu sua auto-avaliação
When: O aluno “x” submete sua avaliação com  “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “MA” em “Entender conceitos de Gerência de Configuração”
Then: a auto-avaliação do aluno “x” é gravada no sistema

Cenário de GUI:
Scenario: Tentativa de auto-avaliação incompleta
Given: O aluno “x” está na página de “auto-avaliação”
And: o sistema tem as metas “Entender conceitos de Requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de Gerência de Configuração”
When: O aluno tenta submeter sua avaliação com “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “” em “Entender conceitos de Gerência de Configuração”
Then: O aluno recebe uma mensagem de que a auto-avaliação não foi realizada
And: O aluno permanece na mesma página
Cenário de Serviço:
Scenario: Auto-avaliação já realizada não é repetida
Given: O aluno “x” já submeteu sua auto-avaliação
When: O aluno “x” submete sua avaliação com  “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “MA” em “Entender conceitos de Gerência de Configuração”
Then: a auto-avaliação do aluno “x” não é gravada no sistema


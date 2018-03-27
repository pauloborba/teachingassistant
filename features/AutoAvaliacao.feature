Feature: Auto-Avalia��o
	As a: Aluno do sistema
	I want to: avaliar o meu desempenho
	So that: eu posso comparar a minha avalia��o com a do professor

	Cen�rio de GUI:
Scenario: Aluno se auto-avalia
Given: O aluno �x� est� na p�gina de �auto-avalia��o�
And: o sistema tem as metas �Entender conceitos de Requisitos�, �Especificar requisitos com qualidade� e �Entender conceitos de Ger�ncia de Configura��o�
When: O aluno tenta submeter sua avalia��o com �MPA� em �Entender conceitos de Requisitos�, �MA� em �Especificar requisitos com qualidade� e �MA� em �Entender conceitos de Ger�ncia de Configura��o�
Then: O aluno �x� pode ver no campo correspondente a sua auto-avalia��o �MPA� na c�lula correspondente a �Entender conceitos de Requisitos�, �MA� na c�lula correspondente a �Especificar requisitos com qualidade� e �MA� na c�lula correspondente a �Entender conceitos de Ger�ncia de Configura��o�
Cen�rio de Servico:
Scenario: Autoavalia��o bem-sucedida no sistema
Given: O aluno �x� ainda n�o submeteu sua auto-avalia��o
When: O aluno �x� submete sua avalia��o com  �MPA� em �Entender conceitos de Requisitos�, �MA� em �Especificar requisitos com qualidade� e �MA� em �Entender conceitos de Ger�ncia de Configura��o�
Then: a auto-avalia��o do aluno �x� � gravada no sistema

Cen�rio de GUI:
Scenario: Tentativa de auto-avalia��o incompleta
Given: O aluno �x� est� na p�gina de �auto-avalia��o�
And: o sistema tem as metas �Entender conceitos de Requisitos�, �Especificar requisitos com qualidade� e �Entender conceitos de Ger�ncia de Configura��o�
When: O aluno tenta submeter sua avalia��o com �MPA� em �Entender conceitos de Requisitos�, �MA� em �Especificar requisitos com qualidade� e �� em �Entender conceitos de Ger�ncia de Configura��o�
Then: O aluno recebe uma mensagem de que a auto-avalia��o n�o foi realizada
And: O aluno permanece na mesma p�gina
Cen�rio de Servi�o:
Scenario: Auto-avalia��o j� realizada n�o � repetida
Given: O aluno �x� j� submeteu sua auto-avalia��o
When: O aluno �x� submete sua avalia��o com  �MPA� em �Entender conceitos de Requisitos�, �MA� em �Especificar requisitos com qualidade� e �MA� em �Entender conceitos de Ger�ncia de Configura��o�
Then: a auto-avalia��o do aluno �x� n�o � gravada no sistema


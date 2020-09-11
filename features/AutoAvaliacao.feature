Feature: Auto-avaliação.
		As a: aluno.
		I want to: atribuir conceitos a todas as metas dadas em sala de aula.
		So that: avaliar o desempenho do aluno pelo próprio aluno.

CONTROLADOR-
Scenario: Dar conceitos as metas.
Given: As metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” ainda estão sem conceitos.
When: O conceito “MA”  for atribuído à meta “Entender conceitos de requisitos”.
And: O conceito “MPA”  for atribuído à meta “Especificar requisitos com qualidade”.
And: O conceito “MANA” for atribuído na meta “Entender conceitos de gerência de configuração”.		
	Then: O sistema deve aceitar as atribuições.

		GUI-
Scenario: conciliar conceitos a metas.
		Given: O aluno “Thiago” está na página de auto-avaliações.
		And: O aluno “Thiago” está preenchendo a sua auto-avaliação.
When: O aluno “Thiago” atribuiu o conceito “MA” na meta “Entender conceitos de requisitos”. 
		Then: Um sinal de “feito” deve ser exibido.
And: A meta “Entender conceitos de requisitos” tem que ser vista na tela com a nota “MA”.


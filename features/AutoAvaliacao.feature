Feature: auto-avalia��o
As a: Aluno da turma de ESS
I want to: realizar e enviar minha auto-avalia��o
So that: eu posso medir meu desempenho no curso
Given: O sistema apresenta as seguintes metas 
�Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia  de configura��o�
And os conceitos �MA�, �MPA�, �MANA�
		When: O aluno �X� enviou a sua auto-avalia��o com 
�MA� em �Entender conceitos de requisitos�
		And  �MA� em �Especificar requisitos com qualidade� 
And �MA� em �Entender conceitos de ger�ncia  de configura��o�
		Then: O sistema armazenou a auto-avalia��o do aluno �X� com 
�MA� em �Entender conceitos de requisitos�
		And  �MA� em �Especificar requisitos com qualidade� 
And �MA� em �Entender conceitos de ger�ncia  de configura��o�
Feature: auto-avalia��o
As a: Aluno da turma de ESS
I want to: realizar e enviar minha auto-avalia��o
So that: eu posso medir meu desempenho no curso

Cen�rio de Controlador: Preenchimento bem sucedido da auto-avalia��o 
Given: O sistema apresenta as seguintes metas 
�Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia  de configura��o�
And apresenta os conceitos �MA�, �MPA�, �MANA�
When: A auto-avalia��o do aluno �X� � enviada com 
�MA� em �Entender conceitos de requisitos�
And  �MA� em �Especificar requisitos com qualidade� 
And �MA� em �Entender conceitos de ger�ncia  de configura��o�
Then: O sistema armazena a auto-avalia��o do aluno �X� com 
�MA� em �Entender conceitos de requisitos�
And  �MA� em �Especificar requisitos com qualidade� 
And �MA� em �Entender conceitos de ger�ncia  de configura��o�

Cen�rio de GUI: Preenchimento bem sucedido da auto-avalia��o
Given: O aluno est� na p�gina de �Auto-Avalia��o�
And a p�gina de �Auto-avalia��o� apresenta campos com as seguintes metas �Entender conceitos de requisitos�, 
�Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia  de configura��o�
When: O aluno envia a auto-avalia��o com 
�MA� no campo �Entender conceitos de requisitos�
And  �MA� no campo �Especificar requisitos com qualidade� 
And �MA� no campo �Entender conceitos de ger�ncia de configura��o�
Then: O aluno v� uma mensagem de envio bem sucedida
		
Cen�rio de Controlador: Preenchimento mal sucedido da auto-avalia��o devido a aus�ncia de conceitos para pelo menos uma meta
Given: O sistema apresenta as seguintes metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, 
�Entender conceitos de ger�ncia  de configura��o�
And os conceitos �MA�, �MPA�, �MANA�
When: O aluno �X� enviou a sua auto-avalia��o com
�MA� em �Entender conceitos de requisitos�
And  �MA� em �Especificar requisitos com qualidade� 
And n�o preencheu a meta �Entender conceitos de ger�ncia  de configura��o� com algum conceito
Then: O sistema n�o armazena a auto-avalia��o do aluno �X�

Cen�rio de GUI: Preenchimento mal sucedido da auto-avalia��o
Given: O aluno est� na p�gina de �Auto-Avalia��o�
And a p�gina de �Auto-avalia��o� apresenta campos com as seguintes metas �Entender conceitos de requisitos�, 
�Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia  de configura��o�
When: O aluno envia a auto-avalia��o com
�MA� no campo �Entender conceitos de requisitos�
And  �MA� no campo �Especificar requisitos com qualidade� 
And n�o preencheu o campo da meta �Entender conceitos de ger�ncia  de configura��o� com algum conceito
Then: O aluno v� uma mensagem de erro
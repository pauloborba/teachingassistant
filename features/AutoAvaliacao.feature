Feature: auto-avaliação
As a: Aluno da turma de ESS
I want to: realizar e enviar minha auto-avaliação
So that: eu posso medir meu desempenho no curso

Cenário de Controlador: Preenchimento bem sucedido da auto-avaliação 
Given: O sistema apresenta as seguintes metas 
“Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência  de configuração”
And apresenta os conceitos “MA”, “MPA”, “MANA”
When: A auto-avaliação do aluno “X” é enviada com 
“MA” em “Entender conceitos de requisitos”
And  “MA” em “Especificar requisitos com qualidade” 
And ”MA” em “Entender conceitos de gerência  de configuração”
Then: O sistema armazena a auto-avaliação do aluno “X” com 
“MA” em “Entender conceitos de requisitos”
And  “MA” em “Especificar requisitos com qualidade” 
And ”MA” em “Entender conceitos de gerência  de configuração”

Cenário de GUI: Preenchimento bem sucedido da auto-avaliação
Given: O aluno está na página de “Auto-Avaliação”
And a página de “Auto-avaliação” apresenta campos com as seguintes metas “Entender conceitos de requisitos”, 
“Especificar requisitos com qualidade”, “Entender conceitos de gerência  de configuração”
When: O aluno envia a auto-avaliação com 
“MA” no campo “Entender conceitos de requisitos”
And  “MA” no campo “Especificar requisitos com qualidade” 
And ”MA” no campo “Entender conceitos de gerência de configuração”
Then: O aluno vê uma mensagem de envio bem sucedida
		
Cenário de Controlador: Preenchimento mal sucedido da auto-avaliação devido a ausência de conceitos para pelo menos uma meta
Given: O sistema apresenta as seguintes metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, 
“Entender conceitos de gerência  de configuração”
And os conceitos “MA”, “MPA”, “MANA”
When: O aluno “X” enviou a sua auto-avaliação com
“MA” em “Entender conceitos de requisitos”
And  “MA” em “Especificar requisitos com qualidade” 
And não preencheu a meta “Entender conceitos de gerência  de configuração” com algum conceito
Then: O sistema não armazena a auto-avaliação do aluno “X”

Cenário de GUI: Preenchimento mal sucedido da auto-avaliação
Given: O aluno está na página de “Auto-Avaliação”
And a página de “Auto-avaliação” apresenta campos com as seguintes metas “Entender conceitos de requisitos”, 
“Especificar requisitos com qualidade”, “Entender conceitos de gerência  de configuração”
When: O aluno envia a auto-avaliação com
“MA” no campo “Entender conceitos de requisitos”
And  “MA” no campo “Especificar requisitos com qualidade” 
And não preencheu o campo da meta “Entender conceitos de gerência  de configuração” com algum conceito
Then: O aluno vê uma mensagem de erro
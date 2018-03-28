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
And o sistema mantém as auto-avaliações registradas anteriormente

Cenário de GUI: Preenchimento mal sucedido da auto-avaliação
Given: O aluno está na página de “Auto-Avaliação”
And a página de “Auto-avaliação” apresenta campos com as seguintes metas “Entender conceitos de requisitos”, 
“Especificar requisitos com qualidade”, “Entender conceitos de gerência  de configuração”
When: O aluno envia a auto-avaliação com
“MA” no campo “Entender conceitos de requisitos”
And  “MA” no campo “Especificar requisitos com qualidade” 
And não preencheu o campo da meta “Entender conceitos de gerência  de configuração” com algum conceito
Then: O aluno vê uma mensagem de erro
And o aluno vê a página de "Auto-Avaliação” com todos os campos em branco

Cenário de GUI: Não há nenhuma discrepância na auto-avaliação
Given: O professor está na página de “Resultado” da auto-avaliação de seus 3 alunos
And: O aluno “A” atribuiu “MPA” no campo
“Entender conceitos de requisitos”, “MA” no campo “Especificar requisitos com qualidade”, “MA” no campo “Entender conceitos de gerência de Configuração”
And: O professor atribuiu ao aluno “A” “MA” no campo
“Entender conceitos de requisitos”, “MPA” no campo “Especificar requisitos com qualidade”, “MA” no campo “Entender conceitos de gerência de Configuração” 
And: O aluno “B” atribuiu “MA” no campo
“Entender conceitos de requisitos”, “MA” no campo “Especificar requisitos com qualidade”, “MA” no campo “Entender conceitos de gerência de Configuração”
And: O professor atribuiu ao aluno “B” “MPA” no campo
“Entender conceitos de requisitos”, “MA” no campo “Especificar requisitos com qualidade”, “MPA” em “Entender conceitos de gerência de Configuração” 
And: O aluno “C” atribuiu “MA” no campo
“Entender conceitos de requisitos”, “MPA” no campo “Especificar requisitos com qualidade”, “MA” no campo “Entender conceitos de gerência de Configuração”
And: O professor atribuiu ao aluno “C” “MA” no campo
“Entender conceitos de requisitos”, “MA” no campo “Especificar requisitos no campo com qualidade”, “MPA” em “Entender conceitos de gerência de Configuração” 
When: O professor busca pela lista de alunos com auto-avaliações discrepantes
Then: O professor vê nenhum aluno na lista de alunos com auto-avaliações discrepantes

Cenário de GUI: Há discrepância em 1 de 3 alunos na auto-avaliação
Given: O professor está na página de “Resultado” da auto-avaliação de seus 3 alunos
And: O aluno “A” atribuiu “MPA” no campo
“Entender conceitos de requisitos”, “MPA” no campo 
“Especificar  requisitos com qualidade”, “MA” no campo “Entender conceitos de gerência de Configuração”
And: O professor atribuiu ao aluno “A” “MANA” no campo
“Entender conceitos de requisitos”, “MANA” no campo “Especificar requisitos com qualidade”, “MANA” no campo “Entender conceitos de gerência de Configuração” 
And: O aluno “B” atribuiu “MA” no campo
“Entender conceitos de requisitos”, “MA” no campo “Especificar requisitos com qualidade”, “MA” no campo “Entender conceitos de gerência de Configuração”
And: O professor atribuiu ao aluno “B” “MPA” no campo
“Entender conceitos de requisitos”, “MA” no campo “Especificar requisitos com qualidade”, “MPA” no campo “Entender conceitos de gerência de Configuração” 
And: O aluno “C” atribuiu “MA” no campo "X"
“Entender conceitos de requisitos”, “MPA” no campo “Especificar requisitos com qualidade”, “MA” no campo “Entender conceitos de gerência de Configuração”
And: O professor atribuiu ao aluno “C” “MA” no campo "X"
“Entender conceitos de requisitos”, “MA” no campo “Especificar requisitos com qualidade”, “MPA” no campo “Entender conceitos de gerência de Configuração” 
When: O professor busca pela lista de alunos com auto-avaliaçõesAA
discrepante
Then: O professor vê apenas o aluno “A” na lista de alunos com auto-avaliações discrepantes 
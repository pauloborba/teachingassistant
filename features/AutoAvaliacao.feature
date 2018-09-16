
Feature: Auto-avaliação
As a student
I want to atribuir conceitos (MA, MPA, MANA) às minhas metas em um determinado assunto, comparando-os com os atribuídos pelo professor. 
So that eu possa avaliar meu progresso na disciplina.

-Preenchimento bem sucedido-

Cenário de Serviço
Scenario: Preenchimento da Auto-avaliação de conceitos
Given: o aluno ainda não avaliou seus conceitos no assunto de requisitos.
And os conceitos em requisitos são  “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”.
When: o aluno atribui respectivamente as metas “MA”, “MPA”, “MA” aos conceitos “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”.
Then: o sistema registra essas metas.

Cenário de GUI
Scenario: Preenchimento da Auto-Avaliação
Given: Estou na pagina de auto-avaliação de requisitos
When: Eu tento atribuir respectivamente “MA, “MPA”, “MA” aos conceitos “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”.
And: Seleciono “salvar”
Then: Eu vejo uma mensagem de confirmação

-Preenchimento mal sucedido-

Cenário de Serviço
Scenario: Preenchimento da Auto-avaliação
Given: o sistema não possui a auto-avaliação de conceitos do usuário “Andrey”.
And: os conceitos em requisitos são  “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”.
When: “Andrey” atribui respectivamente as metas “MA”, “MPA” aos conceitos “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”.
Then: o sistema não registra essas metas.

Cenário de GUI
Scenario: Preenchimento da Auto-Avaliação
Given: Estou na pagina de auto-avaliação de requisitos
And: “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” ainda não foram avaliados.
When: Eu tento atribuir respectivamente “MA, “MPA” aos conceitos “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”.
And: Seleciono “salvar”
Then: Eu vejo uma mensagem de erro

Cenário sem discrepâncias
Scenario: Verificar Discrepâncias de metas
Given: Estou na planilha de conceitos do assunto de requisitos
And: o aluno Andrey têm preenchido “MA”, “MA”, “MA”, “MA”, “MA” respectivamente para as metas 1 a 5, enquanto a avaliação dada foi  “MA”, “MA”, “MA”, “MA”, “MPA”.
And: o aluno Saulo tem “MPA”, “MPA”, “MPA”, “MPA”, “MPA” respectivamente para as metas 1 a 5, enquanto a avaliação dada foi  “MA”, “MA”, “MA”, “MA”, “MA”
And: o aluno Jorge tem “MANA”, “MANA”, “MANA”, “MANA”, “MANA” para a avaliação dada de “MANA”, “MANA”, “MANA”, “MANA”, “MANA”.
When: eu seleciono “Ir para discrepâncias”
Then: Eu vejo uma planilha em branco.


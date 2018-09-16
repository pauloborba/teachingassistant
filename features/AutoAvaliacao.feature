
Feature: Auto-avaliação
As a student
I want to atribuir conceitos (MA, MPA, MANA) às minhas metas em um determinado assunto, comparando-os com os atribuídos pelo professor. 
So that eu possa avaliar meu progresso na disciplina.

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


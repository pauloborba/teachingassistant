Feature: Autoavaliação
As a aluno da disciplina
I want to adicionar meus conceitos nas metas dessa disciplina e visualizar os conceitos atribuídos pelo professor
So that seja possível calcular minha nota final
Scenario: Preenchimento de autoavaliação bem sucedido
Given Eu estou na página “Perfil do aluno”
And Eu vejo as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração” preenchidas com “-, -, -” para autoavaliações e com “MANA, MPA, MA” para avaliações do professor. 
When Eu adiciono “MANA, MPA, MA” para as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração”
Then Eu ainda estou na página “Meu perfil”
And Eu vejo as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração” preenchidas com “MA, MPA, MANA” como autoavaliações e “MA, MPA, MANA” como avaliações do professor

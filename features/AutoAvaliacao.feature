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
Scenario: Preenchimento de autoavaliação mal sucedido devido à falta de conceitos
Given Eu estou na página “Meu perfil”
And Eu vejo as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração” preenchidas com “-, -, -” para autoavaliações e com “MANA, MPA, MA” para avaliações do professor.
When Eu adiciono “MA, MPA, -” para as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração”
Then Eu ainda estou na página “Meu perfil”
And Eu vejo uma mensagem de erro
And as metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração” preenchidas com “-, -, -” para autoavaliações e com “MANA, MPA, MA” para avaliações do professor.
And Eu ainda estou na página "Meu perfil"
Scenario: Não há cenários discrepantes
Given estou na página “SGM” como “Professor”
And “José” tem autoavaliações “MA, MPA, MANA, MA, MPA” e eu o avaliei com “MPA, MPA, MANA, MA, MPA” nas metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração, Especificar gerência de configuração com qualidade, Entender conceitos de projeto e implementação”
And “Vinicius” tem autoavaliações “MPA, MPA, MANA, MPA, MPA” e eu o avaliei com “MA, MA, MPA, MA, MA” nas metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração, Especificar gerência de configuração com qualidade, Entender conceitos de projeto e implementação”
And “Alexandra” tem autoavaliações “MA, MPA, MANA, MA, MPA” e eu o avaliei com “MA, MPA, MANA, MA, MPA” nas metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração, Especificar gerência de configuração com qualidade, Entender conceitos de projeto e implementação”
When vou para página “avaliações discrepantes”  
Then eu vejo que existem “0” alunos com discrepância
And vejo “0%” na porcentagem de discrepantes
And é mostrado uma lista vazia
Scenario: Há aluno com conceitos discrepantes
Given estou na página “SGM” como “Professor”
And “Toni” tem autoavaliações “MA, MA, MANA, MA, MPA” e eu o avaliei com “MPA, MPA, MANA, MA, MPA” nas metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração, Especificar gerência de configuração com qualidade, Entender conceitos de projeto e implementação”
And “Scala” tem autoavaliações “MPA, MPA, MANA, MPA, MPA” e eu o avaliei com “MA, MA, MPA, MA, MA” nas metas “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração, Especificar gerência de configuração com qualidade, Entender conceitos de projeto e implementação”
And “Alexandra” tem autoavaliações “MA, MPA, MANA, MA, MPA” e eu o avaliei com “Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração, Especificar gerência de configuração com qualidade, Entender conceitos de projeto e implementação”
When mudo para página “avaliações discrepantes”
Then eu vejo que existem “1” alunos com discrepância
And vejo “33%” na porcentagem de discrepantes
And é mostrado uma lista com seguintes alunos “Toni”
Modificação 3

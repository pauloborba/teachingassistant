Feature: auto-avaliaÃ§ao de metas das disciplinas do Cin [para rebase no master]
As a Aluno
I want to atribuir conceito (MANA, MA ou MPA) a todas as metas de uma dada disciplina
so that dado que o professor preencheu sua avaliaÃ§ao, preencherei as minhas consequentemente e poderei fazer uma comparaÃ§ao com as notas do professor e as minhas.

Scenario: AutoavaliaÃ§ao das metas de uma dada disciplina bem sucedido
Given eu loguei com meu cpf "12312312312" e nome "Juliano"
And que estou na tela de auto-avaliaÃ§ao da disciplina "ESS"
And o professor jÃ¡ preencheu suas notas
When eu preencho minhas notas, em "Requisitos ", com "MA",  "GerÃªncia de ConfiguraÃ§ao ", com  "MA" e em "ValidaÃ§ao e Teste" com "MA"
Then finalizo minha avaliaÃ§ao 
And recebo uma mensagem de confirmaÃ§ao
And vejo minha notas "MA", "MA", "MA" em "Requisitos", "GerÃªncia de ConfiguraÃ§ao" e  "ValidaÃ§ao e Teste" da disciplina "ESS" na tela de auto-avaliaÃ§ao

Scenario: AutoavaliaÃ§ao das metas de uma dada disciplina  mal sucedido
Given eu loguei com meu cpf "12312312312" e nome "Juliano"
And que estou na tela de auto-avalia�ao da disciplina "ESS"
And o professor j� preencheu suas notas
When eu preencho parcialmente minhas notas, em  "Requisitos ", com "MA",  "Ger�ncia de Configura�ao ", com  "MA" e "Valida�ao e Teste" com "" 
Then tento finalizar minha avalia�ao (Supondo que faltou esse then - Roteiro Gerencia de Configuracao)
And recebo uma mensagem de que falta preencher uma nota
And que estou na tela de auto-avaliaÃ§ao da disciplina "ESS"
And o professor jÃ¡ preencheu suas notas
When eu preencho parcialmente minhas notas, em  "Requisitos ", com "MA",  "GerÃªncia de ConfiguraÃ§ao ", com  "MA" e "ValidaÃ§ao e Teste" com "" 
Then tento finalizar minha avaliaÃ§ao 
And recebo uma mensagem de que falta preencher uma nota

Scenario: AutoavaliaÃ§Ã£o das metas de uma dada disciplina 
Given eu loguei com meu cpf â12312312312â e nome âJulianoâ
And que estou na tela de de  auto-avaliaÃ§Ã£o da disciplina âESSâ
And o aluno jÃ¡ preencheu suas notas
When eu preencho minhas notas, em âRequisitos â, com âMANAâ,  âGerÃªncia de ConfiguraÃ§Ã£o â, com  âMAâ e em âValidaÃ§Ã£o e Testeâ com âMAâ para o aluno âJuliano1â,
em âRequisitos â, com âMAâ,  âGerÃªncia de ConfiguraÃ§Ã£o â, com  âMAâ e em âValidaÃ§Ã£o e Testeâ com âMAâ para o aluno âJuliano2â,
em âRequisitos â, com âMAâ,  âGerÃªncia de ConfiguraÃ§Ã£o â, com  âMAâ e em âValidaÃ§Ã£o e Testeâ com âMAâ para o aluno âJuliano3â,
Then finalizo minha avaliaÃ§Ã£o 
And recebo uma mensagem de confirmaÃ§Ã£o
And vejo as notas que preenchi âMAâ, âMAâ, âMAâ em âRequisitosâ, âGerÃªncia de ConfiguraÃ§Ã£oâ e  âValidaÃ§Ã£o e Testeâ da disciplina âESSâ na tela de auto-avaliaÃ§Ã£o
And vejo as notas que o âJuliano1â preencheu âMAâ, âMAâ, âMAâ em âRequisitosâ, âGerÃªncia de ConfiguraÃ§Ã£oâ e  âValidaÃ§Ã£o e Testeâ da disciplina âESSâ na tela de auto-avaliaÃ§Ã£o
And vejo as notas que o âJuliano2â preencheu âMANAâ, âMANAâ, âMANAâ em âRequisitosâ, âGerÃªncia de ConfiguraÃ§Ã£oâ e  âValidaÃ§Ã£o e Testeâ da disciplina âESSâ na tela de auto-avaliaÃ§Ã£o
And vejo as notas que o âJuliano3â preencheu âMAâ, âMAâ, âMAâ em âRequisitosâ, âGerÃªncia de ConfiguraÃ§Ã£oâ e  âValidaÃ§Ã£o e Testeâ da disciplina âESSâ na tela de auto-avaliaÃ§Ã£o


Scenario: Discrepância  da Autoavaliação das metas de uma dada disciplina [supondo que eu corrigi o que o stakeholders pediram aqui]
Given eu loguei com meu cpf “12312312312” e nome “Juliano”
And que estou na tela Discrepância de auto-avaliação da disciplina “ESS”
And os alunos ja preencheram as notas anteriormente
When eu seleciono a opcao “refresh” 
Then vejo que o “juliano1” tem “27%” de discrepancia entre as minhas notas e as que ele preencheu 
And vejo que o “juliano2” tem “17%” de discrepancia entre as minhas notas e as que ele preencheu
And vejo que o “juliano3” tem “7%” de discrepancia entre as minhas notas e as que ele preencheu
Then eu vejo que um "juliano1" está com discrepancia e "Juliano2" e "Juliano3" não


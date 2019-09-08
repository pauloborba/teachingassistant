**Feature**: Auto-avaliação
Como um aluno,
Eu desejo poder realizar uma auto-avaliação, atribuindo conceitos para cada uma das metas atribuídas a mim,
A fim de que o professor possa ter noção da consciência dos alunos quanto a seu desempenho.

GUI
Scenario: realizando auto-avaliação
Dado que eu estou na “tela de preenchimento dos conceitos”,
E a minha auto-avaliação não foi realizada ainda,
E as metas de “Elicitar requisitos” e “Gerenciar projetos” foram atribuídas a mim,
Quando eu atribuir “MA” para a meta de “Elicitar requisitos” e “MPA” para a meta de “Gerenciar projetos”,
Então eu estarei na “tela de visualização dos conceitos”,
E eu poderei ver os conceitos “MA” para a meta de “Elicitar requisitos” e “MPA” para a meta de “Gerenciar projetos”, atribuídos por mim.

SERVIÇO
Scenario: realizando auto-avaliação
Dado que o aluno “Carlos Chagas” está cadastrado no sistema
E que a sua auto-avaliação não foi realizada ainda,
E as metas de “Elicitar requisitos” e “Gerenciar projetos” foram atribuídas a ele
Quando eu solicitar ao sistema que atribuia “MA” para a meta de “Elicitar requisitos” e “MPA” para a meta de “Gerenciar projetos”,
Então, estarão atribuídos os conceitos “MA” para a meta de “Elicitar requisitos” e “MPA” para a meta de “Gerenciar projetos”, para o aluno “Carlos Chagas”.

GUI
Scenario: realizando auto-avaliação incompleta
Dado que estou na “tela de preenchimento dos conceitos”
E minha auto-avaliação não foi realizada ainda,
E as metas de “Elicitar Requisitos” e de “Gerência de Configurações” foram atribuídas a mim,
Quando eu submeter a auto-avaliação sem um conceito atribuído à meta “Elicitar requisitos”,
Então nenhum conceito é atribuído às minhas metas
E eu vejo um alerta de erro na tela,
E eu vejo uma mensagem de que o conceito para a meta de “Elicitar requisitos” não foi preenchido

SERVIÇO
Scenario: realizando auto-avaliação incompleta
Dado que o aluno “Carlos Chagas” está cadastrado no sistema
E sua auto-avaliação não foi realizada ainda,
E as metas de “Elicitar Requisitos”, “Gerência de Configurações” e “Elaborar Testes” foram atribuídas ao aluno “Carlos Chagas”
Quando eu solicitar ao sistema que atribua o conceito “MPA, -, MA” para as metas de “Elicitar Requisitos”, “Gerência de Configurações” e “Elaborar Testes”, respectivamente
Então, o sistema retorna uma mensagem de erro,
E o aluno “Carlos Chagas” não terá nenhum conceito atribuído em sua auto-avaliação.

Scenario: não há discrepâncias na auto-avaliação
Dado que eu estou na tela de “auto-avaliações discrepantes”
E que apenas os alunos “Marcos”, “André” e “Paula” estão cadastrados no sistema
E o aluno “Marcos” atribuiu “MA, MA, MA, MPA, MA” para as metas estabelecidas, em sua auto-avaliação.
E o aluno “Marcos” recebeu “MA, MA, MA, MPA, MANA” para as metas estabelecidas, na avaliação do professor.
E o aluno “André” atribuiu “MANA, MANA, MPA, MANA, MPA” para as metas estabelecidas, em sua auto-avaliação.
E o aluno “André” recebeu “MPA, MPA, MA, MPA, MA” para as metas estabelecidas, na avaliação do professor.
E a aluna “Paula” atribuiu “MA, MPA, MA, MPA, MA” para as metas estabelecidas, em sua auto-avaliação.
E a aluna “Paula” recebeu “MA, MPA, MA, MPA, MA” para as metas estabelecidas, na avaliação do professor.
Então, eu vejo uma listagem vazia, alertando que não há alunos com avaliações discrepantes,
E eu vejo que um total de 0 aluno têm avaliações discrepantes.
E eu vejo que 0% dos alunos têm avaliações discrepantes.

Senario: há discrepâncias na auto-avaliação
Dado que eu estou na tela de “avaliação dos alunos”
E que apenas os alunos “Marcos”, “André” e “Paula” estão cadastrados no sistema
E o aluno “Marcos” atribuiu “MA, MA, MA, MPA, MANA” para as metas de “Entender requisitos”, “Especificar requisitos”, Gerência de configuração”, “Gerência de Projetos” e “Testes”, respectivamente, em sua auto-avaliação.
E o aluno “Marcos” recebeu “MPA, MANA, MA, MANA, MANA” para as metas de “Entender requisitos”, “Especificar requisitos”, Gerência de configuração”, “Gerência de Projetos” e “Testes”, respectivamente, na avaliação do professor.
E o aluno “André” atribuiu “MA, MA, MA, MPA, MANA” para as metas de “Entender requisitos”, “Especificar requisitos”, Gerência de configuração”, “Gerência de Projetos” e “Testes”, respectivamente, em sua auto-avaliação.
E o aluno “André” recebeu “MA, MA, MA, MA, MPA” para as metas de “Entender requisitos”, “Especificar requisitos”, Gerência de configuração”, “Gerência de Projetos” e “Testes”, respectivamente, na avaliação do professor.
E a aluna “Paula” atribuiu “MPA, MANA, MA, MPA, MANA” para as metas de “Entender requisitos”, “Especificar requisitos”, Gerência de configuração”, “Gerência de Projetos” e “Testes”, respectivamente, em sua auto-avaliação.
E a aluna “Paula” recebeu “MPA, MPA, MA, MPA, MA” para as metas de “Entender requisitos”, “Especificar requisitos”, Gerência de configuração”, “Gerência de Projetos” e “Testes”, respectivamente, na avaliação do professor.
Então, eu vejo uma listagem que mostra os alunos com avaliações discrepantes, contendo o aluno “Marcos”,
E eu vejo que um total de 1 aluno têm avaliações discrepantes.
E eu vejo que 33,3% dos alunos têm avaliações discrepantes.

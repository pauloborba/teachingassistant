**Feature**: Auto-avaliação
Como um aluno,
Eu desejo poder realizar uma auto-avaliação, atribuindo conceitos para cada uma das metas atribuídas a mim,
A fim de que o professor possa ter noção da consciência dos alunos quanto a seu desempenho.

GUI
Cenário: realizando auto-avaliação
Dado que eu estou na “tela de preenchimento dos conceitos”,
E a minha auto-avaliação não foi realizada ainda,
E as metas de “Elicitar requisitos” e “Gerenciar projetos” foram atribuídas a mim,
Quando eu atribuir “MA” para a meta de “Elicitar requisitos” e “MPA” para a meta de “Gerenciar projetos”,
Então eu estarei na “tela de visualização dos conceitos”,
E eu poderei ver os conceitos “MA” para a meta de “Elicitar requisitos” e “MPA” para a meta de “Gerenciar projetos”, atribuídos por mim.

SERVIÇO
Cenário: realizando auto-avaliação
Dado que o aluno “Carlos Chagas” está cadastrado no sistema
E que a sua auto-avaliação não foi realizada ainda,
E as metas de “Elicitar requisitos” e “Gerenciar projetos” foram atribuídas a ele
Quando eu solicitar ao sistema que atribuia “MA” para a meta de “Elicitar requisitos” e “MPA” para a meta de “Gerenciar projetos”,
Então, estarão atribuídos os conceitos “MA” para a meta de “Elicitar requisitos” e “MPA” para a meta de “Gerenciar projetos”, para o aluno “Carlos Chagas”.
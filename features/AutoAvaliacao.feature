
Como um aluno,
Eu quero adicionar notas de MA MPA e MANA,
Para que eu possa me auto avaliar.

GUI Cenário: Adicionar uma auto avaliação corretamente.
Dado que eu estou na página de “notas do aluno”.
E eu vejo que a minha “auto avaliação” ainda não foi feita.
Quando eu Adiciono todas as notas de “auto avaliação”,
Então eu vejo um “info” confirmando que a auto avaliação foi feita,
E depois eu vejo a página de “notas do aluno” com a seção de “auto 
avaliação” preenchida.
Service Cenário: Adicionar uma auto avaliação corretamente.
Dado que o aluno adiciona todas as notas de “auto avaliação” 
corretamente.
Quando eu peço ao sistema para armazenar as notas no campo de “auto 
avaliação”,
Então o sistema salva corretamente as informações.
Então...
GUI Cenário: vendo porcentagem quando não há discrepâncias.
Dado que eu estou na página de Discrepâncias, 
E eu estou vendo 0 alunos em “Quantidade”,
Quando eu mudo para “Porcentagem”,
Então eu vejo 0% na tela
GUI Cenário: vendo a lista de alunos quando não há discrepâncias.
Dado que eu estou na página de Discrepâncias, 
E eu estou vendo 0 alunos em “Quantidade”,
Quando eu mudo para “Lista”,
Então não aparece nenhum aluno na tela.
GUI Cenário: vendo porcentagem quando há discrepâncias.
Dado que eu estou na página de Discrepâncias, 
E eu estou vendo 1 aluno em “Quantidade”,
Quando eu mudo para “Porcentagem”,
Então eu vejo 33% na tela
GUI Cenário: vendo a lista de alunos quando há discrepâncias.
Dado que eu estou na página de Discrepâncias, 
E eu estou vendo 1 aluno em “Quantidade”,
Quando eu mudo para “Lista”,
Então o nome desse aluno na tela.


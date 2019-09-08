Feature: Auto-avaliacao de alunos
Como um aluno quero poder me auto avaliar no fim do semestre na disciplina ESS
Para poder comparar meu aprendizado com a avaliação dada pelo professor


Cenário: Preenchimento bem sucedido da autoavaliação
Given que eu estou logado como aluno
And  estou na página de autoavaliação
When seleciono a opcao “ autoavaliação”
Then recebo uma mensagem de confirmação no preenchimento da  autoavaliação

Cenario: turma sem discrepancia
Given: eu estou logado na página de notas dos alunos
When eu seleciono a opcao “alunos discrepantes”
Then aparece a mensagem “sem alunos com notas discrepantes”
abc



Cenario: turma com discrepancia
Given: eu estou logado na página de notas dos alunos
When eu seleciono a opcao “alunos discrepantes”
Then eu estou na pagina “alunos com notas discrepantes”

123

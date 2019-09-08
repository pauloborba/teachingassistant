Feature: Auto-avaliacao de alunos
Como um aluno quero poder me auto avaliar no fim do semestre na disciplina ESS
Para poder comparar meu aprendizado com a avaliação dada pelo professor


Cenário: Preenchimento bem sucedido da autoavaliação
Given que eu estou logado como aluno
And  estou na página de autoavaliação
When seleciono a opcao “ autoavaliação”
Then recebo uma mensagem de confirmação no preenchimento da  autoavaliação
And eu tenho acesso a página de minhas notas com as notas atualizadas


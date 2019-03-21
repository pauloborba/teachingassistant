Feature: auto-avaliação
As um aluno da disciplina 
Eu quero preencher os campos de auto-avaliação em cada uma das metas
Then eu posso ver os conceitos atribuídos pelo professor na mesma tela de preenchimento da auto-avaliação



Cenário de GUI:
Cenário : preenchimento bem sucedido
Given que eu estou na página de auto-avaliação
And vejo todos os campos não preenchidos
When eu preencher todos os campos de auto-avaliação
And seleciono para confirmar
Then uma mensagem de preenchimento bem sucedido aparece

Cenário de GUI:
Cenário : preenchimento mal sucedido
Given que eu estou na página de auto-avaliação
And vejo todos os campos não preenchidos
When eu preencher os campos de auto-avaliação
And eu deixei pelo menos um campo em branco
Then uma mensagem de preenchimento má sucedido aparece
Then

Cenário de GUI:
Cenário: Nenhuma discrepância
Given estou na página de auto-avaliações discrepantes
And preencho o conceitos das metas de trës alunos
And um aluno tem conceito superior ao do professor em 1 de 5 metas
And outro tem conceito inferior ao do professor em 1 de 5 metas
And outro tem conceitos iguais ao do professor
When seleciono mostrar auto-avaliações discrepantes
Then vejo uma mensagem dizendo que não existe nenhuma auto-avaliação discrepante aparece

Cenário: Discrepância em 1 de 3 alunos
Given estou na página de auto-avaliações discrepantes
And preencho o coneitos das metas de trës alunos
And um de três alunos possui conceito superior em pelo menos 25% das metas avaliadas em relação aos conceitos atribuídos pelo professor
When seleciono para mostrar auto-avaliações discrepantes
Then vejo esse aluno na lista
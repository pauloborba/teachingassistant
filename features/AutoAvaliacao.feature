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


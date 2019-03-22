As a Estudante.
I want to capaz de me avaliar nas metas especificadas.
So that eu possa comparar minha avaliação com a do professor.

Scenario: Auto-avaliação completa.
Given Eu estou logado como estudante “João” 
And estou na página “página de autoavaliação”.
When Eu preencho o campo “Student” das atividades “Goal 1”  com “MPA”.
And  Eu preencho o campo “Student” da atividade “Goal 2” com “MA”.
And Eu preencho o campo “Student” da atividade “Goal 3” com “MA”.
And Completo minha autoavaliação.
Then Aparece a mensagem “Self-Evaluation is Complete” na página “página de autoavaliação”.

Scenario: Auto-avaliação completa.
Given O estudante “João” está logado
And Está na “página de autoavaliação”
When A atividade “Goal 1” no campo reservado para “Student” é preenchidas pelo usuário “João”.
And A atividade “Goal 2” no campo reservado para “Student” é preenchidas pelo usuário “João”.
And A atividade “Goal 3” no campo reservado para “Student” é preenchidas pelo usuário “João”.
And O usuário confirma a autoavaliação
Then O sistema salva a avaliação. 

Scenario: Auto-avaliação incompleta.
Given Eu estou logado como estudante “Cristiano”
And estou na “página de autoavaliação”.
When Avalio o campo “Student” de “Goal 1” com “MPA”
And Avalio o campo “Student” de “Goal 2” com “MPA”
And O campo “Student” de “Goal 3” permanece em branco.
And Completo minha autoavaliação
Then Aparece a mensagem de erro “Incomplete Self-Evaluation” na página “página de autoavaliação”.
And passo adicional da questao 7

Scenario: Auto-avaliação incompleta
Given o usuário “Cristiano” está logado. 
And Está na “página de autoavaliação”.
When A atividade “Goal 3” no campo reservado para “Student” não é preenchida pelo usuário.
Then O sistema não permite não permite que a avaliação seja salva.
And aparece a mensagem de erro “Incomplete Self-Evaluation”.
And passo adicional da questao 7

Scenario: Não há discrepância.
Given Estou logado como “Professor”
And estou na página “avaliações”.
When Na atividade “Activity 1”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 2”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 3”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MPA”
And Na atividade “Activity 4”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MPA”.
And Na atividade “Activity 5”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MA”
 And Na atividade “Activity 1”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MANA”
And Na atividade “Activity 2”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MPA”
And Na atividade “Activity 3”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MANA”
And Na atividade “Activity 4”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MPA”
And Na atividade “Activity 5”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MANA”
And Na atividade “Activity 1”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 2”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MPA”
And Na atividade “Activity 3”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 3”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 3”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MPA”
And Eu quero ver a “variância” dos alunos “Paulo”
And Eu quero ver a “variância” dos alunos “Pedro”
And Eu quero ver a “variância” dos alunos “Gabi”
Then Sou redirecionado para a página “lista”.
And No campo “alunos” há “-”.
And no campo “total” há o número “0”.
And no campo “%” há o número “0”.

Scenario: Há discrepância.
Given Estou logado como “Professor”
And estou na página “avaliações”.
When Na atividade “Activity 1”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 2”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 3”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MPA”
And Na atividade “Activity 4”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MPA”.
And Na atividade “Activity 5”  do estudante “Paulo”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MA”
 And Na atividade “Activity 1”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MANA”
And Na atividade “Activity 2”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MPA”
And Na atividade “Activity 3”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MANA”
And Na atividade “Activity 4”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MPA”
And Na atividade “Activity 5”  do estudante “Pedro”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MANA”
And Na atividade “Activity 1”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 2”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MPA”
And Na atividade “Activity 3”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 3”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MA” e o campo “Student” está preenchido com “MA”
And Na atividade “Activity 3”  do estudante “Gabi”, o campo “Teacher” está preenchido com “MPA” e o campo “Student” está preenchido com “MPA”
And Eu quero ver a variância dos alunos “Paulo”
And Eu quero ver a variância dos alunos “Pedro”
And Eu quero ver a variância dos alunos “Gabi”
Then Sou redirecionado para a página “lista”.
And No campo “Alunos” há o aluno “Pedro”.
And nos campo “total” há o número “1”.
And no campo “%” há o número “33,3%”.
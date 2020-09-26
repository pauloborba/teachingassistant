Feature: Autoavaliação

              As a: Estudante
              I want to: Adicionar à página de notas os conceitos que eu julgo merecer
              So that: Eu e meu professor possamos ter uma noção mais clara da relação entre o progresso que eu creio estar fazendo e os conceitos que estou conseguindo nas avaliações.

        Scenario: realizando autoavaliação
            Given Eu estou logada como “Ana”.
              And Eu estou na página de “Notas”.
              And Eu vejo que o espaço disponível para “Autoavaliação” está com “NI” para todas as três metas.
             When Eu preencho a coluna de “Autoavaliação” com “MA, MPA, MA”.
             Then Vejo a mensagem de “Autoavaliação bem-sucedida”.
              And Eu estou na página “Notas”.
              And Eu vejo que a coluna de “Autoavaliação” agora está preenchido.

        Scenario: tentando realizar autoavaliação com conceitos incompletas
            Given Eu estou logada como “Ana”
              And Estou na página “Notas”
              And Eu vejo que o espaço disponível para “Autoavaliação” está com “NI” para todas as três metas
             When Eu preencho a coluna de “Autoavaliação” com “MA, -, MA”
             Then Vejo a mensagem de erro “Autoavaliação não pode ser concluída”
              And Estou na página de “Notas”
              And Eu vejo que o espaço disponível para “Autoavaliação” continua preenchido com “NI”
        
        Scenario: checagem de discrepâncias quando não há discrepâncias
            Given Eu estou logado como “teacher”
              And Estou na página “Notas” com a opção “Mostrar Autoavaliações” selecionada
             When Peço para “ver as discrepâncias”
             Then Estou na página “Discrepâncias”
              And Vejo a mensagem “Não há discrepâncias”

        Scenario: checagem de discrepâncias quando há 1 caso de discrepância entre 3 alunos
            Given Eu estou logado como “teacher”
              And Estou na página “Notas” com a opção “Mostrar Autoavaliações” selecionada
             When Peço para “Ver Discrepâncias”
             Then Estou na página “Discrepâncias”
              And Posso ver “1 de 3 alunos (33%)”
              And Posso ver na área “Alunos Discrepantes” uma lista com o nome do aluno discrepante.
              *ajuste*
testes a partir do
  rebase

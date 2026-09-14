feature: Notificação

minha atividade:
Envio de email com resultado na disciplina (aprovado, reprovado, final, etc.)

Scenario: Envio de e-mails com resultados finais para a turma com sucesso
  Given Eu estou logado como o professor "Paulo Borba"
  And Eu estou na página "Resultados Finais" da disciplina "ESS"
  And A aluna "Maria Silva" possui o resultado "Aprovada"
  And O aluno "João Souza" possui o resultado "Final"
  When Eu solicito o envio dos resultados para toda a turma
  Then Eu vejo a mensagem "E-mails enviados com sucesso"
  And Eu vejo o resumo informando "2" e-mails enviados com sucesso e "0" falhas

Scenario: Envio de e-mail de resultado com mensagem complementar personalizada
  Given Eu estou logado como o professor "Paulo Borba"
  And Eu estou na página "Resultados Finais" da disciplina "ESS"
  And O aluno "Pedro Silva" possui a nota final "8.5" e o resultado "Aprovado"
  When Eu solicito a pré-visualização do e-mail de "Pedro Silva"
  And Eu adiciono a mensagem complementar "Parabéns pela dedicação durante o semestre!"
  And Eu confirmo o envio do e-mail
  Then Eu vejo a mensagem de sucesso "E-mail enviado com sucesso"
  And Eu vejo no histórico da disciplina o envio para "Pedro Silva" contendo a mensagem "Parabéns pela dedicação durante o semestre!"

  modificação 

  Scenario: Exibição de falha na interface ao tentar enviar resultados para aluno com e-mail inválido
  Given Eu estou logado como o professor "Paulo Borba"
  And Eu estou na página "Resultados Finais" da disciplina "ESS"
  And O aluno "João Souza" possui o resultado "Aprovado" e o e-mail "joao@cin.ufpe.br"
  And A aluna "Ana Lima" possui o resultado "Final" e o e-mail inválido "ana.invalido@"
  When Eu solicito o envio dos resultados para toda a turma
  Then Eu vejo na tela o resumo com "1" e-mail enviado com sucesso e "1" falha
  And Eu vejo na lista de falhas a aluna "Ana Lima" com o motivo "Formato de e-mail inválido"
  And Eu vejo o status "Pendente" exibido para a aluna "Ana Lima"
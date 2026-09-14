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

 Scenario: Exibição de resumo com falha parcial no envio de e-mails
  Given Eu estou logado como o professor "Paulo Borba"
  And Eu estou na página "Resultados Finais" da disciplina "ESS"
  And O aluno "João Souza" possui o e-mail válido "joao@cin.ufpe.br" e resultado "Aprovado"
  And A aluna "Maria Silva" possui o e-mail válido "maria@cin.ufpe.br" e resultado "Aprovada"
  And A aluna "Ana Lima" possui o e-mail inválido "ana.invalido@" e resultado "Final"
  When Eu solicito o envio dos resultados para toda a turma
  Then Eu vejo na tela o resumo informando "2" e-mails enviados com sucesso e "1" falha
  And Eu vejo na lista de falhas o nome "Ana Lima" com o e-mail "ana.invalido@"
  And Eu vejo no histórico da disciplina o envio registrado com sucesso para "João Souza" e "Maria Silva"
  And Eu vejo a opção de corrigir o e-mail de "Ana Lima" e reenviar a notificação individualmente

Scenario: Bloqueio de reenvio individual de e-mail já disparado na GUI
  Given Eu estou logado como o professor "Paulo Borba"
  And Eu estou na página "Resultados Finais" da disciplina "ESS"
  And O aluno "Pedro Silva" possui o resultado "Aprovado" e status de envio "Enviado"
  When Eu tento abrir a prévia de e-mail do aluno "Pedro Silva"
  Then Eu vejo a mensagem de alerta "O e-mail com o resultado final deste aluno já foi enviado"
  And Eu permaneço na página "Resultados Finais" da disciplina "ESS"
  And O botão de envio individual do aluno "Pedro Silva" permanece indisponível

Scenario: Envio de e-mails com resultados finais para a turma com sucesso
  Given Eu estou logado como o professor "Paulo Borba"
  And Eu estou na página "Resultados Finais" da disciplina "ESS"
  And A aluna "Maria Silva" possui o resultado "Aprovada"
  And O aluno "João Souza" possui o resultado "Final"
  When Eu solicito o envio dos resultados para toda a turma
  Then Eu vejo a mensagem "E-mails enviados com sucesso"
  And Eu vejo o resumo informando "2" e-mails enviados com sucesso e "0" falhas

Scenario: Envio automático de novo e-mail após atualização de resultado
  Given Eu estou logado como o professor "Paulo Borba"
  And Eu estou na página "Resultados Finais" da disciplina "ESS"
  And A aluna "Maria Silva" possui o resultado "Aprovada" já enviado por e-mail
  When Eu altero o resultado da aluna "Maria Silva" para "Final"
  Then Eu vejo a mensagem "Resultado atualizado e novo e-mail enviado com sucesso para Maria Silva"
  And Eu vejo o resultado "Final" exibido para a aluna "Maria Silva"

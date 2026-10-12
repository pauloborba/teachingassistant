
Feature: Notificações de pendências no lançamento de notas

  As a Professor
  I want to configure reminders for missing grades in each class and view my notification history
  So that I can complete grade registration before the academic deadline


   ///////////////////////////////////////////GUI/////////////////////////////////////////////////////////

   
   @gui
   Scenario: Visualização do próprio histórico de notificações
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Turmas"
      And existe uma notificação de "Paulo Borba" para a turma "2026.2 de ESS", em "25/08/2026 às 09:00", com motivo "Notas pendentes" e status "Enviado"
      And existe uma notificação de "Paulo Borba" para a turma "2026.2 de Introdução a Programação", em "27/08/2026 às 09:00", com motivo "Notas pendentes" e status "Falha"
      And existe uma notificação de "Odilon" para a turma "2026.2 de Eletromagnetismo", em "23/08/2026 às 09:00", com motivo "Notas pendentes" e status "Enviado"
      And existe uma notificação de "Alexandre Cabral" para a turma "2026.2 de Introdução a Programação", em "26/09/2026 às 10:00", com motivo "Notas pendentes" e status "Falha"
      When "Paulo Borba" acessa a tela "Histórico de notificações"
      Then "Paulo Borba" é direcionado à tela "Histórico de notificações"
      And é apresentada a notificação de "Paulo Borba" da turma "2026.2 de ESS", registrada em "25/08/2026 às 09:00", com motivo "Notas pendentes" e status "Enviado"
      And é apresentada a notificação de "Paulo Borba" da turma "2026.2 de Introdução a Programação", registrada em "27/08/2026 às 09:00", com motivo "Notas pendentes" e status "Falha"
      And a notificação de "Odilon" da turma "2026.2 de Eletromagnetismo" não é apresentada
      And a notificação de "Alexandre Cabral" da turma "2026.2 de Introdução a Programação" não é apresentada


  
   @gui
   Scenario: Visualização dos detalhes históricos de uma notificação
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Histórico de notificações"
      And existe uma notificação de "Paulo Borba" para a turma "2026.2 de ESS", registrada em "25/08/2026 às 09:00", com motivo "Notas pendentes", status "Enviado" e prazo "31/08/2026 às 23:59"
      And as pendências registradas nessa notificação são "João da Silva - Prova 2" e "Maria Souza - Projeto 1"
      And as notas atuais são "8,0" para "João da Silva - Prova 2" e "9,0" para "Maria Souza - Projeto 1", cadastradas em "26/08/2026 às 10:00"
      When "Paulo Borba" seleciona a notificação de "25/08/2026 às 09:00" da turma "2026.2 de ESS"
      Then "Paulo Borba" é direcionado à tela "Detalhes da notificação"
      And são apresentados o professor "Paulo Borba", a turma "2026.2 de ESS", a data "25/08/2026 às 09:00", o motivo "Notas pendentes", o status "Enviado" e o prazo "31/08/2026 às 23:59"
      And a notificação de "25/08/2026 às 09:00" apresenta "João da Silva" sem nota cadastrada em "Prova 2", mesmo após o cadastro da nota "8,0" em "26/08/2026 às 10:00"
      And a notificação de "25/08/2026 às 09:00" apresenta "Maria Souza" sem nota cadastrada em "Projeto 1", mesmo após o cadastro da nota "9,0" em "26/08/2026 às 10:00"

   
   @gui
   Scenario: Filtragem do próprio histórico por disciplina e turma
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Histórico de notificações", sem filtros aplicados
      And existe uma notificação de "Paulo Borba" para a turma "2026.2 de ESS", em "25/08/2026 às 09:00", com motivo "Notas pendentes" e status "Enviado"
      And existe uma notificação de "Paulo Borba" para a turma "2026.1 de ESS", em "20/02/2026 às 09:00", com motivo "Notas pendentes" e status "Enviado"
      And existe uma notificação de "Paulo Borba" para a turma "2026.2 de Introdução a Programação", em "27/08/2026 às 09:00", com motivo "Notas pendentes" e status "Falha"
      When "Paulo Borba" filtra seu histórico pela disciplina "ESS" e turma "2026.2 de ESS"
      Then "Paulo Borba" permanece na tela "Histórico de notificações"
      And os filtros apresentados são a disciplina "ESS" e a turma "2026.2 de ESS"
      And é apresentada a notificação de "Paulo Borba" da turma "2026.2 de ESS", registrada em "25/08/2026 às 09:00", com motivo "Notas pendentes" e status "Enviado"
      And a notificação da turma "2026.1 de ESS", registrada em "20/02/2026 às 09:00", não é apresentada
      And a notificação da turma "2026.2 de Introdução a Programação", registrada em "27/08/2026 às 09:00", não é apresentada

  
   
   @gui
   Scenario: Visualização de uma falha no próprio histórico
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Histórico de notificações"
      And existe uma tentativa de envio de notificação para "Paulo Borba" da turma "2026.2 de ESS", registrada em "23/08/2026 às 09:00", com motivo "Notas pendentes", status "Falha" e descrição da falha "Tempo limite excedido no envio"
      When "Paulo Borba" seleciona a tentativa de envio de "23/08/2026 às 09:00" da turma "2026.2 de ESS"
      Then "Paulo Borba" é direcionado à tela "Detalhes da notificação"
      And são apresentados o professor "Paulo Borba", a turma "2026.2 de ESS", a data "23/08/2026 às 09:00", o motivo "Notas pendentes" e o status "Falha"
      And é apresentada a descrição da falha "Tempo limite excedido no envio"



   @gui
   Scenario: Configuração da quantidade, datas e horários dos lembretes
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Turmas", onde possui acesso à turma "2026.2 de ESS", pela qual é responsável
      And a turma "2026.2 de ESS" não possui lembretes configurados
      And a data atual é "19/08/2026 às 08:00"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      When "Paulo Borba" acessa a tela "Configuração de lembretes" da turma "2026.2 de ESS"
      And informa "2" como quantidade de lembretes
      And define o primeiro lembrete para "25/08/2026 às 09:00"
      And define o segundo lembrete para "29/08/2026 às 14:00"
      And salva a configuração
      Then "Paulo Borba" permanece na tela "Configuração de lembretes" da turma "2026.2 de ESS"
      And a tela apresenta a confirmação "Configuração salva com sucesso"
      And a quantidade de lembretes configurados é "2"
      And o primeiro lembrete está programado para "25/08/2026 às 09:00"
      And o segundo lembrete está programado para "29/08/2026 às 14:00"
      And o prazo acadêmico apresentado é "31/08/2026 às 23:59"




   @gui
   Scenario: Alteração de lembrete futuro sem afetar outra turma
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Configuração de lembretes" da turma "2026.2 de ESS"
      And "Paulo Borba" é responsável pelas turmas "2026.2 de ESS" e "2026.2 de Introdução a Programação"
      And a data atual é "20/08/2026 às 08:00"
      And o prazo acadêmico das duas turmas é "31/08/2026 às 23:59"
      And a turma "2026.2 de ESS" possui apenas "2" lembretes não enviados, programados para "25/08/2026 às 09:00" e "29/08/2026 às 09:00"
      And a turma "2026.2 de Introdução a Programação" possui apenas "1" lembrete não enviado, programado para "27/08/2026 às 09:00"
      When "Paulo Borba" altera o primeiro lembrete da turma "2026.2 de ESS" de "25/08/2026 às 09:00" para "26/08/2026 às 10:00"
      And salva a configuração
      Then "Paulo Borba" permanece na tela "Configuração de lembretes" da turma "2026.2 de ESS"
      And a tela apresenta a mensagem "Configuração salva com sucesso"
      And a turma "2026.2 de ESS" apresenta apenas "2" lembretes não enviados, programados para "26/08/2026 às 10:00" e "29/08/2026 às 09:00"
      And o lembrete de "25/08/2026 às 09:00" não é mais apresentado
      And a turma "2026.2 de Introdução a Programação" apresenta apenas "1" lembrete não enviado, programado para "27/08/2026 às 09:00"
      And o prazo acadêmico apresentado permanece "31/08/2026 às 23:59"



   @gui
   Scenario: Rejeição de quantidade de datas incompatível
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada, pela qual é responsável
      And a data atual é "20/08/2026 às 08:00"
      And o prazo acadêmico apresentado para a turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And a configuração salva da turma "2026.2 de ESS" possui apenas "1" lembrete não enviado, programado para "21/08/2026 às 09:00"
      When "Paulo Borba" altera a quantidade de lembretes para "3"
      And informa "25/08/2026 às 09:00" para o primeiro lembrete
      And informa "29/08/2026 às 09:00" para o segundo lembrete
      And deixa o terceiro lembrete sem data e horário
      And tenta salvar a configuração
      Then "Paulo Borba" permanece na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada
      And a tela apresenta a mensagem "Selecione exatamente 3 datas e horários"
      And a configuração salva permanece com apenas "1" lembrete não enviado, programado para "21/08/2026 às 09:00"
      And o prazo acadêmico apresentado permanece "31/08/2026 às 23:59"



   @gui
   Scenario: Rejeição de lembrete após o prazo acadêmico
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada, pela qual é responsável
      And a data atual é "20/08/2026 às 08:00"
      And o prazo acadêmico apresentado para a turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And a configuração salva da turma "2026.2 de ESS" possui apenas "1" lembrete não enviado, programado para "25/08/2026 às 09:00"
      When "Paulo Borba" altera a data e o horário do lembrete para "02/09/2026 às 09:00"
      And tenta salvar a configuração
      Then "Paulo Borba" permanece na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada
      And a tela apresenta a mensagem "Data posterior ao prazo acadêmico"
      And a configuração salva permanece com apenas "1" lembrete não enviado, programado para "25/08/2026 às 09:00"
      And nenhum lembrete é agendado para "02/09/2026 às 09:00"
      And o prazo acadêmico apresentado permanece "31/08/2026 às 23:59"



   @gui
   Scenario: Bloqueio de alteração de lembrete já enviado
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada, pela qual é responsável
      And a data atual é "22/08/2026 às 08:00"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And a turma "2026.2 de ESS" possui um lembrete programado para "20/08/2026 às 09:00" com status "Enviado"
      And a turma "2026.2 de ESS" possui outro lembrete programado para "28/08/2026 às 09:00" com status "Não enviado"
      When "Paulo Borba" tenta alterar o lembrete enviado de "20/08/2026 às 09:00" para "24/08/2026 às 09:00"
      And solicita salvar a configuração
      Then "Paulo Borba" permanece na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada
      And a alteração é rejeitada com a mensagem "Lembretes enviados não podem ser alterados"
      And o lembrete de "20/08/2026 às 09:00" permanece com status "Enviado" e com seu agendamento original
      And o lembrete de "28/08/2026 às 09:00" permanece com status "Não enviado" e com seu agendamento original
      And nenhum lembrete é programado para "24/08/2026 às 09:00"
      And o prazo acadêmico da turma permanece "31/08/2026 às 23:59"


   @gui 
   Scenario: Aumento da quantidade de lembretes configurados
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada, pela qual é responsável
      And a data atual é "20/08/2026 às 08:00"
      And o prazo acadêmico apresentado para a turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And a turma "2026.2 de ESS" possui "2" lembretes não enviados, programados para "25/08/2026 às 09:00" e "28/08/2026 às 09:00"
      When "Paulo Borba" aumenta a quantidade de lembretes para "3"
      And configura o novo lembrete para "29/08/2026 às 14:00"
      And salva a configuração
      Then "Paulo Borba" permanece na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada
      And a tela apresenta a mensagem "Configuração salva com sucesso"
      And a turma "2026.2 de ESS" apresenta "3" lembretes não enviados, programados para "25/08/2026 às 09:00", "28/08/2026 às 09:00" e "29/08/2026 às 14:00"
      And o prazo acadêmico apresentado permanece "31/08/2026 às 23:59"


   @gui
   Scenario: Redução da quantidade de lembretes sem excluir envios realizados
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada, pela qual é responsável
      And o prazo acadêmico apresentado para a turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And a turma "2026.2 de ESS" possui "3" lembretes, sendo um de "20/08/2026 às 09:00" com status "Enviado" e dois programados para "25/08/2026 às 09:00" e "28/08/2026 às 09:00" com status "Não enviado"
      When "Paulo Borba" reduz a quantidade de lembretes para "2"
      And remove o lembrete não enviado de "28/08/2026 às 09:00"
      And salva a configuração
      Then "Paulo Borba" permanece na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada
      And a tela apresenta a mensagem "Configuração salva com sucesso"
      And a turma "2026.2 de ESS" apresenta apenas "2" lembretes
      And o lembrete de "20/08/2026 às 09:00" permanece registrado com status "Enviado"
      And o lembrete de "25/08/2026 às 09:00" permanece programado com status "Não enviado"
      And o lembrete de "28/08/2026 às 09:00" não é mais apresentado na configuração
      And o prazo acadêmico apresentado permanece "31/08/2026 às 23:59"



   @gui
   Scenario: Rejeição de criação de lembrete em data anterior à atual
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada, pela qual é responsável
      And a data atual é "20/08/2026 às 08:00"
      And o prazo acadêmico apresentado para a turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And a configuração salva da turma "2026.2 de ESS" possui apenas "1" lembrete não enviado, programado para "25/08/2026 às 09:00"
      When "Paulo Borba" aumenta a quantidade de lembretes para "2"
      And configura o novo lembrete para "19/08/2026 às 09:00"
      And tenta salvar a configuração
      Then "Paulo Borba" permanece na tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada
      And a tela apresenta a mensagem "Não é possível agendar lembretes em datas anteriores à data atual"
      And a configuração salva permanece com apenas "1" lembrete não enviado, programado para "25/08/2026 às 09:00"
      And nenhum lembrete é agendado para "19/08/2026 às 09:00"
      And o prazo acadêmico apresentado permanece "31/08/2026 às 23:59"



   @gui
   Scenario: Restrição de configuração de lembretes às próprias turmas
      Given o professor "Paulo Borba" está autenticado com o usuário "paulo.borba" e a senha "Paulo@2026!"
      And "Paulo Borba" está na tela "Turmas"
      And "Paulo Borba" é responsável pelas turmas "2026.2 de ESS" e "2026.2 de Introdução a Programação"
      And "Ana Silva" é responsável pela turma "2026.2 de Engenharia de Requisitos"
      And a turma "2026.2 de ESS" possui um lembrete programado para "25/08/2026 às 09:00"
      When "Paulo Borba" acessa a tela "Configuração de lembretes" da turma "2026.2 de ESS"
      Then "Paulo Borba" é direcionado à tela "Configuração de lembretes" com a turma "2026.2 de ESS" selecionada
      And a configuração apresenta o lembrete programado para "25/08/2026 às 09:00"
      And as turmas "2026.2 de ESS" e "2026.2 de Introdução a Programação" estão disponíveis para configuração
      And a turma "2026.2 de Engenharia de Requisitos" de "Ana Silva" não está disponível para configuração


   ///////////////////////////////////////////SERVICE/////////////////////////////////////////////////////////


   @service
   Scenario: Envio de lembrete com notas pendentes
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui os alunos matriculados "João da Silva" e "Maria Souza"
      And a turma possui apenas as avaliações "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00", e "Projeto Teaching Assistant", realizado em "22/08/2026 às 14:00"
      And "João da Silva" está sem nota em "Prova de SOLID e Padrões de Projeto" e possui nota "7,0" em "Projeto Teaching Assistant"
      And "Maria Souza" possui nota "9,0" em "Prova de SOLID e Padrões de Projeto" e está sem nota em "Projeto Teaching Assistant"
      And a turma "2026.2 de ESS" possui um lembrete não enviado, programado para "25/08/2026 às 09:00"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And o serviço SMTP do "Gmail", utilizado pela biblioteca "Nodemailer", está disponível e aceita o envio
      When o serviço processa o lembrete da turma "2026.2 de ESS" em "25/08/2026 às 09:00"
      Then um e-mail é aceito para envio ao professor "Paulo Borba", no endereço "paulo.borba@example.com"
      And o e-mail identifica a turma "2026.2 de ESS" e o motivo "Notas pendentes"
      And o e-mail informa que "João da Silva" está sem nota em "Prova de SOLID e Padrões de Projeto"
      And o e-mail informa que "Maria Souza" está sem nota em "Projeto Teaching Assistant"
      And nenhuma outra pendência é informada no e-mail
      And o e-mail informa o prazo acadêmico "31/08/2026 às 23:59"
      And a tentativa de envio de "25/08/2026 às 09:00" é registrada no histórico de "Paulo Borba" com status "Enviado"
      And o lembrete de "25/08/2026 às 09:00" é contabilizado como enviado para a turma "2026.2 de ESS"



   @service
   Scenario: Ausência de envio quando todas as notas foram cadastradas
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui apenas os alunos matriculados "João da Silva" e "Maria Souza"
      And a turma possui apenas as avaliações "Prova de SOLID e Padrões de Projeto", realizada em "18/08/2026 às 14:00", e "Projeto Teaching Assistant", realizado em "19/08/2026 às 14:00"
      And "João da Silva" possui nota "8,0" em "Prova de SOLID e Padrões de Projeto" e nota "7,0" em "Projeto Teaching Assistant"
      And "Maria Souza" possui nota "9,0" em "Prova de SOLID e Padrões de Projeto" e nota "8,5" em "Projeto Teaching Assistant"
      And as notas "8,0" de "João da Silva" e "8,5" de "Maria Souza" foram cadastradas em "24/08/2026 às 15:00"
      And a turma possui lembretes programados para "20/08/2026 às 09:00", "25/08/2026 às 09:00" e "29/08/2026 às 09:00"
      And o lembrete de "20/08/2026 às 09:00" possui status "Enviado" e é o último registro do histórico de envios
      And os lembretes de "25/08/2026 às 09:00" e "29/08/2026 às 09:00" possuem status "Não enviado"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      When o serviço processa o lembrete da turma "2026.2 de ESS" em "25/08/2026 às 09:00"      
      Then nenhum e-mail de "Notas pendentes" é enviado para "paulo.borba@example.com"
      And o lembrete de "25/08/2026 às 09:00" recebe o status "Ignorado" com o motivo "Nenhuma nota pendente"
      And o histórico de processamento registra o lembrete de "25/08/2026 às 09:00" com status "Ignorado" e motivo "Nenhuma nota pendente"
      And nenhuma nova tentativa de envio de e-mail é registrada
      And a última tentativa de envio permanece sendo a de "20/08/2026 às 09:00", com status "Enviado"
      And o lembrete de "29/08/2026 às 09:00" permanece com status "Agendado"
      And o prazo acadêmico da turma "2026.2 de ESS" permanece "31/08/2026 às 23:59"



  
   @service
   Scenario: Identificação correta das notas pendentes
      Given a turma "2026.2 de ESS" possui apenas os alunos matriculados "João da Silva" e "Maria Souza"
      And a turma possui apenas as avaliações "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00", e "Projeto Teaching Assistant", prevista para "28/08/2026 às 14:00"
      And "João da Silva" está sem nota cadastrada em "Prova de SOLID e Padrões de Projeto"
      And "Maria Souza" possui nota "0,0" em "Prova de SOLID e Padrões de Projeto"
      And "João da Silva" e "Maria Souza" ainda não possuem notas cadastradas em "Projeto Teaching Assistant"
      When o serviço identifica as notas pendentes da turma "2026.2 de ESS" em "25/08/2026 às 09:00"
      Then é identificada a pendência de "João da Silva" em "Prova de SOLID e Padrões de Projeto"
      And a nota "0,0" de "Maria Souza" em "Prova de SOLID e Padrões de Projeto" não é considerada pendente
      And nenhuma pendência de "Projeto Teaching Assistant" é identificada para "João da Silva" ou "Maria Souza"
      And nenhuma outra pendência é identificada na turma "2026.2 de ESS"




   @service
   Scenario: Envio independente de lembretes para múltiplas turmas
      Given o professor "Paulo Borba" é responsável pelas turmas "2026.2 de ESS" e "2026.2 de Introdução a Programação" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui apenas o aluno matriculado "João da Silva" e a avaliação "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And "João da Silva" está sem nota cadastrada em "Prova de SOLID e Padrões de Projeto"
      And a turma "2026.2 de Introdução a Programação" possui apenas a aluna matriculada "Maria Souza" e a avaliação "Projeto de Algoritmos em Python", realizada em "21/08/2026 às 14:00"
      And "Maria Souza" está sem nota cadastrada em "Projeto de Algoritmos em Python"
      And ambas as turmas possuem um lembrete com status "Agendado" para "25/08/2026 às 09:00"
      And o prazo acadêmico das duas turmas é "31/08/2026 às 23:59"
      And o serviço SMTP do "Gmail", utilizado pela biblioteca "Nodemailer", aceita ambos os envios
      When o serviço processa os lembretes das duas turmas em "25/08/2026 às 09:00"
      Then é aceito um e-mail para "paulo.borba@example.com", referente à turma "2026.2 de ESS", informando apenas a pendência de "João da Silva" em "Prova de SOLID e Padrões de Projeto"
      And é aceito outro e-mail para "paulo.borba@example.com", referente à turma "2026.2 de Introdução a Programação", informando apenas a pendência de "Maria Souza" em "Projeto de Algoritmos em Python"
      And ambos os e-mails apresentam o motivo "Notas pendentes" e o prazo acadêmico "31/08/2026 às 23:59"
      And o histórico de "Paulo Borba" registra um envio da turma "2026.2 de ESS", em "25/08/2026 às 09:00", com status "Enviado"
      And o histórico de "Paulo Borba" registra outro envio da turma "2026.2 de Introdução a Programação", em "25/08/2026 às 09:00", com status "Enviado"
      And cada turma contabiliza apenas seu próprio lembrete como enviado



   @service
   Scenario: Bloqueio de envio de lembrete não agendado
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui o aluno matriculado "João da Silva", sem nota cadastrada em "Prova de SOLID e Padrões de Projeto", realizada em "18/08/2026 às 14:00"
      And a turma "2026.2 de ESS" possui apenas os lembretes de "20/08/2026 às 09:00" e "25/08/2026 às 09:00", ambos com status "Enviado"
      And o histórico de "Paulo Borba" registra os dois envios nas respectivas datas para a turma "2026.2 de ESS"
      And não existe lembrete agendado para "27/08/2026 às 09:00" na turma "2026.2 de ESS"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      When o serviço recebe uma solicitação de envio de lembrete para a turma "2026.2 de ESS" em "27/08/2026 às 09:00"
      Then a solicitação é rejeitada por não existir um lembrete agendado para "27/08/2026 às 09:00"
      And nenhum novo e-mail de "Notas pendentes" é enviado para "paulo.borba@example.com"
      And os lembretes de "20/08/2026 às 09:00" e "25/08/2026 às 09:00" permanecem com status "Enviado"
      And nenhuma nova tentativa de envio é registrada no histórico de "Paulo Borba"
      And o prazo acadêmico da turma "2026.2 de ESS" permanece "31/08/2026 às 23:59"




   @service
   Scenario: Bloqueio de criação de novo lembrete após o prazo acadêmico
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui o aluno matriculado "João da Silva", sem nota cadastrada em "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And a turma possui um lembrete de "25/08/2026 às 09:00" com status "Enviado"
      And não existem outros lembretes configurados para a turma "2026.2 de ESS"
      And o prazo acadêmico da turma "2026.2 de ESS" terminou em "31/08/2026 às 23:59"
      And a data atual é "01/09/2026 às 08:00"
      When o serviço recebe uma solicitação de criação de novo lembrete para "01/09/2026 às 09:00" na turma "2026.2 de ESS"
      Then a solicitação é rejeitada com o motivo "Prazo acadêmico encerrado"
      And nenhum lembrete é criado para "01/09/2026 às 09:00"
      And o lembrete de "25/08/2026 às 09:00" permanece registrado com status "Enviado"
      And nenhum e-mail de "Notas pendentes" é enviado para "paulo.borba@example.com"
      And nenhuma nova tentativa de envio é registrada no histórico de "Paulo Borba"


   
   
   @service
   Scenario: Reenvio automático após falha temporária
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui apenas o aluno matriculado "João da Silva" e a avaliação "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And "João da Silva" está sem nota cadastrada em "Prova de SOLID e Padrões de Projeto"
      And a turma possui um lembrete programado para "25/08/2026 às 09:00"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And o histórico de "Paulo Borba" registra apenas uma tentativa de envio desse lembrete, em "25/08/2026 às 09:00", com status "Falha" e motivo "Indisponibilidade temporária do serviço de e-mail"
      And o lembrete aguarda reenvio imediato e o serviço de e-mail do "Gmail" está disponível
      When o serviço executa o reenvio imediato do lembrete
      Then o reenvio é aceito pelo "Gmail" para o endereço "paulo.borba@example.com"
      And o e-mail identifica a turma "2026.2 de ESS" e a pendência de "João da Silva" em "Prova de SOLID e Padrões de Projeto"
      And o histórico de "Paulo Borba" preserva a tentativa de "25/08/2026 às 09:00" com status "Falha" e motivo "Indisponibilidade temporária do serviço de e-mail"
      And o reenvio imediato é registrado no histórico de "Paulo Borba" com status "Enviado"
      And o histórico apresenta apenas as duas tentativas desse lembrete, uma com status "Falha" e outra com status "Enviado"
      And o lembrete de "25/08/2026 às 09:00" é contabilizado como um único lembrete enviado
      And nenhum novo reenvio permanece programado para esse lembrete




   @service
   Scenario: Prevenção de envio duplicado por reprocessamento de lembrete já enviado
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail "paulo.borba@example.com"
      And a turma possui o aluno "João da Silva", sem nota cadastrada em "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And existe apenas um lembrete para a turma "2026.2 de ESS", programado para "25/08/2026 às 09:00"
      And o lembrete foi processado em "25/08/2026 às 09:00" e possui status "Enviado"
      And o histórico registra exatamente uma tentativa desse lembrete com status "Enviado"
      And o serviço de e-mail do "Gmail" aceitou exatamente um envio desse lembrete
      And o prazo acadêmico da turma é "31/08/2026 às 23:59"
      When o agendador solicita novamente o processamento do mesmo lembrete em "25/08/2026 às 09:01"
      Then nenhuma nova solicitação de envio é realizada ao serviço de e-mail do "Gmail"
      And o lembrete permanece com status "Enviado"
      And o histórico permanece com exatamente uma tentativa desse lembrete
      And o lembrete continua contabilizado como um único envio



   @service
   Scenario: Bloqueio de novo reenvio após sucesso de tentativa anterior
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma possui apenas o aluno "João da Silva", sem nota cadastrada em "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And a turma possui um lembrete programado para "25/08/2026 às 09:00"
      And o histórico de "Paulo Borba" registra uma tentativa inicial desse lembrete com status "Falha"
      And o histórico registra um reenvio imediato do mesmo lembrete com status "Enviado"
      And exatamente um e-mail desse lembrete foi aceito pelo serviço de e-mail do "Gmail"
      And o lembrete possui status "Enviado" e não possui novos reenvios programados
      And o prazo acadêmico da turma é "31/08/2026 às 23:59"
      When o serviço recebe uma solicitação atrasada de reenvio desse lembrete em "25/08/2026 às 09:01"
      Then nenhuma nova solicitação de envio é realizada ao serviço de e-mail do "Gmail"
      And o histórico permanece com exatamente duas tentativas desse lembrete, uma com status "Falha" e outra com status "Enviado"
      And o lembrete permanece com status "Enviado"
      And nenhum novo reenvio é programado
      And o lembrete continua contabilizado como um único envio

   @service
   Scenario: Reenvio progressivo após falhas persistentes
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui apenas o aluno matriculado "João da Silva" e a avaliação "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And "João da Silva" está sem nota cadastrada em "Prova de SOLID e Padrões de Projeto"
      And a turma possui um lembrete programado para "25/08/2026 às 09:00"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And o histórico de "Paulo Borba" registra duas tentativas desse lembrete, a primeira em "25/08/2026 às 09:00" e a segunda imediatamente após a primeira, ambas com status "Falha" e motivo "Indisponibilidade temporária do serviço de e-mail"
      And existe um terceiro envio programado para "25/08/2026 às 09:01"
      And o serviço de e-mail do "Gmail" permanece indisponível em "25/08/2026 às 09:01"
      When o serviço executa o terceiro envio em "25/08/2026 às 09:01"
      Then a terceira tentativa é registrada no histórico de "Paulo Borba", em "25/08/2026 às 09:01", com status "Falha" e motivo "Indisponibilidade temporária do serviço de e-mail"
      And as duas tentativas anteriores permanecem registradas com status "Falha"
      And uma quarta tentativa é programada para "25/08/2026 às 09:03"
      And nenhum e-mail desse lembrete foi aceito para envio ao endereço "paulo.borba@example.com"
      And o lembrete de "25/08/2026 às 09:00" não é contabilizado como enviado
      And o prazo acadêmico permanece "31/08/2026 às 23:59"


   @service
   Scenario: Prevenção de envio duplicado por processamento concorrente
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma possui apenas o aluno "João da Silva", sem nota cadastrada em "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And a turma possui apenas um lembrete, programado para "25/08/2026 às 09:00", com status "Agendado"
      And não existem tentativas de envio registradas para esse lembrete
      And o prazo acadêmico da turma é "31/08/2026 às 23:59"
      And o serviço de e-mail do "Gmail" está disponível e aceita envios
      When duas execuções concorrentes do serviço processam o mesmo lembrete em "25/08/2026 às 09:00"
      Then exatamente um e-mail desse lembrete é aceito para envio ao endereço "paulo.borba@example.com"
      And o histórico de "Paulo Borba" registra exatamente uma tentativa desse lembrete, com status "Enviado"
      And o lembrete recebe o status "Enviado"
      And o lembrete é contabilizado como um único envio


   @service
   Scenario: Cancelamento de reenvio após resolução das pendências
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui apenas o aluno matriculado "João da Silva" e a avaliação "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And a nota atual de "João da Silva" em "Prova de SOLID e Padrões de Projeto" é "8,0", cadastrada em "25/08/2026 às 09:02"
      And o histórico de "Paulo Borba" registra duas tentativas de envio do lembrete de "25/08/2026 às 09:00", a segunda imediatamente após a primeira, ambas com status "Falha" e motivo "Indisponibilidade temporária do serviço de e-mail"
      And uma terceira tentativa em "25/08/2026 às 09:01" também está registrada com status "Falha" e o mesmo motivo
      And existe uma quarta tentativa de envio programada para "25/08/2026 às 09:03"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      When o serviço processa o reenvio do lembrete em "25/08/2026 às 09:03"
      Then o reenvio é cancelado com o motivo "Nenhuma nota pendente"
      And nenhuma nova solicitação de envio é realizada ao serviço de e-mail do "Gmail" para "paulo.borba@example.com"
      And as três tentativas anteriores permanecem registradas no histórico de "Paulo Borba" com status "Falha"
      And o lembrete de "25/08/2026 às 09:00" recebe o status "Cancelado" com o motivo "Nenhuma nota pendente"
      And nenhuma nova tentativa de envio é registrada
      And nenhum lembrete é contabilizado como enviado
      And não existem novos reenvios programados para esse lembrete




   @service
   Scenario: Interrupção dos reenvios após o prazo acadêmico
      Given o professor "Paulo Borba" é responsável pela turma "2026.2 de ESS" e possui o e-mail cadastrado "paulo.borba@example.com"
      And a turma "2026.2 de ESS" possui apenas o aluno matriculado "João da Silva" e a avaliação "Prova de SOLID e Padrões de Projeto", realizada em "20/08/2026 às 14:00"
      And "João da Silva" permanece sem nota cadastrada em "Prova de SOLID e Padrões de Projeto"
      And o prazo acadêmico da turma "2026.2 de ESS" é "31/08/2026 às 23:59"
      And o histórico de "Paulo Borba" registra duas tentativas de envio do lembrete de "31/08/2026 às 23:57", a segunda imediatamente após a primeira, ambas com status "Falha" e motivo "Indisponibilidade temporária do serviço de e-mail"
      And uma terceira tentativa em "31/08/2026 às 23:58" também está registrada com status "Falha" e o mesmo motivo
      And existe uma quarta tentativa de envio programada para "01/09/2026 às 00:00"
      When o serviço processa o reenvio do lembrete em "01/09/2026 às 00:00"
      Then o reenvio é cancelado com o motivo "Prazo acadêmico encerrado"
      And nenhuma nova solicitação de envio é realizada ao serviço de e-mail do "Gmail" para "paulo.borba@example.com"
      And as três tentativas anteriores permanecem registradas no histórico de "Paulo Borba" com status "Falha"
      And o lembrete de "31/08/2026 às 23:57" recebe o status "Cancelado" com o motivo "Prazo acadêmico encerrado"
      And nenhuma nova tentativa de envio é registrada
      And nenhum lembrete é contabilizado como enviado
      And não existem novos reenvios programados para esse lembrete


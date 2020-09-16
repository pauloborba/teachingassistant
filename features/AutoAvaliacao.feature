Scenario: o usuário consegue adicionar um lembrete com sucesso
Given a usuária “Carla”  deseja criar um lembrete de uma mensagem de “João”
And ele selecionou a opção para criar lembrete
When “Carla” seleciona a data (ou o tempo) escolhido
And “Carla” confirma a criação do lembrete
Then o sistema notifica que foi criado um lembrete para a mensagem de “João”
And mostra a data e hora de quando a notificação vai acontecer


Scenario: o usuário tenta selecionar uma data do passado
Given o sistema de datas é um calendário
And o sistema de horas é uma lista de horas
And “Mariana” tenta selecionar uma data ou hora passados
When “Mariana” tenta enviar
Then o sistema não permite o envio e pede para selecionar uma data futura


Scenario: chegou a hora do lembrete
Given “Matheus” criou um lembrete anteriormente para a mensagem de “Larissa”
When chega a hora do lembrete de “Matheus”
Then a mensagem de “Larissa” é marcada como “não lida”
And aparece como uma nova mensagem para “Matheus”


Scenario: Há um lembrete já existente para a mensagem
Given “Lucas” criou um lembrete anteriormente para a mensagem de “Felipe”
And “Lucas” tenta criar um lembrete novamente
When “Lucas” seleciona a opção de criar novo lembrete
Then o sistema notifica que já existe um lembrete “X”
And mostra qual a data do lembrete “X”
And pergunta se “Lucas” deseja sobrescrever o lembrete “X” com um novo




Scenario: preencher e enviar as respostas e, receber aviso de sucesso
Given eu estou na página de auto-avaliação
And eu preencho as notas “MA”, “MPA” e “MANA”, respectivamente
And todas as notas foram preenchidas
When eu tento enviar as respostas
Then posso ver que as notas registradas foram “MA”, “MPA” e “MANA”


Scenario: preencher e enviar as respostas e, receber aviso de erro
Given eu estou na página de auto-avaliação
And eu preencho as notas “MA” e “MANA”, respectivamente
And nem todas as notas foram preenchidas
When eu tento enviar as respostas
Then o sistema dá um alerta de erro, pois nem tudo foi preenchido
And volta para a tela de preenchimento





Scenario: não há alunos com notas discrepantes
Given eu estou na página “verificar alunos discrepantes”
And não há alunos com notas discrepantes
When eu tento verificar quais alunos estão em tal situação
Then o sistema mostra uma lista vazia


Scenario: Há aluno com nota discrepante
Given eu estou na página “verificar alunos discrepantes”
And Há 3 alunos na disciplina
And Apenas o aluno “João” tem discrepância
When eu tento verificar quais alunos estão em tal situação
Then o sistema dá um alerta avisando que há 1 aluno discrepante
And mostra o percentual de 33% de alunos discrepantes
And mostra uma lista com o aluno “João”

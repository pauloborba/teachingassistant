Feature: Snooze de menagem

GUI
Scenario: Ativando o snooze de mensagem
Given eu estou na página de “chat”
And quero ativar o snooze de mensagem
When eu aperto na engrenagem 
And clico na “configuração de snooze”
And eu configuro a data e a hora que eu quero que chat seja reativado
Then o snooze foi ativado
And eu não recebo mais notificações até a data definida

GUI
Scenario: Quando já existe o snooze
Given eu já tinha criado um snooze
And quero ativar o snooze de novo
When eu aperto na engrenagem
And clico na “configuração de snooze”
Then aparece mensagem que já tinha criado
And o sistema mostra mensagem se quero criar outro snooze

GUI
Scenario: Adicionando a nota na auto-avaliação
Given eu estou na página de adicionar a nota
And eu vejo que por enquanto tou sem nota
When eu adiciono a nota “MA”
Then eu continuo na página de nota
And eu vejo que sistema atualizou a página com a minha nota “MA” cadastrada com sucesso

GUI
Scenario: Erro ao adicionar a nota na auto-avaliação
Given eu estou na página de adicionar a nota
And eu não adicionei nenhuma nota
When eu boto pra salvar a nota
Then o sistema retorna mensagem de erro
And pede para eu adicionar uma nota
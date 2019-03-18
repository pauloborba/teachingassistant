Feature: Acesso de informações dos serviços fornecidos pelo NASE
As a: Estudante (cliente)
I want to: Consultar meus serviços do NASE e ver minhas informações pessoais associadas
So that: Posso ter acesso a meu histórico de atendimento clínico e dados pessoais

Scenario: Consultar um agendamento
Given eu estou loguei com meu cpf "12312312312"
And eu estou na página de "Agendamento"
And eu agendei previamente somente uma consulta "Odontológica" na data "21/04/2019" às "12:30"
When eu busco pela proxima consulta em "próximas consultas"
Then eu vejo uma consulta "Odontológica" marcada para a data "21/04/2019" às "12:30"

Scenario: Consultar um agendamento que inexiste
Given eu estou loguei com meu cpf "12312312312"
And nao marquei previamente nenhuma consulta
And eu estou na página de "Agendamento"
When eu busco pela proxima consulta em "próximas consultas"
Then eu vejo uma mensagem que relata "Sem consultas para os próximos dias"

Scenario: Consultar histórico completo
Given eu estou loguei com meu cpf "12312312312"
And eu estou na página de "Histórico"
When eu seleciono em "Historico Completo"
Then eu vejo todas consultas e anotaçoes médicas dos serviços que fiz
"Servico Odontologico" com "Doutora Brenda" e com comentário do serviço na data  "23/02/2019" às "12:30"
And "Servico Psicológico" com "Doutor Bruno" e com comentario do servico na data "12/12/2018"

Scenario: Consultar histórico num intervalo de datas inválidas
Given eu estou loguei com meu cpf "12312312312"
And eu estou na página de "Histórico"
when eu seleciono "Historico Parcial"
And preencho duas datas "22/02/2019" e "ab/03/2019"
Then eu vejo uma mensagem que relata "Dados incorretos, preencha novamente"

Scenario: Consultar histórico num intervalo de datas válidas
Given eu estou loguei com meu cpf "12312312312"
And eu estou na página de "Histórico"
when eu seleciono "Historico Parcial"
And preencho duas datas "22/02/2019" e "22/03/2019"
Then eu vejo as consultas e anotaçoes médicas dos serviços que fiz entre "22/02/2019" e "22/03/2019", sendo a única "Servico Odontologico" com "Doutora Brenda" e com comentário do serviço na data  "23/02/2019" às "12:30"
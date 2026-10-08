Scenario: Envio da primeira notificação diária de atualização de nota
Given o aluno "João Silva" está matriculado na disciplina "Engenharia de Software"
And nenhuma notificação de notas foi enviada para "João Silva" na data de hoje
When o professor registra a nota "9" para "João Silva" em "Engenharia de Software"
Then a nota "9" é armazenada com sucesso no sistema
And um e-mail de atualização de nota é enviado para "João Silva"
And o sistema registra que uma notificação já foi enviada para "João Silva" hoje

Scenario: Bloqueio de múltiplos e-mails de notas no mesmo dia
Given a aluna "Maria Souza" está matriculada na disciplina "Engenharia de Software"
And um e-mail de atualização de nota já foi enviado para "Maria Souza" na data de hoje
When o professor atualiza a nota de "Maria Souza" em "Engenharia de Software" para "9,5"
Then a nota "9,5" é armazenada com sucesso no sistema
And nenhum novo e-mail de atualização de notas é enviado para "Maria Souza"

Scenario: Lançamento de nota para aluno sem e-mail cadastrado no sistema
Given o aluno "Pedro Alves" está matriculado na disciplina "Engenharia de Software"
And o aluno "Pedro Alves" não possui um endereço de e-mail cadastrado
When o professor registra a nota "8" para "Pedro Alves" em "Engenharia de Software"
Then a nota "8" é armazenada com sucesso no sistema
And nenhum e-mail de atualização de nota é enviado
And o sistema exibe uma mensagem de alerta sobre a ausência de e-mail para o aluno

Scenario: Correção de nota após a notificação diária já ter sido enviada
Given a aluna "Ana Costa" está matriculada na disciplina "Engenharia de Software"
And a nota "7" foi registrada para "Ana Costa" na data de hoje
And um e-mail de atualização de nota já foi enviado para "Ana Costa" na data de hoje
When o professor altera a nota de "Ana Costa" de "7" para "8,5" em "Engenharia de Software"
Then a nota de "Ana Costa" é atualizada para "8,5" no sistema
And nenhum novo e-mail de atualização de notas é enviado para "Ana Costa"

Scenario: Independência de notificações entre alunos diferentes
Given os alunos "Lucas Mendes" e "Carla Dias" estão matriculados na disciplina "Engenharia de Software"
And um e-mail de atualização de nota já foi enviado para "Lucas Mendes" na data de hoje
And nenhuma notificação de notas foi enviada para "Carla Dias" na data de hoje
When o professor registra a nota "9" para "Carla Dias" em "Engenharia de Software"
Then a nota "9" é armazenada com sucesso no sistema
And um e-mail de atualização de nota é enviado para "Carla Dias"
And o status de notificação de "Lucas Mendes" permanece inalterado
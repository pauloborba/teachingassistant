Cenário 1: Notificação de ter sido cadastrado em uma nova turma
Given que existe um arquivo chamado “lista.xml”
And nesse arquivo existe um aluno “pedro” com email “a@b”
When a nova turma for criada com a importação do arquivo “lista.xml”
Then será enviado um e-mail a “pedro” em “a@b” com o login dele


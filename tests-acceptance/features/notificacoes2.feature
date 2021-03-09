Cenário 2: Notificação de Nova meta cadastrada
Given que existe um arquivo chamado “lista.xml”
And este arquivo está associado à turma “a”
And nesse arquivo existe um aluno “pedro” com email “a@b”
And estou logado como “professor”
When eu cadastrar uma nova meta para “pedro”
Then será enviado um e-mail a “pedro” em “a@b” com o alerta de nova meta


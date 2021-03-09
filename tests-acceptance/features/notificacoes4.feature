Cenário 4: Notificação de situação pós-final
Given que existe um arquivo chamado “lista.xml”
And este arquivo está associado à turma “a”
And nesse arquivo existe um aluno “pedro” com email “a@b”
And estou logado como “professor”
When eu terminar de cadastrar a nota da final para “pedro”
Then será enviado um e-mail a “pedro” em “a@b” com o alerta de nova média pós-final
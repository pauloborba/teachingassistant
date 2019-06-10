Feature: notificar alunos
	As a professor responsável pela turma
	I want to notificar os alunos sobre alterações nos conceitos de suas metas através dos seus emails
	So that posso enviar uma notificação por email


Scenario: aluno com email inválido
	Given estou logado no sistema como professor com login “phmb” e senha “ess-2019”
	And estou no menu de “Avaliação de Alunos”
	And o aluno “Ewerton” está registrado no sistema com o login “egb”, CPF “453.696.418-54” e email “egbb@cin.ufpe.br”
	And esse email é inválido
	When eu altero o conceito para “MA” da meta “Análise de Requisitos”
	And seleciono a opção de “notificar”
	Then não é enviado um email para “Ewerton” notificando sobre seu conceito na meta “Análise de Requisitos”
	And posso visualizar uma mensagem de “erro” sinalizando um email inválido

Scenario: alunos com emails válidos
	Given estou logado no sistema como professor com login “phmb” e senha “Eng_Soft-2019”
	And estou no menu de “Avaliação de Alunos”
	And o aluno “Ewerton” está registrado no sistema com o login “egb”, CPF “453.696.418-54” e email “egb@cin.ufpe.br”
	And o aluno “Eduardo” está registrado no sistema com o login “els6”, CPF “623.331.359-76” e email “els6@cin.ufpe.br”
	And o aluno “Henrique” está registrado no sistema com o login “ham2”, CPF “127.346.821-44” e email “ham2@cin.ufpe.br”
	And seus emails são válidos
	When eu altero o conceito de “Ewerton” para “MPA” da meta “Análise de Requisitos”
	And altero o conceito de “Eduardo” para “MPA” da meta “Análise de Requisitos”
	And altero o conceito de “Henrique” para “MA” da meta “Gerência de Configurações”
	And seleciono a opção de “notificar”
	Then um email é enviado para “Ewerton”, “Eduardo” e “Henrique” notificando sobre a modificação no seus conceitos da meta “Análise de Requisitos”, “Análise de Requisitos”, “Gerência de Configurações”
	And posso visualizar uma mensagem de “sucesso” sinalizando que as notificações foram enviadas para os alunos

Scenario: nova notificação sobre a mesma meta
	Given estou logado no sistema como professor com login “phmb” e senha “ess-2019”
	And estou no menu de “Avaliação de Alunos”
	And o aluno “Ewerton” está registrado no sistema com o login “egb”, CPF “453.696.418-54” e email “egb@cin.ufpe.br”
	And o conceito para a meta “Gerência de Configuração” é “MPA”
	When eu altero o conceito de “Ewerton” para “MA” na meta “Gerência de Configuração”
	And seleciono a opção de “notificar”
	Then é enviando um email para “Ewerton” notificando que seu conceito foi modificado na meta “Gerência de Configuração”
	And é avisado para desconsiderar o email anterior
	And posso visualizar uma mensagem de “aviso” sinalizando que uma nova notificação sobre a mesma meta “Gerência de Configuração” foi enviada

Scenario: notificação para uma meta que ficou sem conceito
	Given estou logado no sistema como professor com login “phmb” e senha “ess-2019”
	And estou no menu de “Avaliação de Alunos”
	And o aluno “Eduardo” está registrado no sistema com o login “els6”, CPF “623.331.359-76” e email “els6@cin.ufpe.br”
	And o conceito para a meta “Gerência de Configuração” é “MA”
	When altero o conceito da meta “Gerência de Configuração” deixando sem nenhum conceito atribuído
	And seleciono a opção “notificar”
	Then posso visualizar uma mensagem de “erro” notificando que a meta “Gerência de Configuração” do aluno “Eduardo” que possuía conceito ‘MA’ atribuído, não está mais definido
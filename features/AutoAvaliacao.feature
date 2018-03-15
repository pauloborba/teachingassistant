Feature: Auto-avaliação do rendimento na disciplina
	As a aluno cursando a disciplina
	I want atribuir conceitos a determinadas metas
	So that eu estarei com os conceitos atribuídos e a auto-avaliação efetuada.
	
	Scenario: O aluno “x” está cursando a disciplina.
	Given: Existem as metas de “Aprendizado”, “Prática” e “Conceitual” 
And o aluno “X” está cadastrado no sistema.
	When: O aluno “X” atribui o conceito “MA” a meta “Aprendizado”
	And o conceito “MPA” a meta de “Prática” 
And o conceito “MA” a meta “Conceitual”.
	Then: Então o sistema vai armazenar o conceito “MA” a meta “Aprendizado”, o conceito “MPA” a metade “Prática” e o conceito “MA” a meta “Conceitual”.

Scenario: O aluno tenta realizar a auto-avaliação pela segunda vez.
	Given: O aluno “x” está armazenado no sistema
	And O aluno “x” tem o conceito “MA” a meta “Aprendizado”
	And O aluno “x” tem o conceito “MPA” a meta “Prática”
	And O aluno “x” tem o conceito “MPA” a meta “Conceitual”
	When: O aluno atribui o conceito “MPA” a meta “Aprendizado”
And o conceito “MA” a meta de “Prática”
And  o conceito “MA” a meta de “Conceitual”.
Then: O sistema não armazena a nova avaliação.

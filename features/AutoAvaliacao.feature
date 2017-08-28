        Feature:
        As a aluno de uma turma.
        I want ter a capacidade de realizar uma auto-avaliação, podendo atribuir a mim notas nas meta.
        So that criar uma julgamento próprio sobre meu desempenho e comparar este com o do professor, para finalmente tomar decisões inteligentes sobre aspectos da disciplina.


        cenário ok

        Scenario: Student wrote valid grades
Given: `Mateus` wrote “MA” in ´metas 1´ 
And: “MPA” in ´metas 2´
And: “MANA” in ´metas 3´
When: Mateus sends his grades
Then: A message will show up in the container a success message.
then: mudança

		Cenário: Professor Discrepância de auto-avaliação dos alunos e vê discrepância de 1 aluno.
		Given: Aluno “João”,”Brito”,”Castor” se auto-avaliaram na meta “metas” .
		And: na avaliação de “João” avaliação ⅗  do seus conceitos na meta “metas “ foi superior ao do professor.
And: na avaliação de “Brito” avaliação não teve do seus conceitos na
meta “metas “ superiores ao do professor.
		And: na avaliação de “Castor” avaliação ⅕  do seus conceitos na meta “metas “ foi superior ao do professor.
		When: o professor “George” for na aba de “Discrepância de auto-avaliação dos alunos”.
		Then: Ele verá a lista de alunos com o aluno “João” listado.
		And: O gráfico de discrepância está em 33% de discrepância.
		And: Quantidade de alunos discrepância igual a um.

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

		sem discrepancia 


		Cenário: Professor entra na secção Discrepância de autoavaliação dos alunos e vê lista de alunos vazia, quantidade igual a zero, percentual iguais a zero por cento.
		Given: Aluno “João”,”Brito”,”Castor” se auto-avaliaram na meta “metas” .
		And: na avaliação de “João” avaliação ⅕ do seus conceitos na meta “metas “ foi inferior ao do professor.
		And: na avaliação de “Brito” avaliação 5/5 do seus conceitos na meta “metas “ foi superior ao do professor.
		And: na avaliação de “Castor” avaliação teve do seus conceitos na meta “metas “ iguais ao do professor.
		When: Quando o professor “George” entra na secção “Discrepância de auto-avaliação dos alunos”.
		Then: Ele verá a lista de alunos com discrepância vazia.
		And: O gráfico de discrepância vazio.
		And: Quantidade de alunos de discrepância igual a zero.

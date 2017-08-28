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
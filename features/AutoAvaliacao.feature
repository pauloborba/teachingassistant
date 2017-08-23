FEATURE: Auto-avaliação de aluno.
AS A aluno cadastrado no sistema e cursando uma disciplina
I WANT TO fazer auto-avaliação em uma disciplina
SO THAT eu possa comparar minha percepção do meu desempenho na disciplina com a avaliação do professor.

Scenario: Submissão de auto-avaliação de “Luis Santos” bem sucedida GUI
Given o aluno “Luis Santos” está na página de auto-avaliação
And a avaliação de “Luis Santos” feita pelo professor é “MA”, “MPA”, “MANA”, “MPA”, “MPA” e “MPA”
When o aluno preenche os campos de auto-avaliação com “MA”, “MPA”, “MPA”, “MA”, “MPA” e “MPA” 
And o aluno submete a auto-avaliação
Then o aluno pode ver uma mensagem confirmando que a submissão foi bem sucedida

Scenario: Submissão de auto-avaliação de “Luis Santos” bem sucedida
Given o aluno “Luis Santos” está com a avaliação foi feita para as seis metas
And os conceitos dados pelo professor são “MA”, “MPA”, “MANA”, “MPA”, “MPA” e “MPA”
When o aluno submete a auto-avaliação com os conceitos “MA”, “MPA”, “MPA”, “MA”, “MPA” e “MPA” 
Then a auto-avaliação é armazenada no sistema

Scenario: Submissão de auto-avaliação de “Luis Santos” mal sucedida GUI
Given o aluno “Luis Santos” está na página de auto-avaliação
And a avaliação de “Luis Santos” feita pelo professor é “MA”, “MPA”, “MANA”, “MPA”, “MPA” e “MPA”
When o aluno preenche os campos de auto-avaliação com “MA”, “MPA”, “MPA”, e “MA” 
And o aluno submete a auto-avaliação
Then o aluno pode ver uma mensagem: “É necessário preencher todos com campos antes de submeter a avaliação”

Scenario: Submissão de auto-avaliação de “Luis Santos” mal sucedida
Given o aluno “Luis Santos” está com a avaliação feita pelo professor nas seis metas
And os conceitos dados pelo professor são “MA”, “MPA”, “MANA”, “MPA”, “MPA” e “MPA”
When o aluno submete a auto-avaliação com os conceitos “MA”, “MPA”, “MPA” e “MA”
Then a auto-avaliação não é armazenada no sistema
And encerra

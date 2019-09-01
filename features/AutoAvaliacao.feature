Feature: Autoavaliação
As a Aluno
I want to Fazer a minha autoavaliação em todas metas de uma determinada disciplina e ao mesmo tempo poder ver a avaliação dada pelo professor
So that Eu possa dar meu feedback do que acredito ter sido meu desempenho na disciplina e compará-lo com a avaliação dada pelo professor.

Scenario: Preenchimento da autoavaliação (bem sucedido).
Given Eu estou na página da autoavaliação daquela disciplina
And Todos os campos referentes à minha autoavaliação estão com o símbolo "!"
When Eu preencho todos os campos com o meu conceito
Then Ao lado de cada conceito aparecerão dois tiques e a área de confirmar se tornará clicável e mais visível.

Scenario: Preenchimento da autoavaliação (mal sucedido).
Given Estou na página de autoavaliação daquela disciplina
When Eu não preencho todos os campos com meu conceito e tento concluir a autoavaliação
Then A caixa da meta que não foi avaliada ficará vermelha
And Lançará uma notificação indicando o erro

Scenario: Consulta ao sistema quando não há discrepância
Given Eu estou na página de notas e autoavaliação da disciplina
And Vejo que “Avaliações consistentes” está com 100% dos alunos
And As “Avaliações inconsistentes” não possuem alunos
When Clico para ver mais sobre cada grupo
Then Vejo uma mensagem indicando a ausência de avaliações discrepantes
And Para as avaliações consistentes, vejo os nomes, grau de consistência (< 25%) e as metas com inconsistência (no caso, apenas para o primeiro aluno terá o campo de detalhes expansível)
And Será visualizável o conceito dado por mim e a avaliação do aluno.

Scenario: Consulta ao sistema quando há discrepância
Given Eu estou na página de notas e autoavaliação da disciplina
And Vejo que “Avaliações consistentes” está com 66% dos alunos (2)
And As “Avaliações inconsistentes” está com 33% possuem alunos (1)
When Clico para ver mais detalhes de cada cenário
Then Vejo que o campo de “avaliações inconsistentes” terá um aluno, indicando seu nome, grau de inconsistência  e um campo de detalhes
And O campo de detalhes, o qual dirá explicitamente onde houve discrepância e os conceitos atribuídos por cada um
And No campo de “avaliações consistentes” terá dois alunos, com nome, grau de inconsistência 0% e nenhum botão para detalhes a mais.


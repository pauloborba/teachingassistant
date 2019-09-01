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

Feature: Auto Avaliação
As an Aluno de ESS
I want to realizar minha auto avaliação para que, junto com o professor, analisar o que foi aprendido e onde estão as dificuldades no assunto

Scenario: Auto-Avaliação Parcial
Given Aluno “X” ainda não preencheu sua auto avaliação com “MA, MPA, MANA” nas perguntas “A, B, C”
When Aluno “X” não preenche uma ou mais das perguntas “A, B, C” com “MA, MPA, MANA”
Then Sistema não grava a auto avaliação do Aluno “X”

Scenario: Auto-Avaliação Parcial
Given Aluno “X” está na página de Auto-Avaliação
When Aluno “X” deixa de responder uma das perguntas “A, B, C”
Then Uma mensagem de erro aparece
And aparece um passo adicional (???)

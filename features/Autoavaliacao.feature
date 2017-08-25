Feature: Auto-avaliação de metas
Como aluno
Eu quero preencher a auto-avaliação
Para que eu possa analisar meu desempenho 
E obter meus resultados.

Cenário: Preenchimento completo da auto-avaliação
Dado que estou na página “Avaliação de metas”
E que o aluno “João Victor” obteve os conceitos “MPA, MPA, MPA, MANA”
Quando preencho os conceitos “MPA, MA, MANA, MPA”.
Então posso ver os conceitos “MPA, MPA, MPA, MANA” atribuídos pelo professor abaixo de “Resultados”.

Cenário: Preenchimento com sucesso da auto-avaliação
Dado que o aluno “João Victor” obteve os conceitos “MPA, MPA, MPA, MANA”
Quando ele enviar as metas “MPA, MA, MANA, MPA” na auto-avaliação
Então ele terá acesso aos conceitos “MPA, MPA, MPA, MANA” atribuídos pelo professor.
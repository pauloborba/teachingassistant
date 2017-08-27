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

Cenário: Auto-avaliação incompleta
Dado que estou na página “Avaliação de Metas”
Quando seleciono apenas os conceitos “MPA, MA” nas metas “A” e “B”. 
Então posso ver uma mensagem de erro que pede para que os conceitos das outras metas sejam preenchidos.
E nenhum conceito atribuído pelo professor é exibido abaixo de “Resultados”.

Cenário: Auto-avaliação mal sucedida
Dado que o aluno “João Victor” obteve os conceitos “MPA, MPA, MPA, MANA” 
Quando ele preenche apenas os conceitos “MPA, MA” nas metas “A” e “B”.
Então o aluno não tem acesso aos conceitos atribuídos pelo professor.
E a avaliação não é concluída.

Cenário: Auto-avaliações sem discrepância
Dado que os alunos “João Victor”, “Homero Barros” e “Paulo Henrique” obtiveram discrepância de 20%, 0% e 0%.
Quando o professor acessa a página de avaliação de discrepância.
Então ele vê abaixo de “Quantidade” que 0 alunos obtiveram auto-avaliações discrepantes.
E vê abaixo de “Porcentagem” que 0% dos alunos obtiveram auto-avaliações discrepantes.

Cenário: Auto-avaliações discrepantes.
Dado que os alunos “João Victor”, “Homero Barros” e “Paulo Henrique” obtiveram discrepância de 0%, 40% e 20%.
Quando o professor acessa a página de avaliação de discrepância.
Então ele vê abaixo de “Quantidade” que 1 aluno obteve auto-avaliação discrepante.
E vê abaixo de “Porcentagem” que 33% dos alunos obtiveram auto-avaliações discrepantes.	
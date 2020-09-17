Envio de email com atualização das notas do aluno
Cenário: Preenchimento de auto-avaliação pelo aluno.
Dado que estou logado como “aluno”
E que estou na página de “notas”
E que vejo a seção de “auto-avaliação”
Quando seleciono a seção de “auto-avaliação”
E insiro “nota,nota,nota,nota”
Então ainda estou na página de “notas”
E posso ver que “nota,nota,nota,nota” foi inserido com sucesso

Cenário: Mal-preenchimento de auto-avaliação pelo aluno.
Dado que estou logado como “aluno”
E que estou na página de “notas”
E que vejo a seção de “auto-avaliação”
Quando seleciono a seção de “auto-avaliação”
E insiro “nota,nota,nota,-”
Então ainda estou na página de “notas”
E posso ver que “nota,nota,nota,-” não foi inserido
E o sistema mostra que não foi inserido devido a ausência de conceitos

then sugestão do stake holder
Cenário: Solicitação de avaliação de discrepância pelo professor. nDado que estou logado como professor nE que estou na página de “notas” nE que vejo a seção de avaliação de discrepância nQuando solicito “quantidade de alunos discrepantes” nEntão ainda estou na página de “notas” nE vejo que o valor “quantidade de alunos discrepantes”, “percentual de alunos discrepantes” e “lista de alunos discrepantes” são “1”, “33%” e “aluno”.

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

Cenário: Solicitação de avaliação de discrepância pelo professor. 
 Dado que estou logado como professor 
 E que estou na página de “notas” 
 E que vejo a seção de “avaliação de discrepância” 
 Quando solicito a “quantidade de alunos discrepantes” 
 Então ainda estou na página de “notas” 
 E vejo que o valor “quantidade de alunos discrepantes”, “percentual de alunos discrepantes” e “lista de alunos discrepantes” são “0”, “0%” e “lista vazia”.

Cenário: Solicitação de avaliação de discrepância pelo professor. 
 Dado que estou logado como professor 
 E que estou na página de “notas” 
 E que vejo a seção de avaliação de discrepância 
 Quando solicito “quantidade de alunos discrepantes” 
 Então ainda estou na página de “notas” 
 E vejo que o valor “quantidade de alunos discrepantes”, “percentual de alunos discrepantes” e “lista de alunos discrepantes” são “1”, “33%” e “aluno”.

solicitação de mudança mais significativa no cenário de visualização em que há discrepância

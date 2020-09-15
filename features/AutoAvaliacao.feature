Feature: auto-avaliação
As a aluno com a tarefa de avaliar suas metas
I want avaliar cada uma de suas metas com “MA, MPA ou MANA”
So that o professor possa ter o feedback em relação ao desempenho do aluno de acordo com a ótica do estudante.


GUI:
Scenario: preenchimento bem sucedido da auto-avaliação
Given: Acesso no menu lateral a opção “Auto avaliação”
When: Vejo a coluna de “Auto-avaliação” e em baixo tem os campos “Insira sua nota aki”.
And: escrevo a nota “MPA” no primeiro conceito
And: escrevo a nota “MA” no segundo conceito
And: escrevo a nota “MA” no terceiro conceito
And: escrevo a nota “MA” no quarto conceito
Then: verifico que ficou salvo a nota “MPA” no primeiro conceito 
And: no segundo conceito ficou “MA”
And: no terceiro conceito ficou “MA”
And: no quarto conceito ficou “MA”
And: Clico no botão “Calcular Nota” 
And: A nota foi calculada automaticamente no final.

GUI:
Scenario: auto-avaliação GUI preenchida errada
Given: Acesso no menu lateral a opção “Auto avaliação”
When: Vejo a coluna de “Auto-avaliação” e em baixo tem os campos “Insira sua nota aki”.
Then: preencho no primeiro conceito “MA”
And: preencho no terceiro conceito “MPA”
And: Clico no botão 
And: a nota não foi calculada automaticamente.

GUI:
Scenario: quando não há nenhuma discrepância
Given: Um professor loga no sistema e acessa no menu lateral a opção “Auto avaliação”.
When: Vejo a coluna de “Nome do aluno” e ao lado a coluna “Discrepância”.
And: Verifica que a coluna de “Nome do Aluno” não tem mais nada em baixo.
And: Verifica que a coluna de “Auto avaliação” não tem mais nada em baixo.
Then: Como os campos estão vazios, o professor pode concluir que não tem nem um aluno com discrepância de nota
And: pode apertar no botão “Verificar todos os alunos” e será redirecionado para a página com a nota de todos os alunos, vendo que realmente nem uma nota está discrepante.

Scenario: quando há discrepância em um aluno
Given: Um professor loga no sistema e acessa no menu lateral a opção “Auto avaliação”.
When: Vejo a coluna de “Nome do aluno” e ao lado a coluna “Discrepância”.
And: Verifica que a coluna de “Nome do Aluno” tem o nome do aluno “Anderson” e que possui uma discrepância de 25%.
Then: Quando clico em cima do Aluno “Anderson” sou redirecionado para à página onde tem as notas dele da auto-avaliação
And: Quando volto para a página, vejo que ainda tem o nome do aluno “Anderson” e sua discrepância “25%”.

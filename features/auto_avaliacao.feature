Feature: auto-avaliação dos alunos
        As a : aluno.
    I want to: registrar as minhas auto-avaliações para cada meta de aprendizado de uma determinada disciplina. 
So that: o professor consiga ter acesso a essas auto-avaliações e possa então identificar quais alunos estão realizando auto-avaliações discrepantes. 

Mudança na última linha

Nova modificação

Scenario: não há discrepâncias nas auto-avaliações dos alunos.

Given: o professor está na página inicial das auto-avaliações dos alunos.
And: dado que um aluno tem conceito superior ao professor em 1 de 5 metas, outro só tem conceitos inferiores ao do professor e outro aluno só tem conceitos iguais. 
When: quando o professor solicitar “resolver”.
Then: aparecer na tela que não há alunos com discrepâncias. 
And adição de cláusula

Scenario: há discrepâncias nas auto-avaliações dos alunos.

Given: o professor está na página inicial das auto-avaliações dos alunos.
When: quando o professor solicitar a análise.
And: dada que há discrepância em 1 de 3 alunos cadastrados. 
When: quando o professor solicitar “resolver”.
Then: aparecer na tela as informações (nome, CPF, % de discrepância) do aluno que possui discrepância. 


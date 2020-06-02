Feature: Auto-avaliação 
As a: Estudante
I want to:  Adicionar e registrar, todas as minhas auto-avaliações em relação às metas de aprendizagem.
so that: Seja feita uma comparação de notas com a do professor, e assim poder progredir e ver minhas possíveis falhas.

(GUI)Scenario: Auto-avaliação bem sucedida.
Given eu estou na pagina de auto-avaliação.
And eu vejo a linha de “Sua avaliação” em branco.
When eu preencho toda a linha de “Sua avaliação” com os valores das metas de aprendizagem possíveis “MA,MA,MPA…” para cada meta confirmando a auto-avaliação.
Then eu continuo na página de auto-avaliação.
And as notas que preenchi estão aparecendo na linha de “Sua avaliação”.
And agora aparecem as notas das metas  da linha “Avaliação Professor”.

(Serviço)Scenario: Auto-avaliação bem sucedida.
Given o estudante “Robson Oliveira” está cadastrado no sistema, com as notas “MA,MNA,MPA”, atribuídas como avaliações do professor.
When o aluno realiza a sua própria auto-avaliação, atribuindo todas as notas “MA,MA,MPA” e confirma.
Then o sistema analisa se as todas as metas foram preenchidas, afirma um sucesso e confirma a operação.
And a auto-avaliação de “Robson Oliveira” é salva no sistema com as notas que foi atribuídas. Tudo certinho.

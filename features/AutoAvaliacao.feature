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
And a auto-avaliação de “Robson Oliveira” é salva no sistema com as notas que foi atribuídas.

(GUI)Scenario: Auto-avaliação mal sucedida.
Given eu estou na pagina de auto-avaliação.
And eu vejo a linha de “Sua avaliação” em branco.
When eu faço o preenchimento de algumas partes da linha de “Sua avaliação” com os valores das metas de aprendizagem possíveis “MA,MA” para as meta e confirmo a auto-avaliação. 
Then eu continuo na página de auto-avaliação.
And recebo um aviso de operação mal-sucedida.
And não aparecem as notas para as metas dadas pelo professor, nem as notas para as metas que dei anteriormente.

(Serviço)Scenario: Auto-avaliação mal sucedida.
Given o estudante “Xavier Simões” está cadastrado no sistema, com as notas “MA,MANA,MPA”, atribuídas como avaliações do professor.
When o aluno realiza a sua própria auto-avaliação, atribuindo algumas notas de valores “MA,MA” e confirma
Then o sistema analisa se as todas as metas foram preenchidas, afirma uma falha
And nega a operação
And a auto-avaliação de “Xavier Simões” não salva no sistema com as notas que foi atribuídas.

Scenario: Verificação da discrepância quando não há nenhuma discrepância.
Given eu estou na página de “Visão geral da disciplina”.
And eu visualizo a lista de alunos que contém “Fernanda, Carlos e Daniela”
And vejo relacionado a aluna “Fernanda”, a seguinte autoavaliação “Entender conceitos de requisitos”: “MPA”, “Especificar requisitos com qualidade” como “MA”, “Entender conceitos de gerência de configuração”: “MA”, “Construir cenários ideais”: “MPA”, “Elicitar com qualidade”: “MPA”. 
And mostrando logo ao lado as notas atribuídas por mim a “Fernanda” da seguinte maneira: “Entender conceitos de requisitos” como “MA”,  “Especificar requisitos com qualidade” como “MA”, “Entender conceitos de gerência de configuração” como “MA”, “Construir cenários ideais” com “MA”, “Elicitar com qualidade” com “MPA”.
And vejo relacionado ao aluno “Carlos”, a seguinte autoavaliação “Entender conceitos de requisitos”: “MPA”, “Especificar requisitos com qualidade” como “MPA”, “Entender conceitos de gerência de configuração”: “MPA”, “Construir cenários ideais”: “MPA”, “Elicitar com qualidade”: “MANA”. 
And mostrando logo ao lado as notas atribuídas por mim a “Carlos” da seguinte maneira: “Entender conceitos de requisitos” como “MA”,  “Especificar requisitos com qualidade” como “MA”, “Entender conceitos de gerência de configuração” como “MA”, “Construir cenários ideais” com “MA”, “Elicitar com qualidade” com “MPA”.
And vejo relacionado a aluna “Daniela”, a seguinte autoavaliação “Entender conceitos de requisitos”: “MPA”, “Especificar requisitos com qualidade” como “MA”, “Entender conceitos de gerência de configuração”: “MA”, “Construir cenários ideais”: “MANA”, “Elicitar com qualidade”: “MPA”. 
And mostrando logo ao lado as notas atribuídas por mim a “Daniela” da seguinte maneira: “Entender conceitos de requisitos” como “MPA”,  “Especificar requisitos com qualidade” como “MA”, “Entender conceitos de gerência de configuração” como “MA”, “Construir cenários ideais” com “MANA”, “Elicitar com qualidade” com “MPA”.
When eu peço ao sistema fazer a análise de discrepância.
Then sou redirecionado a página “Análise de Discrepância”.
And aparece um aviso indicando error.

Scenario: Verificação da discrepância quando há discrepância de 1 em 3 alunos.
Given eu estou na página de “Visão geral da disciplina”.
And eu visualizo a lista de alunos que contém “Marcos, Daniel e Kiko”
And vejo relacionado ao aluno “Marcos”, a seguinte autoavaliação “Entender conceitos de requisitos”: “MPA”, “Especificar requisitos com qualidade” como “MPA”, “Entender conceitos de gerência de configuração”: “MA”, “Construir cenários ideais”: “MPA”, “Elicitar com qualidade”: “MPA”. 
And mostrando logo ao lado as notas atribuídas por mim a “Marcos” da seguinte maneira: “Entender conceitos de requisitos” como “MANA”,  “Especificar requisitos com qualidade” como “MANA”, “Entender conceitos de gerência de configuração” como “MA”, “Construir cenários ideais” com “MA”, “Elicitar com qualidade” com “MPA”.
And vejo relacionado ao aluno “Daniel”, a seguinte autoavaliação “Entender conceitos de requisitos”: “MPA”, “Especificar requisitos com qualidade” como “MPA”, “Entender conceitos de gerência de configuração”: “MPA”, “Construir cenários ideais”: “MPA”, “Elicitar com qualidade”: “MANA”. 
And mostrando logo ao lado as notas atribuídas por mim a “Daniel” da seguinte maneira: “Entender conceitos de requisitos” como “MA”,  “Especificar requisitos com qualidade” como “MA”, “Entender conceitos de gerência de configuração” como “MA”, “Construir cenários ideais” com “MA”, “Elicitar com qualidade” com “MANA”.
And vejo relacionado ao aluno “Kiko”, a seguinte autoavaliação “Entender conceitos de requisitos”: “MPA”, “Especificar requisitos com qualidade” como “MA”, “Entender conceitos de gerência de configuração”: “MA”, “Construir cenários ideais”: “MANA”, “Elicitar com qualidade”: “MPA”. 
And mostrando logo ao lado as notas atribuídas por mim a “Kiko” da seguinte maneira: “Entender conceitos de requisitos” como “MPA”,  “Especificar requisitos com qualidade” como “MA”, “Entender conceitos de gerência de configuração” como “MA”, “Construir cenários ideais” com “MANA”, “Elicitar com qualidade” com “MPA”.
When eu peço ao sistema fazer a análise de discrepância.
Then sou redirecionado a página “Análise de Discrepância”.
And visualizo uma tabela contendo apenas o aluno de nome “Marcos”, associado com 40% de discrepância.
And Vejo como informação a quantidade total de alunos da disciplina “3”.
And o número de alunos discrepantes “1”.
And a porcentagem aproximada de “33,3%” de alunos discrepantes totais da disciplina.
And vejo um botão para voltar a página de “visão geral da disciplina” Alguma coisa Alguma coisa 2.



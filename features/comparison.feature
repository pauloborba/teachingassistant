Feature: Comparação de Desempenho
  Como um professor
  Eu quero ver um gráfico do desempenho de duas ou mais turmas
  Para que eu possa compará-las em relação a uma métrica

Scenario Outline: Sucesso na geração do gráfico de desempenho em cada métrica
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "<disciplina>" existe na lista de disciplinas
    And a turma "<turma1>" possui "<valor1>" de média e existe na lista de turmas da disciplina "<disciplina>"
    And a turma "<turma2>" possui "<valor2>" de média e existe na lista de turmas da disciplina "<disciplina>"
  When eu seleciono a disciplina "<disciplina>"
    And eu seleciono a turma "<turma1>"
    And eu seleciono a turma "<turma2>"
    And eu seleciono a métrica "<métrica>"
    And eu solicito a geração do gráfico de desempenho
  Then eu consigo ver um gráfico de colunas com o título "<métrica>" abaixo das seleções
    And o eixo X do gráfico possui as turmas "<turma1>" e "<turma2>"
    And o eixo Y do gráfico possui o valor "<valor1>" determinando a altura da coluna da turma "<turma1>"
    And o eixo Y do gráfico possui o valor "<valor2>" determinando a altura da coluna da turma "<turma2>"
  Exemples:
  | métrica                               | disciplina                                 | turma1  | turma2  | valor1 | valor2 |
  | Média                                 | Engenharia de Software e Sistemas          | T0-24.1 | T0-24.2 | 8.4    | 7.8    |
  | Número de alunos aprovados            | Sinais e Sistemas para Computação          | T1-26.1 | T2-26.1 | 42     | 37     |
  | Número de alunos aprovados por nota   | Eletrônica para Computação                 | T1-24.2 | T3-25.1 | 5      | 4      |
  | Número de alunos reprovados por nota  | Fundamentos de Redes de Computadores       | T0-25.2 | T2-26.1 | 1      | 3      |
  | Número de alunos reprovados por falta | Complementos da Matemática para Computação | T1-26.1 | T2-26.1 | 2      | 0      |

Scenario: Sucesso na geração do gráfico de desempenho ao selecionar múltiplas turmas
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Teoria da Computação" existe na lista de disciplinas
    And a turma "T1-24.2" possui "5" alunos aprovados por nota e existe na lista de turmas da disciplina "Teoria da Computação"
    And a turma "T2-24.2" possui "2" alunos aprovados por nota e existe na lista de turmas da disciplina "Teoria da Computação"
    And a turma "T1-25.1" possui "1" alunos aprovados por nota e existe na lista de turmas da disciplina "Teoria da Computação"
    And a turma "T2-25.1" possui "7" alunos aprovados por nota e existe na lista de turmas da disciplina "Teoria da Computação"
  When eu seleciono a disciplina "Teoria da Computação"
    And eu seleciono a turma "T1-24.2"
    And eu seleciono a turma "T2-24.2"
    And eu seleciono a turma "T1-25.1"
    And eu seleciono a turma "T2-25.1"
    And eu seleciono a métrica "Número de alunos aprovados por nota"
    And eu solicito a geração do gráfico de desempenho
  Then eu consigo ver um gráfico de colunas com o título "Número de alunos aprovados por nota" abaixo das seleções
    And o eixo X do gráfico possui as turmas "T1-24.2", "T2-24.2", "T1-25.1" e "T2-25.1"
    And o eixo Y do gráfico possui o valor "5" determinando a altura da coluna da turma "T1-24.2"
    And o eixo Y do gráfico possui o valor "2" determinando a altura da coluna da turma "T2-24.2"
    And o eixo Y do gráfico possui o valor "1" determinando a altura da coluna da turma "T1-25.1"
    And o eixo Y do gráfico possui o valor "7" determinando a altura da coluna da turma "T2-25.1"

Scenario: Sucesso na geração do gráfico de desempenho ao selecionar múltiplas métricas
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Sistemas Operacionais" existe na lista de disciplinas
    And a turma "T1-25.1" possui "8.1" de média, "58" alunos aprovados e existe na lista de turmas da disciplina "Sistemas Operacionais"
    And a turma "T2-25.2" possui "9.0" de média, "47" alunos aprovados e existe na lista de turmas da disciplina "Sistemas Operacionais"
  When eu seleciono a disciplina "Sistemas Operacionais"
    And eu seleciono a turma "T1-25.1"
    And eu seleciono a turma "T2-25.2"
    And eu seleciono a métrica "Média"
    And eu seleciono a métrica "Número de aprovados"
    And eu solicito a geração do gráfico de desempenho
  Then eu consigo ver um gráfico de colunas com o título "Média" abaixo das seleções
    And eu consigo ver um gráfico de colunas com o título "Número de aprovados" abaixo do primeiro gráfico
    And o eixo X de ambos os gráficos possui as turmas "T1-25.1" e "T2-25.2"
    And o eixo Y do gráfico "Média" possui o valor "8.1" determinando a altura da coluna da turma "T1-25.1"
    And o eixo Y do gráfico "Média" possui o valor "9.0" determinando a altura da coluna da turma "T2-25.2"
    And o eixo Y do gráfico "Número de aprovados" possui o valor "58" determinando a altura da coluna da turma "T1-25.1"
    And o eixo Y do gráfico "Número de aprovados" possui o valor "47" determinando a altura da coluna da turma "T2-25.2"

Scenario: Sucesso na geração do gráfico de desempenho mesmo selecionando turma sem dados cadastrados
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Introdução à Computação" existe na lista de disciplinas
    And a turma "T0-24.1" possui "9.8" de média e existe na lista de turmas da disciplina "Introdução à Computação"
    And a turma "T0-24.2" possui "9.4" de média e existe na lista de turmas da disciplina "Introdução à Computação"
    And a turma "T0-25.1" não possui dados cadastrados e existe na lista de turmas da disciplina "Introdução à Computação"
  When eu seleciono a disciplina "Introdução à Computação"
    And eu seleciono a turma "T0-24.1"
    And eu seleciono a turma "T0-24.2"
    And eu seleciono a turma "T0-25.1"
    And eu seleciono a métrica "Média"
    And eu solicito a geração do gráfico de desempenho
  Then eu consigo ver um gráfico de colunas com o título "Média" abaixo das seleções
    And o eixo X do gráfico possui as turmas "T0-24.1" e "T0-24.2"
    And o eixo Y do gráfico possui o valor "9.8" determinando a altura da coluna da turma "T0-24.1"
    And o eixo Y do gráfico possui o valor "9.4" determinando a altura da coluna da turma "T0-24.2"
    And eu consigo ver uma mensagem de aviso afirmando que a turma "T0-25.1" não possui dados cadastradas

Scenario: Falha na geração do gráfico de desempenho ao selecionar apenas uma turma
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Banco de Dados" existe na lista de disciplinas
    And a turma "T1-25.1" possui "9.4" de média e existe na lista de turmas da disciplina "Banco de Dados"
  When eu seleciono a disciplina "Banco de Dados"
    And eu seleciono a turma "T1-25.1"
    And eu seleciono a métrica "Média"
    And eu solicito a geração do gráfico de desempenho
  Then o sistema não exibe o gráfico de desempenho
    And eu consigo ver uma mensagem de erro solicitando a seleção de ao menos 2 turmas

Scenario: Falha na geração do gráfico de desempenho ao não selecionar disciplina alguma
  Given eu estou na página "Comparação de Desempenho"
  When eu seleciono a métrica "Número de alunos aprovados"
    And eu solicito a geração do gráfico de desempenho
  Then o sistema não permite selecionar turmas
    And o sistema não exibe o gráfico de desempenho
    And eu consigo ver uma mensagem de erro solicitando a seleção de uma disciplina

Scenario: Falha na geração do gráfico de desempenho ao não selecionar turma alguma
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Laboratório de Eletrônica" existe na lista de disciplinas
  When eu seleciono a disciplina "Laboratório de Eletrônica"
    And eu seleciono a métrica "Número de alunos reprovados por nota"
    And eu solicito a geração do gráfico de desempenho
  Then o sistema não exibe o gráfico de desempenho
    And eu consigo ver uma mensagem de erro solicitando a seleção de ao menos 2 turmas

Scenario: Falha na geração do gráfico de desempenho ao não selecionar métrica alguma
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Engenharia de Software e Sistemas" existe na lista de disciplinas
    And a turma "T1-26.1" existe na lista de turmas da disciplina "Engenharia de Software e Sistemas"
    And a turma "T2-26.1" existe na lista de turmas da disciplina "Engenharia de Software e Sistemas"
  When eu seleciono a disciplina "Engenharia de Software e Sistemas"
  And eu seleciono a turma "T1-26.1"
  And eu seleciono a turma "T2-26.1"
  And eu solicito a geração do gráfico de desempenho
  Then o sistema não exibe o gráfico de desempenho
  And eu consigo ver uma mensagem de erro solicitando a seleção de ao menos 1 métrica

Scenario: Falha na geração do gráfico de desempenho ao selecionar turma sem dados cadastrados
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Engenharia de Software e Sistemas" existe na lista de disciplinas
    And a turma "T1-26.1" possui dados cadastrados e existe na lista de turmas da disciplina "Engenharia de Software e Sistemas"
    And a turma "T2-26.1" não possui dados cadastrados e existe na lista de turmas da disciplina "Engenharia de Software e Sistemas"
  When eu seleciono a disciplina "Engenharia de Software e Sistemas"
    And eu seleciono a turma "T1-26.1"
    And eu seleciono a turma "T2-26.2"
    And eu seleciono a métrica "Média"
    And eu solicito a geração do gráfico de desempenho
  Then o sistema não exibe o gráfico de desempenho
  And eu consigo ver uma mensagem de aviso afirmando que a turma "T2-26.2" não possui dados cadastradas

Scenario: Comportamento ao selecionar uma turma já selecionada
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Lógica para Computação" existe na lista de disciplinas
    And a turma "T1-26.1" existe na lista de turmas da disciplina "Lógica para Computação"
  When eu seleciono a disciplina "Lógica para Computação"
  And eu seleciono a turma "T1-26.1"
  And eu seleciono novamente a turma "T1-26.1"
  Then o sistema remove a seleção da turma "T1-26.1"

Scenario: Comportamento ao selecionar uma disciplina diferente da já selecionada
  Given eu estou na página "Comparação de Desempenho"
    And a disciplina "Introdução à Programação" existe na lista de disciplinas
    And a disciplina "Aprendizado de Máquina" existe na lista de disciplinas
    And a disciplina "Introdução à Programação" está selecionada
  When eu seleciono a disciplina "Aprendizado de Máquina"
  Then o sistema remove a seleção da disciplina "Introdução à Programação"
    And o sistema mantém a disciplina "Aprendizado de Máquina" selecionada
    

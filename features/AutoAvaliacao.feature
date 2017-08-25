Scenario: fazer a auto-avaliação
Given eu estou na tela de realizar a auto-avaliação
And estou vendo as notas do professor
When eu preencho todos os campos das notas de auto-avaliação
Then uma tela de confirmação das notas cadastradas é mostrada

Scenario: cadastrar as notas de auto-avaliação
Given que as notas do professor “y” estão no sistema
And não existe auto-avaliação do aluno “x”
When todas notas de auto-avaliação do aluno “x” são inseridas
Then as nota de auto-avaliação são cadastradas no sistema

Scenario: cadastrar notas de auto-avaliação mal sucedida
Given que as notas do professor “y” estão no sistema
And o aluno “x” não possue auto-avaliação no sistema
When as notas de auto-avaliação do aluno “x” são inseridas
And faltou alguma nota ser inserida
Then o sistema não cadastra as notas de auto-avaliação do aluno “x”

Scenario: fazer a auto-avaliação mal sucedida
Given eu estou na tela de realizar a auto-avaliação
When eu preencho as notas de auto-avaliação
And não preencho todas as notas
Then uma tela de erro é mostrada.

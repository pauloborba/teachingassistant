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
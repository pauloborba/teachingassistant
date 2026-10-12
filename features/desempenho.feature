
Feature: Notificações de desempenho relativo da turma

   Scenario: Notificação para aluno classificado no primeiro quartil
      Given a turma "2026.2 de Engenharia de Software" possui "40" alunos com desempenho registrado
      And o aluno "Carlos Silva" possui conceito "MA" e desempenho "92 pontos"
      And o desempenho de "Carlos Silva" está entre os "10 maiores desempenhos" da turma
      When o sistema atualiza a classificação de desempenho da turma
      Then o sistema envia uma notificação para "Carlos Silva"
      And a notificação informa que "Carlos Silva" está entre os "25% melhores" da turma
      And a notificação apresenta o conceito "MA" de "Carlos Silva"
      And a notificação não apresenta os nomes, conceitos ou desempenhos dos demais alunos


   Scenario: Notificação para aluno classificado no segundo quartil
      Given a turma "2026.2 de Engenharia de Software" possui "40" alunos com desempenho registrado
      And o aluno "Carlos Silva" possui conceito "MPA" e desempenho "76 pontos"
      And o desempenho de "Carlos Silva" está entre o "11º" e o "20º" maior desempenho da turma
      When o sistema atualiza a classificação de desempenho da turma
      Then o sistema envia uma notificação para "Carlos Silva"
      And a notificação informa que "Carlos Silva" está entre os "25% a 50% melhores" da turma
      And a notificação apresenta o conceito "MPA" de "Carlos Silva"
      And a notificação não apresenta os nomes, conceitos ou desempenhos dos demais alunos


   Scenario: Notificação para aluno classificado no terceiro quartil
      Given a turma "2026.2 de Engenharia de Software" possui "40" alunos com desempenho registrado
      And o aluno "Carlos Silva" possui conceito "MPA" e desempenho "61 pontos"
      And o desempenho de "Carlos Silva" está entre o "21º" e o "30º" maior desempenho da turma
      When o sistema atualiza a classificação de desempenho da turma
      Then o sistema envia uma notificação para "Carlos Silva"
      And a notificação informa que "Carlos Silva" está entre os "50% a 75% melhores" da turma
      And a notificação apresenta o conceito "MPA" de "Carlos Silva"
      And a notificação não apresenta os nomes, conceitos ou desempenhos dos demais alunos


   Scenario: Notificação para aluno classificado no quarto quartil
      Given a turma "2026.2 de Engenharia de Software" possui "40" alunos com desempenho registrado
      And o aluno "Carlos Silva" possui conceito "MANA" e desempenho "48 pontos"
      And o desempenho de "Carlos Silva" está entre os "10 menores desempenhos" da turma
      When o sistema atualiza a classificação de desempenho da turma
      Then o sistema envia uma notificação para "Carlos Silva"
      And a notificação informa que "Carlos Silva" está entre os "25% inferiores" da turma
      And a notificação apresenta o conceito "MANA" de "Carlos Silva"
      And a notificação não apresenta os nomes, conceitos ou desempenhos dos demais alunos


   Scenario: Notificação de mudança para um quartil superior
      Given a turma "2026.2 de Engenharia de Software" possui "40" alunos com desempenho registrado
      And o aluno "Carlos Silva" possui conceito "MPA"
      And na classificação anterior o desempenho de "Carlos Silva" estava entre o "11º" e o "20º" maior desempenho da turma
      And o novo desempenho de "Carlos Silva" é "89 pontos"
      And o novo desempenho de "Carlos Silva" está entre os "10 maiores desempenhos" da turma
      When o sistema atualiza a classificação de desempenho da turma
      Then o sistema envia uma notificação para "Carlos Silva"
      And a notificação informa que houve uma melhora no desempenho relativo
      And a notificação informa que "Carlos Silva" passou do "segundo quartil" para o "primeiro quartil"
      And a notificação não apresenta os nomes, conceitos ou desempenhos dos demais alunos


   Scenario: Notificação de mudança para um quartil inferior
      Given a turma "2026.2 de Engenharia de Software" possui "40" alunos com desempenho registrado
      And o aluno "Carlos Silva" possui conceito "MANA"
      And na classificação anterior o desempenho de "Carlos Silva" estava entre os "10 maiores desempenhos" da turma
      And o novo desempenho de "Carlos Silva" é "52 pontos"
      And o novo desempenho de "Carlos Silva" está entre os "10 menores desempenhos" da turma
      When o sistema atualiza a classificação de desempenho da turma
      Then o sistema envia uma notificação para "Carlos Silva"
      And a notificação informa que houve uma redução no desempenho relativo
      And a notificação informa que "Carlos Silva" passou do "primeiro quartil" para o "quarto quartil"
      And a notificação não apresenta os nomes, conceitos ou desempenhos dos demais alunos


   Scenario: Não enviar notificação quando o aluno permanece no mesmo quartil
      Given a turma "2026.2 de Engenharia de Software" possui "40" alunos com desempenho registrado
      And o aluno "Carlos Silva" possui conceito "MA"
      And na classificação anterior o desempenho de "Carlos Silva" estava entre os "10 maiores desempenhos" da turma
      And o novo desempenho de "Carlos Silva" é "94 pontos"
      And o novo desempenho de "Carlos Silva" continua entre os "10 maiores desempenhos" da turma
      When o sistema atualiza a classificação de desempenho da turma
      Then o sistema não envia uma notificação de mudança de quartil para "Carlos Silva"


   Scenario: Não enviar notificação quando não houver atualização de desempenho
      Given a turma "2026.2 de Engenharia de Software" possui "40" alunos com desempenho registrado
      And o aluno "Carlos Silva" possui conceito "MA"
      And o desempenho de "Carlos Silva" está entre os "10 maiores desempenhos" da turma
      And não existem novos dados de desempenho registrados para a turma
      When o sistema verifica a existência de novas atualizações
      Then o sistema não envia uma nova notificação para "Carlos Silva"
```

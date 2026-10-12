Feature: notificação de alocação de monitor e aluno

  Como aluno ou monitor de um grupo do SGM
  Eu quero ser notificado sempre que a composição do meu grupo mudar
  Para que eu saiba quem são os participantes atuais do grupo sem precisar checar manualmente

  Scenario: notificar grupo ao alocar monitor (serviço)
    Given o grupo "ESS-G3" existe com os alunos "Mariana" e "Pedro" e sem monitor definido
    When o professor aloca o monitor "joaosilva" ao grupo "ESS-G3"
    Then o sistema envia uma notificação de alocação para "Mariana", "Pedro" e "joaosilva"
    And o grupo "ESS-G3" passa a ter "joaosilva" como monitor

  Scenario: notificar grupo ao adicionar aluno a grupo com monitor (serviço)
    Given o grupo "ESS-G3" existe com os alunos "Mariana" e "Pedro" e o monitor "joaosilva"
    When o professor adiciona o aluno "Carla" ao grupo "ESS-G3"
    Then o sistema envia uma notificação de aviso para "Mariana", "Pedro", "Carla" e "joaosilva"
    And o grupo "ESS-G3" passa a ter "Mariana", "Pedro" e "Carla" como alunos

  Scenario: não notificar quando alocação de monitor falha
    Given o grupo "ESS-G3" existe com os alunos "Mariana" e "Pedro" e sem monitor definido
    And não há nenhum monitor disponível no momento
    When o professor tenta alocar um monitor ao grupo "ESS-G3"
    Then o sistema exibe uma mensagem informando que não há monitor disponível
    And nenhuma notificação é enviada
    And o grupo "ESS-G3" continua sem monitor definido

  Scenario: não notificar ao tentar adicionar aluno já pertencente ao grupo
    Given o grupo "ESS-G3" existe com os alunos "Mariana" e "Pedro" e o monitor "joaosilva"
    When o professor tenta adicionar o aluno "Pedro" novamente ao grupo "ESS-G3"
    Then o sistema exibe uma mensagem informando que o aluno já pertence ao grupo
    And nenhuma notificação é enviada
    And o grupo "ESS-G3" mantém apenas "Mariana" e "Pedro" como alunos
    
  Scenario: notificar participantes na realocação de monitor entre grupos
    Given o monitor "joaosilva" está alocado ao grupo "ESS-G3"
    And o grupo "ESS-G4" existe com os alunos "Lucas" e "Beatriz" e sem monitor definido
    When o professor realoca o monitor "joaosilva" do grupo "ESS-G3" para o grupo "ESS-G4"
    Then o sistema envia uma notificação de saída para os alunos do grupo "ESS-G3"
    And o sistema envia uma notificação de entrada para os alunos do grupo "ESS-G4"
    And o grupo "ESS-G3" passa a não ter monitor definido
    And o grupo "ESS-G4" passa a ter "joaosilva" como monitor
    And o histórico de notificações do grupo "ESS-G3" registra o evento de entrada de "Carla"

  Scenario: alocação automática quando há apenas um monitor disponível
    Given o grupo "ESS-G5" existe com os alunos "Rafael" e "Julia" e sem monitor definido
    And o monitor "mariaeduarda" é o único monitor livre no momento
    When o sistema de alocação automática é executado para o grupo "ESS-G5"
    Then o sistema aloca o monitor "mariaeduarda" ao grupo "ESS-G5"
    And o sistema envia uma notificação de alocação para "Rafael", "Julia" e "mariaeduarda"
    And o sistema registra a alocação automática no relatório de monitores da disciplina
    And o relatório de monitores da disciplina passa a não ter monitores livres disponíveis

  Scenario: notificar alunos quando monitor é removido do grupo sem realocação
    Given o grupo "ESS-G3" existe com os alunos "Mariana" e "Pedro" e o monitor "joaosilva"
    When o professor remove o monitor "joaosilva" do grupo "ESS-G3" sem realocá-lo
    Then o sistema envia uma notificação de remoção para "Mariana" e "Pedro"
    And o grupo "ESS-G3" passa a não ter monitor definido
    
  Scenario: não notificar quando realocação de monitor falha
    Given o monitor "joaosilva" está alocado ao grupo "ESS-G3"
    And o grupo "ESS-G4" não existe no sistema
    When o professor tenta realocar o monitor "joaosilva" do grupo "ESS-G3" para o grupo "ESS-G4"
    Then o sistema exibe uma mensagem informando que o grupo de destino não existe
    And nenhuma notificação é enviada
    And o monitor "joaosilva" permanece alocado ao grupo "ESS-G3"

  Scenario: notificar apenas o novo monitor quando grupo não possui alunos
    Given o grupo "ESS-G6" existe sem nenhum aluno e sem monitor definido
    When o professor aloca o monitor "carloseduardo" ao grupo "ESS-G6"
    Then o sistema envia uma notificação de alocação apenas para "carloseduardo"
    And o grupo "ESS-G6" passa a ter "carloseduardo" como monitor

  Scenario: notificar monitor quando é designado como responsável por múltiplos grupos
    Given o monitor "joaosilva" já está alocado ao grupo "ESS-G3"
    And o grupo "ESS-G7" existe sem monitor definido
    When o professor aloca o monitor "joaosilva" também ao grupo "ESS-G7"
    Then o sistema envia uma notificação para os alunos do grupo "ESS-G7"
    And o sistema envia uma notificação para "joaosilva" informando o acúmulo de grupos
    And o grupo "ESS-G3" permanece com "joaosilva" como monitor, sem alteração
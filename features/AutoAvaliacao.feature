Feature: auto-avaliação
	As I estudante usuário do sistema de gerenciamento de metas
    I desejo adicionar um conceito para uma quantidade de metas de conhecimento
	so that eu poderia ver todas as minhas notas de auto-avaliação
Scenario: adicionar novos conceitos de auto-avaliação
	Given eu estou na página de “auto-avaliação”
	And eu vejo que não possuo conceito de auto-avaliação na meta de “entender requisitos”
	And eu vejo que não possuo conceito de auto-avaliação na meta de “especificar requisitos”
    And eu vejo que não possuo conceito de auto-avaliação na meta de “entender conceitos de gerência”
	When eu adiciono o conceito “MA” a meta “entender requisitos”
    And eu adiciono o conceito “MANA” a meta “especificar requisitos”
    And eu adiciono o conceito “MPA” a meta “entender conceitos de gerência”
    And eu seleciono para salvar os conceitos
    Then eu vou para página de “notas”
    And eu vejo que possuo conceito “MA” na meta “entender requisitos”, conceito “MANA” na meta “especificar requisitos”, conceito “MPA” na meta “entender conceitos de gerência”
Scenario: adicionar conceitos de auto-avaliação incompletas
	Given eu estou na página na página de “auto-avaliação”
	And  eu vejo que não possuo conceito de auto-avaliação na meta “entender requisitos”
	And  eu vejo que não possuo conceito de auto-avaliação na meta “especificar requisitos”
    And  eu vejo que não possuo conceito de auto-avaliação na meta “entender conceitos  de gerência”
	When eu adiciono o conceito “MA” a meta “entender requisitos”
    And eu adiciono o conceito “MANA” a meta “especificar requisitos”
    And eu adiciono o conceito “-” a meta “entender conceitos de gerência”
    And eu seleciono para salvar os conceitos
    Then eu vejo uma mensagem de erro relacionada ao não preenchimento de uma das metas
	And eu continuo na página de “auto-avaliação”
Scenario: não existe discrepância entre as notas dos alunos e do professor
    Given estou logado como professor
    And eu estou na página de “notas”
    And o aluno “Pedro” possui conceitos “MA”, “MPA”, “MA”, “MPA”, “MPA”, “atribuídos pelo professor” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência” e “realizar testes sólidos”, respectivamente 
    And o aluno “Pedro” possui conceitos “MPA”,  “MANA”,  “MPA”, “MANA” e “MANA”, “de auto-avaliação” para as metas de “entender requisitos”, “especificar requisitos”, “entender conceitos de gerência” e “realizar testes sólidos”, respectivamente
    And o aluno “Lucas”  possui conceitos “MA”, “MA”, “MANA”, “MPA”, “MPA”, “atribuídos pelo professor” para as metas de “entender requisitos”, “elicitar requisitos”,  “especificar requisitos”, “entender conceitos de gerência”e “realizar testes sólidos”, respectivamente 
    And o aluno “Lucas” possui conceitos “MA”,  “MPA”, “MPA”, “MPA” e “MPA”, “de auto-avaliação” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência”e “realizar testes sólidos”, respectivamente
    And o aluno “Eduardo” possui conceitos “MA”, “MPA”, “MANA”, “MPA”e “MPA” “atribuídos pelo professor” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência”, “realizar testes sólidos”, respectivamente
    And o aluno “Eduardo” e possui conceitos “MPA”,  “MPA”, “MANA”, “MPA”e “MPA”,  “de auto-avaliação” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência”e “realizar testes sólidos”, respectivamente
    When eu seleciono para verificar discrepâncias
    Then eu vou para a tela de “Visualizar discrepâncias”
    And eu posso visualizar a lista de alunos com discrepância “vazia”, o percentual de alunos com discrepância “0%” e a quantidade de alunos com discrepância “0”
Scenario: existe discrepância nas notas de 1 dos 3 alunos em relação as notas do professor
    Given estou logado como professor
    And eu estou na página de “notas”
    And o aluno “Igor” possui conceitos “MA”, “MPA” e “MA”, “MANA”,“MANA” “atribuídos pelo professor” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência”e “realizar testes sólidos”, respectivamente 
    And o aluno “Igor” possui conceitos “MPA”,  “MANA”, “MPA”, “MPA”, “MPA”, “de auto-avaliação” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência”e “realizar testes sólidos”, respectivamente
    And o aluno “Gabriel”  possui conceitos “MA”, “MA”, “MANA”, “MPA”, “MPA”, “atribuídos pelo professor” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência” e “realizar testes sólidos”, respectivamente 
    And o aluno “Gabriel” possui conceitos “MA”,  “MPA”, “MPA”, “MPA”, “MPA”, “de auto-avaliação” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência” e “realizar testes sólidos”, respectivamente
    And o aluno “Vitor” possui conceitos “MA”, “MPA”, “MANA”, “MPA”, “MPA”, “atribuídos pelo professor” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência” e “realizar testes sólidos”, respectivamente 
    And o aluno “Vitor” possui conceitos “MPA”,  “MPA”, “MANA”, “MPA”, “MPA”,  “de auto-avaliação” para as metas de “entender requisitos”, “elicitar requisitos”, “especificar requisitos”, “entender conceitos de gerência” e “realizar testes sólidos”,, respectivamente
    When eu seleciono para verificar discrepâncias
    Then eu vou para a tela de “Visualizar discrepâncias”
    And eu posso visualizar na lista de alunos com discrepância “Igor”, o percentual de alunos com discrepância “20%” e a quantidade de alunos com discrepância “1”


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

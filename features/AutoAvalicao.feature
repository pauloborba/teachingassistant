Feature: Auto-avaliação
	As a student
	I want to evaluate my learning goals
    so that I can compare my perception of the learning goals with the teacher’s point of view.

Scenario: Auto-avaliação bem sucedida
	Given estou na página de Auto-avaliação
    And eu vejo as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e  “Entender conceitos de gerência de configuração” sem notas
    When eu atribuo o conceito “MA” para as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e  “Entender conceitos de gerência de configuração”
    And eu seleciono a opção “Enviar”
    Then eu posso ver uma mensagem de confirmação
    And eu posso ver as notas atribuídas para cada meta

Scenario: Auto-avaliação mal sucedida
	Given estou na página de Auto-avaliação
    And eu vejo as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e  “Entender conceitos de gerência de configuração” sem notas
    When eu atribuo o conceito “MA” para as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e  não atribuo um conceito para a meta “Entender conceitos de gerência de configuração”
    And eu seleciono a opção “Enviar”
    Then eu posso ver uma mensagem de erro
    And eu posso ver as notas atribuídas para cada meta
    *Passo adicional*

Scenario: Auto-avaliação sem discrepância 
	Given estou na página de Auto-avaliação
    And eu vejo a auto-avaliação do aluno “Fernando” com os conceitos “MA”, “MPA”, “MPA”, “MA” e “MPA”
    And eu vejo a auto-avaliação do aluno “Guilherme” com os conceitos “MPA”, “MPA”, “MPA”, “MPA” e “MPA”
    And eu vejo a auto-avaliação do aluno “Matheus” com os conceitos “MPA”, “MPA”, “MANA”, “MPA” e “MPA”
    When eu seleciono a opção “Ver avaliações discrepantes”
    Then eu vejo que a “Quantidade de auto-avaliações discrepantes” é “zero”
    And eu vejo que o “Percentual de auto-avaliações discrepantes” é “zero”
    And eu vejo que a “Lista de alunos com auto-avaliações discrepantes” é “vazia”

Scenario: Auto-avaliação com discrepância 
	Given estou na página de Auto-avaliação
    And eu vejo a auto-avaliação do aluno “Fernando” com os conceitos “MA”, “MPA”, “MPA”, “MA” e “MPA”
    And eu vejo a auto-avaliação do aluno “Guilherme” com os conceitos “MA”, “MA”, “MA”, “MA” e “MA”
    And eu vejo a auto-avaliação do aluno “Matheus” com os conceitos “MPA”, “MPA”, “MANA”, “MPA” e “MPA”
    When eu seleciono a opção “Ver avaliações discrepantes”
    Then eu vejo que a “Quantidade de auto-avaliações discrepantes” é “1”
    And eu vejo que o “Percentual de auto-avaliações discrepantes” é “33%”
    And eu vejo que a “Lista de alunos com auto-avaliações discrepantes” contém um aluno “Guilherme”

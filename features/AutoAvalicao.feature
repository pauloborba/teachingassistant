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

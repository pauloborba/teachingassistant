Feature: Auto-avaliação
		As a aluno
		I want to informar ao professor quanto acho que mereço em cada uma das metas avaliadas
		So that minha nota seja revisada caso haja uma incongruência alarmante.
Scenario: Usuário faz preenchimento completo da auto-avaliação 
		Given estou na página “Planilha de Metas/Conceitos”
		And as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When preencho a coluna "Auto-avaliação" com o conceito "MA" para a meta "Conceitos Requisitos", "MA" para "Especificar Requisitos", "MPA" para "Conceitos Gerência" e "MPA" para "Testes"
		Then uma mensagem de confirmação é exibida.
Scenario: Preenchimento bem sucedido da auto-avaliação
		Given as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When submeto ao sistema a "Planilha de Metas/Conceitos" com a coluna "Auto-avaliação" preenchida com os conceitos "MA", "MA", "MPA" e "MPA" para as metas "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes", respectivamente
		Then o sistema atualiza os dados de "Planilha de Metas/Conceitos".
Scenario: Usuário faz preenchimento incompleto da auto-avaliação
		Given estou na página “Planilha de Metas/Conceitos”
		And as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When preencho a coluna de "Auto-avaliação" com o conceito "MA" para a meta "Conceitos Requisitos", "MA" para "Especificar Requisitos" e "MPA" para "Conceitos Gerência"
		Then vejo a célula correspondente a linha de "Testes" e a coluna de "Auto-avaliação" destacada
		And um aviso sobre campo obrigatório é exibido.
Scenario: Preenchimento incompleto da auto-avaliação
		Given as metas cadastradas são "Conceitos Requisitos", "Especificar Requisitos", "Conceitos Gerência" e "Testes"
		When submeto ao sistema a "Planilha de Metas/Conceitos" com a coluna "Auto-avaliação" preenchida com os conceitos "MA", "MA" e "MPA" para as metas "Conceitos Requisitos", "Especificar Requisitos" e "Conceitos Gerência", respectivamente
		Then o sistema não atualiza os dados de "Planilha de Metas/Conceitos"
		And o sistema avisa que não salvou os dados.
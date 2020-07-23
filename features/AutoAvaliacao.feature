- Alterar dados
- Remover veículos 
- Atribuir pneus
- Desatribuir pneus
- Selecionar pneu
- Log do veículo


Cenário de auto-avaliação bem sucedido:
	Scenario: fazendo minha auto avaliação
	Given: estou na página de “Auto Avaliação”
	And: o botão “Fazer Auto Avaliação” está visível
	And: na coluna de auto avaliação existem as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” para serem auto avaliadas com as possibilidades de nota “MA”, “MPA”, “MANA”
        When: eu clico no botão “Fazer Auto Avaliação”
     	Then: eu continuo na página de “Auto Avaliação”
      	And: surge uma coluna com as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” sem notas em cada uma das metas
      	And: digito minha auto avaliação e encerro

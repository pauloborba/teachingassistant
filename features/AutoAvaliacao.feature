- Alterar dados
- Remover veículos 
- Atribuir pneus
- Desatribuir pneus
- Selecionar pneu
- Log do veículo


-> Cenário de auto-avaliação bem sucedido:
	Scenario: fazendo minha auto avaliação
	Given: estou na página de “Auto Avaliação”
	And: o botão “Fazer Auto Avaliação” está visível
	And: na coluna de auto avaliação existem as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” para serem auto avaliadas com as possibilidades de nota “MA”, “MPA”, “MANA”
        When: eu clico no botão “Fazer Auto Avaliação”
     	Then: eu continuo na página de “Auto Avaliação”
      	And: surge uma coluna com as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” sem notas em cada uma das metas
      	And: digito minha auto avaliação e encerro


-> Cenário de auto-avaliação mal sucedido:
	Scenario: auto avaliação mal sucedida
	Given: estou na página de “Auto Avaliação”
	And: o botão “Fazer Auto Avaliação” está visível
	And: eu não tenho permissão para fazer auto-avaliação
        When: eu clico no botão “Fazer Auto Avaliação”
     	Then: aparece a mensagem "Você não tem permissão para fazer a auto-avaliação"
<<<<<<< HEAD
      	And: passo adicional pedido pelo stakeholder
=======


-> Cenário de auto-avaliação que não possui discrepância:
	Scenario: olhando a discrepância dos alunos
		Given: estou na página de “avaliação”
	     	And: vejo o botão do visualizar discrepância dos alunos
                When: eu clico no botão de visualizar discrepância
		Then: eu sou direcionado para a  página de discrepância
		And: surge uma lista de alunos com discrepância
		And: todos os alunos estão marcados com um X vermelho na seção de discrepância
		And: Suas porcentagens de discrepância estão exibidas do lado
      	

-> Criando o commit da aula 14 - branch master

-> Cenário de auto-avaliação que possui discrepância:
	Scenario: olhando a discrepância dos alunos
		Given: estou na página de avaliação
		And: vejo o botão do visualizar discrepância dos alunos
                When: eu clico no botão de visualizar discrepância
		Then: eu sou direcionado para a  página de discrepância
		And: surge uma lista de alunos com discrepância
		And: 1 de 3 alunos está marcado com um V verde na seção de discrepância
		And: Suas porcentagens de discrepância estão exibidas do lado
		And: Aparece a porcentagem total de alunos que possuem discrepância, que no caso é 33%

-> Criando primeiro commit questão 14

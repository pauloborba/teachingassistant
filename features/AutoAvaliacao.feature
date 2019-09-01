Feature: auto-avaliação
	As a aluno de uma classe
    I want to cadastrar as notas que eu acho que devo tirar em cada meta e vê quais notas tirei
    So that para que o professor quando for colocar a nota da correção, veja qual nota eu achei que ia tirar

GUI based scenario:
Scenario: Preenchimento bem sucedido
    Given: O aluno “Johnny” de cpf “123” está na “Página de auto-avaliação”
    And: Eu vejo que minhas notas de auto-avaliação ainda não estão cadastradas
    And: Eu vejo que todos os campos de nota da auto-avaliação das metas “Meta 1”, “Meta 2”, “Meta 3” etc estão preenchidos com “MA”, “MPA” ou “MANA”
    When: Seleciono a opção de “enviar” o que tinha preenchido nos campos de nota
    Then: Eu vejo uma mensagem validando a operação
    And: Eu vejo que as notas de auto-avaliação do aluno “Johnny” de cpf “123”  estão cadastradas

Service based scenario:
Scenario: Preenchimento bem sucedido
    Given: Eu tenho acesso como aluno ao sistema
    And: O sistema não tem as notas de auto-avaliação do aluno “Johnny” de cpf “123”
    And: Todos os campos das notas de auto-avaliação foram preenchidas
    And: O sistema está conectado com a aplicação
    When: As notas são enviadas ao sistema
    Then: O servidor retorna uma mensagem validando a operação
    And: As notas enviadas do aluno “Johnny” de cpf “123” estão cadastradas no sistema

GUI based scenario:
Scenario: Preenchimento mal sucedido
	Given: O aluno “Johnny” de cpf “123” está na “Página de auto-avaliação”
	And: Eu vejo que minhas notas de auto-avaliação ainda não estão cadastradas
    And: Eu vejo que as notas de auto-avaliação do aluno “Samuel” de cpf “456” estão cadastradas
    When: Eu tento “enviar” os campos de nota de auto-avaliação das metas “Meta 1”, “Meta 2”, “Meta 3” etc que estão preenchidos com “MA”, “MPA” ou “MANA”, menos o campo de nota da “Meta 4” que não foi preenchido.
	Then: Eu vejo uma mensagem de invalidação da operação
    And: Eu vejo que as notas do aluno “Johnny” de cpf ”123” não foram cadastradas
    And: Eu vejo que as notas do aluno “Samuel” de cpf “456” permanecem cadastradas

Service based scenario:
Scenario: Preenchimento mal sucedido
    Given: Eu tenho acesso ao sistema como aluno
    And: As notas de auto-avaliação do aluno “Johnny” de cpf “123” não estão cadastradas no sistema
    And: As notas de auto-avaliação do aluno “Samuel” de cpf “456” já estão cadastradas no sistema
    When: Eu tento cadastrar no sistema as notas de auto-avaliação “MA”, “MPA” ou “MANA” nas metas “Meta 1”, “Meta 2”, “Meta 3” etc mas sem a nota da “Meta 4”.
    Then: O sistema retorna uma mensagem de invalidação da operação
    And: As notas de auto-avaliação do aluno “Johnny” de cpf “123” não foram cadastradas no sistema 
    And: As notas de auto-avaliação do aluno “Samuel” de cpf “456” ainda estão cadastradas no sistema
    And: As notas não são cadastradas
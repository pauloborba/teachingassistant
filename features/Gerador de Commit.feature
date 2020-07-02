Features: Login
As a: Usuário
I want to: Logar no sistema com o perfil de usuário 
So that: A autorização de acesso será por usuário e senha


Scenario: Cadastramento de uma nova empresa no sistema
	Given Eu Estou na página de “Cadastro”
	When Eu preencho os campos solicitados “Nome da Empresa” com “Social Lab” , “CPF/MEI” com “000.000.000-00” e “Endereço” com “Rua da Guia N-29”
	Then Eu vejo uma mensagem de confirmação 

Scenario: Cadastramento mal sucedido de uma empresa
		
	Given Eu Estou na página de “Cadastro”
	When Eu preencho os campos solicitados “Nome da Empresa” com “Social Lab” , “CPF/MEI” com “000.000.000-00” e “Endereço” com “”
	Then Eu vejo uma mensagem de erro sobre endereço não informado

Scenario: Excluir Cadastro de uma empresa  no sistema

		Given Eu estou na página de “Excluir”
		And Eu estou logado como “Empresa” com o login “SocialLab1” e a senha “@123.4” 
		When Eu seleciono excluir “conta” da plataforma
		Then Eu vejo a mensagem de confirmação


Scenario: Atualizar Cadastro da Empresa
		Given Eu estou na página de “Atualizar Cadastro”
		And Eu estou logado como “Empresa” com o login “SocialLab1” e a senha “@123.4” 
		When Eu posso editar dados  da “Social Lab”
		Then Eu vejo a mensagem de confirmação

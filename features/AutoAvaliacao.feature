Feature: Auto-avaliação
	Como um aluno e usuário do SGM
	
	Eu quero ser capaz ver o conceito que me foi dado pelo professor no momento de realizar minha auto-avaliação                
	Para que eu possa ter uma ideia de como me auto-avaliar e não submeter auto-avaliações com conceito maior que
     o dele em ao menos 25% dos casos, não caindo assim na lista de avaliações discrepantes. 

	GUI

		Cenário: Preenchimento bem sucedido da auto-avaliação
			Dado que eu estou na tela de auto-avaliação
			E está no período de realizar a auto-avaliação “Abril”
			Quando eu sigo realizar auto-avaliação
			E eu preencho todos os campos
			Então a auto-avaliação “Abril”  é corretamente guardada no sistema

	SERVIÇO

		Cenário: Preenchimento bem sucedido da auto-avaliação
			Dado que o sistema não tem auto-avaliação “Agosto”
			E está no período de realizar a auto-avaliação “Agosto”

			Quando eu sigo realizar auto-avaliação
 			E eu preencho todos os campos
			Então o sistema arquiva auto-avaliação “Agosto” de forma correta

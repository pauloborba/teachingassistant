Feature: Auto-avaliação do sistema de metas
As a: Aluno
I want to: Eu posso me avaliar com as metas cadastradas no sistema

Scenario: Realizando auto-avaliação de conceitos  
	Given: Eu estou na  página de “auto-avaliação ”.
	When:  Eu preencho as “meta 1”, “meta 2 e “meta 3 com “MPA” , “MANA” e “MA”
	Then: Eu consigo ver na tela uma mensagem de confirmação da avaliação

Scenario: Realizando auto-avaliação de conceitos  
 	Given: Eu estou na  página de “auto-avaliação ”.
	When:  Eu preencho as “meta 1”, “meta 2 e “meta 3 com “MPA” , “MANA” 
	Then: Eu vejo na tela uma mensagem de error , pois não preenche todas as avaliações das metas

Scenario: Realizando auto-avaliação de conceitos  
	Given: O professor está na  página “auto-avaliacao”.
	When: Eu enxergo que na “Meta 1 ”, “Meta 2”, “Meta 3”, “Meta 4” e “Meta 5” a avaliação do aluno foi “MANA” ,”MANA”,”MANA”,”MA”,”MA”
	And: O professor, avalia a “Meta 1”,”Meta 2”,”Meta 3”,”Meta 4” e ”Meta 5” com a seguinte avaliação “MANA” ,”MANA”,”MANA”,”MA”,”MA”
	Then: A avaliação foi concluída com sucesso.		


Scenario: Realizando auto-avaliação de conceitos  
	Given: O professor está na  página “auto-avaliacao”.
	When: Eu enxergo que na “Meta 1 ”, “Meta 2”, “Meta 3”, “Meta 4” e “Meta 5” a avaliação do aluno foi “MANA” ,”MA”,”MANA”,”MANA”,”MANA”
	And: O professor, avalia a “Meta 1”,”Meta 2”,”Meta 3”,”Meta 4” e ”Meta 5” com a seguinte avaliação “MANA” ,”MANA”,”MANA”,”MANA”,”MANA”
	Then: A avaliação foi concluída com sucesso.	


Scenario: Realizando auto-avaliação de conceitos  
	Given: O professor está na  página “auto-avaliacao”.
	When: Eu enxergo que na “Meta 1 ”, “Meta 2”, “Meta 3”, “Meta 4” e “Meta 5” a avaliação do aluno foi “MANA” ,”MANA”,”MANA”,”MANA”,”MANA”
	And: O professor, avalia a “Meta 1”,”Meta 2”,”Meta 3”,”Meta 4” e ”Meta 5” com a seguinte avaliação “MANA” ,”MANA”,”MANA”,”MANA”,”MANA”
	Then: A avaliação foi concluída com sucesso.

Scenario: Realizando auto-avaliação de conceitos  
	Given: O professor está na  página “auto-avaliacao”.
	When: Eu enxergo que na “Meta 1 ”, “Meta 2”, “Meta 3”, “Meta 4” e “Meta 5” a avaliação do aluno foi “MANA” ,”MANA”,”MANA”,”MANA”,”MANA”
	And: O professor, avalia a “Meta 1”,”Meta 2”,”Meta 3”,”Meta 4” e ”Meta 5” com a seguinte avaliação “MPA” ,”MPA”,”MPA”,”MPA”,”MPA”
	Then: Avaliacao contém discrepancia.		

		

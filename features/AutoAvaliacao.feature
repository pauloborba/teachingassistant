Sistema de Gerenciamento de metas de auto-avalia‡Æo 

Scenario: preenchendo auto-avaliação totalmente
Given eu vejo os conceitos de “MA, MA, MANA” respectivamente atribuídos pelo professor na mesma página
And estou logado como “Humberto” na página ”SGM”
And as auto-avaliações do Aluno “Humberto” não estão armazenadas no sistema
When eu avalio com “MA”, “MPA”,  respectivamente 2 das 3 metas conceituadas pelo professor
And eu seleciono a opção de “enviar”
Then eu recebo uma mensagem de sucesso de auto-avaliação
And eu tenho a opção de voltar para a página de “SGM”



Scenario preenchendo auto-avaliação parcialmente
Given eu vejo os conceitos de “MA, MA, MANA” respectivamente atribuídos pelo professor na mesma página
And estou logado como “Humberto” na página ”SGM”
And as auto-avaliações do Aluno “Humberto” não estão armazenadas no sistema
When eu avalio com “MA”, “MPA” respectivamente 2 das 3 metas conceituadas pelo professor
And seleciona a opção “enviar”
Then eu recebo uma mensagem de erro
And eu tenho a opção de voltar para a página de “SGM”

Scenario: análise de discrepantes quando não há discrepância
Given Estou logado na página ”SGM” como “Professor”
And as auto-avaliações dos alunos estão armazenadas no sistema
And “3” “alunos” estão armazenados no sistema
And os “3” alunos não possuem discrepâncias
When seleciono a opção “Análise de discrepância”
Then é mostrado uma lista “ ” de alunos com discrepância
And é mostrado o total de aluno/s “0” com discrepância
And é mostrado a porcentagem “0%” de alunos discrepantes
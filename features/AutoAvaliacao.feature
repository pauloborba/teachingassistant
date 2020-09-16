Sistema de Gerenciamento de metas de auto-avalia‡Æo 

Scenario: preenchendo auto-avaliação totalmente
Given eu vejo os conceitos de “MA, MA, MANA” respectivamente atribuídos pelo professor na mesma página
And estou logado como “Humberto” na página ”SGM”
And as auto-avaliações do Aluno “Humberto” não estão armazenadas no sistema
When eu avalio com “MA”, “MPA”,  respectivamente 2 das 3 metas conceituadas pelo professor
And eu seleciono a opção de “enviar”
Then eu recebo uma mensagem de sucesso de auto-avaliação
And eu tenho a opção de voltar para a página de “SGM”

Given a aluna “Maria” está na página de “Notas” e avaliou seus conceitos como “MA” na meta “Entender conceitos de requisitos”, “MA” na meta “Especificar requisitos com qualidade” e “MPA” na meta “Entender conceitos de gerência de configuração” da disciplina “Engenharia de Software e Sistemas”
When “Maria” envia os conceitos escolhidos
Then o sistema grava os conceitos enviados

Given a aluna “Maria” está na página de “Notas” e avaliou seus conceitos como “MA” na meta “Entender conceitos de requisitos”, “MA” na meta “Especificar requisitos com qualidade” e “MPA” na meta “Entender conceitos de gerência de configuração” da disciplina “Engenharia de Software e Sistemas”
When “Maria” envia os conceitos escolhidos
Then “Maria” recebe uma mensagem confirmando o envio 

Given a aluna “Maria” está na página de “Notas” e avaliou seus conceitos como “MA” na meta “Entender conceitos de requisitos” e “MPA” na meta “Entender conceitos de gerência de configuração” da disciplina “Engenharia de Software e Sistemas”
When “Maria” envia os conceitos escolhidos
Then o sistema não grava os conceitos enviados
And o sistema encerra

Given a aluna “Maria” está na página de “Notas” e avaliou seus conceitos como “MA” na meta “Entender conceitos de requisitos” e “MPA” na meta “Entender conceitos de gerência de configuração” da disciplina “Engenharia de Software e Sistemas”
When “Maria” envia os conceitos escolhidos
Then “Maria” visualiza a mensagem: “Você não atribuiu notas a todas as suas metas.”

Scenario não há discrepância	
Given que no requisito “Entender conceitos de requisitos” a aluna “Maria” se auto avaliou com conceitos “MA, MPA, MANA, MPA, MPA”, enquanto o professor a avaliou com “MPA, MA, MA, MA, MA” 
And o aluno “João” se auto avaliou com conceitos “MANA, MPA, MANA, MPA, MPA”  enquanto o professor a avaliou com “MA, MA, MA, MA, MA” 
And a aluna “Sansa” se auto avaliou com conceitos “MA, MA, MPA, MANA, MA” e o professor a avaliou com conceitos  “MA, MA, MPA, MANA, MA”. 
When o professor “Paulo” clica em “Visualizar estatísticas da turma”
Then  o professor “Paulo” vê uma janela com as estatísticas 
And o professor “Paulo” vê o nome dos alunos “Maria, João, Sansa” na coluna “Alunos com avaliação não discrepante”, vê o percentual da turma em “100%”, vê a quantidade “3”


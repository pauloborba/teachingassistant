Given a aluna “Maria” está na página de “Notas” e avaliou seus conceitos como “MA” na meta “Entender conceitos de requisitos”, “MA” na meta “Especificar requisitos com qualidade” e “MPA” na meta “Entender conceitos de gerência de configuração” da disciplina “Engenharia de Software e Sistemas”
When “Maria” envia os conceitos escolhidos
Then o sistema grava os conceitos enviados

Given a aluna “Maria” está na página de “Notas” e avaliou seus conceitos como “MA” na meta “Entender conceitos de requisitos”, “MA” na meta “Especificar requisitos com qualidade” e “MPA” na meta “Entender conceitos de gerência de configuração” da disciplina “Engenharia de Software e Sistemas”
When “Maria” envia os conceitos escolhidos
Then “Maria” recebe uma mensagem confirmando o envio 

Given a aluna “Maria” está na página de “Notas” e avaliou seus conceitos como “MA” na meta “Entender conceitos de requisitos” e “MPA” na meta “Entender conceitos de gerência de configuração” da disciplina “Engenharia de Software e Sistemas”
When “Maria” envia os conceitos escolhidos
Then o sistema não grava os conceitos enviados

Given a aluna “Maria” está na página de “Notas” e avaliou seus conceitos como “MA” na meta “Entender conceitos de requisitos” e “MPA” na meta “Entender conceitos de gerência de configuração” da disciplina “Engenharia de Software e Sistemas”
When “Maria” envia os conceitos escolhidos
Then “Maria” visualiza a mensagem: “Você não atribuiu notas a todas as suas metas.”

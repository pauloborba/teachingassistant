Scenario: Um aluno deseja auto-avaliar suas metas utilizando os conceitos
Given O "aluno" está na tela de "auto-avaliação"
And O "aluno" vê os conceitos de "entender conceitos de requisitos", "especificar requisitos com qualidade" e "entender conceitos de gerência de configuração" vazios
And O "aluno" avalia entre os conceitos "MA", "MPA", e "MANA" e as metas "entender conceitos de requisitos", "especificar requisitos com qualidade" e "entender conceitos de gerência de configuração" 
When O "aluno" preenche todos os campos com os conceitos
Then Aparece uma mensagem de confirmação 
And Ainda estou na tela de "auto-avaliação"
And Os campos preenchidos não podem ser mais reescritos

Scenario: Um aluno deseja auto-avaliar suas metas utilizando os conceitos
Given O "aluno" está na tela de "auto-avaliação"
And O "aluno" avalia entre os conceitos "MA", "MPA", e "MANA" e as metas "entender conceitos de requisitos", "especificar requisitos com qualidade" e "entender conceitos de gerência de configuração" 
When O "aluno"  preenche os campos com os conceitos
Then Aparece uma mensagem de de aviso que diz que falta preencher um conceito
And Ainda estou na tela de "auto-avaliação"

Scenario: O professor checa se tem alunos com discrepância
Given O professor está na tela de "discrepância"
And Tem um "aluno" cadastrado com conceito superior ao do professor em 1 de 5 "metas"
And O "aluno" tem conceitos inferiores aos conceitos do "professor"
And O "aluno" tem conceitos iguais aos conceitos do "professor"
And O "aluno" tem discrepância menor que 25%
And O "professor" vê que não tem "aluno" na lista
And A tela informa que não tem "aluno" prejudicado por discrepância
Then O professor sabe que não tem "aluno" prejudicado


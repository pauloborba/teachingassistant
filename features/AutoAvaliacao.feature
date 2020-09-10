Scenario: Um aluno deseja auto-avaliar suas metas utilizando os conceitos
Given O "aluno" está na tela de "auto-avaliação"
And O "aluno" vê os conceitos de "entender conceitos de requisitos", "especificar requisitos com qualidade" e "entender conceitos de gerência de configuração" vazios
And O "aluno" avalia entre os conceitos "MA", "MPA", e "MANA" e as metas "entender conceitos de requisitos", "especificar requisitos com qualidade" e "entender conceitos de gerência de configuração" 
When O "aluno" preenche todos os campos com os conceitos
Then Aparece uma mensagem de confirmação 
And Ainda estou na tela de "auto-avaliação"
And Os campos preenchidos não podem ser mais reescritossss

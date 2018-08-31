Feature:auto-avaliação
Como um aluno
Eu gostaria de enviar minha auto-avaliação para compartilhar a avaliação que acho que mereço.


Cenário: preenchimento de auto-avaliação bem sucedida

Given estou na pagina de auto-avaliação do aluno “Pedro” 
And a avaliação do professor nas metas ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”  são respectivamente  “MA”,”MPA”, “MPA”
When eu preencho as metas ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” respectivamente com “MA” , ”MA” ,” MPA” e envio a auto-avaliação
Then eu vejo uma mensagem de confirmação na tela. 

Given a auto-avaliação do aluno “Pedro” ainda não estar no sistema
When o aluno “Pedro” envia sua auto-avaliação com as metas  ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” respectivamente com “MA”, “MA”,”MPA”
Then a auto-avaliação de “Pedro” está no sistema

Cenário: preenchimento de auto-avaliação mal sucedida

Given estou na pagina de auto-avaliação do aluno “Pedro” 
And a avaliação do professor nas metas ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”  são respectivamente  “MA”,”MPA”, “MPA”
When eu preencho as metas ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” respectivamente com “” , ”MA” ,” MPA” e envio a auto-avaliação
Then eu vejo uma mensagem de erro na tela. 

Given a auto-avaliação do aluno “Pedro” ainda não estar no sistema
When o aluno “Pedro” envia sua auto-avaliação com as metas  ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” respectivamente com “”, “MA”,”MPA”
Then a auto-avaliação de “Pedro” não está no sistema

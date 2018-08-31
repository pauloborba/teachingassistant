Feature:auto-avaliação
Como um aluno
Eu gostaria de enviar minha auto-avaliação para compartilhar a avaliação que acho que mereço.
Eu gostaria de ver a quantidade, porcentagem e a lista de alunos com auto-avaliações discrepantes para ter ideia da expectatica dos meus alunos.

Cenário: preenchimento de auto-avaliação bem sucedida

Given estou na pagina de auto-avaliação do aluno “Pedro” 
And a avaliação do professor nas metas ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”  são respectivamente  “MA”,”MPA”, “MPA”
When eu preencho as metas ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” respectivamente com “MA” , ”MA” ,” MPA” e envio a auto-avaliação
Then eu vejo uma mensagem de confirmação na tela. 

Given a auto-avaliação do aluno “Pedro” ainda não estar no sistema
When o aluno “Pedro” envia sua auto-avaliação com as metas  ”Entender conceito de requisitos”,”Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” respectivamente com “MA”, “MA”,”MPA”
Then a auto-avaliação de “Pedro” está no sistema

Cenário: auto-avaliações sem nenhuma discrepância

Given eu estou na página principal como professor
When eu vou na aba auto-avaliações discrepantes
Then eu vejo “0” na quantidade de alunos
And eu vejo “0”% na porcentagem de alunos
And eu vejo nenhum aluno na lista

Feature:Auto-avaliação
As a um aluno
I want to atribuir conceitos(MA,MPA e MANA) em cada uma de suas metas
So that eu posso fazer minha auto-avaliação


Cenário:Autoavaliação do aluno
Given o aluno está na página de autoavaliação
When ele atribui conceito a meta 1
And ele atribui conceito a meta 2
And ele atribui conceito a meta 3
And ele atribui conceito a meta 4
And ele atribui conceito a meta 5.0
And ele clica em confirmar
Then ele recebe uma mensagem de confirmação de que a autoavaliação foi feita


Scenario:Um aluno deseja fazer uma autoavaliação
Given o estudante “Douglas Felipe” está na página de Gerenciamento de notas
When eu peço para “Douglas Felipe, que ele realize sua auto avaliação,atribuindo metas para cada conceito numa mesma página
Then “Douglas Felipe” confirmar que preencheu todas as metas e clica no botão confirmar e recebe uma mensagem “Autoavaliação feita com sucesso”


Scenario:Autoavaliação do aluno
Given o aluno está na página de autoavaliação
When ele atribui conceito a meta 1
And ele atribui conceito a meta 2
And ele atribui conceito a meta 3
And ele atribui conceito a meta 4
And ele clica em confirmar
Then ele recebe uma mensagem de que uma das metas não foi preenchida e o procedimento não pode ser realizado


Scenario:Um aluno deseja fazer uma autoavaliação
Given o estudante “Douglas Felipe” está na página de SMT 
When eu peço para “Douglas Felipe, que ele realize sua auto avaliação,atribuindo metas paras os conceitos(1,2,3 e 4) numa mesma página
Then “Douglas Felipe” confirmar que preencheu todas as metas e clica no botão confirmar e recebe uma mensagem “Preencha o conceito para a meta 5 para poder realizar o procedimento” e volta para a mesma página.


Cenário:Saber a quantidade, o percentual, e a lista de alunos com auto-avaliações discrepantes
Given o professor está na página inicial de gerenciamento de notas
When ele clica na opção de saber a quantidade,percentual e lista de alunos com discrepância nas autoavaliações
Then ele recebe uma mensagem de que não há nenhum aluno com discrepância.

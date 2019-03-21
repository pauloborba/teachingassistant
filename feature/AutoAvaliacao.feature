Feature: Auto-avaliação
As a Estudante
I want to Re-avaliar os conceitos atribuídos às metas pelo professor 
So that Comparar o conceito atribuído pelo professor aos que eu fiz

Scenario: Auto-avaliação Adequada
Given que você está na página de “auto-avaliação”
And você também vê as “metas”
And você vê que os “conceitos” fornecido pelo professor estão “preenchidos”
And você vê os “conceitos” fornecido por você estão “mal preenchido”
When preencho todos os “conceitos” de acordo com minha opinião pra compará-los
And confirmo os “conceitos”
Then recebo uma “mensagem” de conceito comparado com sucesso

Scenario: Auto-avaliação Inadequada
Given que você está na página de “auto-avaliação”
And você também vê as “metas”
And você vê que os “conceitos” fornecido pelo professor estão “preenchidos”
And você vê os “conceitos” fornecido por você está “mal preenchido”
When preencho menos que o total de conceitos, de acordo com minha opinião pra compará-los
And confirmo os “conceitos”
Then recebo uma “mensagem” de comparação de conceito inválido
And ajuste feito

Scenario: Lista de alunos discrepantes com discrepância inferior a 25%
Given que você está na página de “Lista de avaliação discrepante”.
And você vê que o “Lucas Mendonça” têm porcentagem de discrepância inferior ao permitido
And você vê que a porcentagem corresponde a ⅕ das metas
And você vê que a quantidade de alunos com discrepância superior ao mínimo valor é 0 estudantes
When apenas “ignoro” e “confirmo” a lista de discrepantes
Then recebo uma “mensagem” de lista finalizada com sucesso

Scenario: Lista de alunos discrepantes havendo alguma discrepância.
Given que você está na página de “Lista de avaliação discrepante”.
And você vê que o “Lucas Mendonça” têm porcentagem de discrepância é igual à 25%
And você vê que a porcentagem corresponde a 1/4 das metas
And você vê que a quantidade de alunos com discrepância superior ao mínimo valor é 1 estudantes.
And você vê que há apenas 1 estudante de 3 com discrepância.
When verifico os “detalhes” da discrepancia
And analiso com mais cuidado a auto-avaliação do aluno
Then recebo uma “mensagem” de lista finalizada com sucesso
And Mudança significativa


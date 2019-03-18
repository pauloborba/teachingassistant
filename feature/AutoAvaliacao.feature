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
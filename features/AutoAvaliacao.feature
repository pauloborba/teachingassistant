Feature: auto-avaliação
As a aluno
I want to me auto avaliar, vendo também, ao mesmo instante, o conceito que meu professor me deu. Essa avaliação precisa ser realizada de uma única vez, não me permitindo finalizar sem preencher todas as metas
So that eu possa analisar meu desempenho, comparar com o professor e ver quais aspectos preciso melhorar.

Cenário de GUI
Scenario: Auto avaliação preenchida corretamente
    Given que estou na página de “auto avaliação”, que possui as metas  “Entender motivação e conceitos de requisitos”, “Entender motivação e conceitos de testes” e “usar com eficácia um sistema de controle de versão distribuído”
And a aluna “Maria Luiza” se auto avaliou como “MPA” em “Entender motivação e conceitos de requisitos”, “MANA” em “Entender motivação e conceitos de testes” e “MA” em “usar com eficácia um sistema de controle de versão distribuído
    When “Maria Luiza” apertar no botão de “finalizar” da página de “auto avaliação”
    Then uma mensagem de confirmação é mostrada
    And “Maria Luiza” não pode mais editar a página “auto avaliação”

Cenário de controlador
Scenario: Auto avaliação preenchida corretamente
    Given o sistema possui as metas  “Entender motivação e conceitos de requisitos”, “Entender motivação e conceitos de testes” e “usar com eficácia um sistema de controle de versão distribuído” cadastradas
    When que o sistema receber os conceitos “MPA” para “Entender motivação e conceitos de requisitos”, “MANA” para  “Entender motivação e conceitos de testes” e “MA” para “usar com eficácia um sistema de controle de versão distribuído”
    Then a “auto avaliação” é salva no sistema

    Cenário de GUI
Scenario: Maria Luiza não preenche a planilha completamente.
    Given estou na página de “auto avaliação”, que possui as metas  “Entender motivação e conceitos de requisitos”, “Entender motivação e conceitos de testes” e “usar com eficácia um sistema de controle de versão distribuído”
And a aluna “Maria Luiza” se auto avaliou como “MANA” em “Entender motivação e conceitos de testes” e “MA” em “usar com eficácia um sistema de controle de versãGIT o distribuído
    When “Maria Luiza” apertar o botão de “finalizar” da página de “auto avaliação”
    Then aparecerá  uma mensagem de erro
    And a meta “Entender motivação e conceitos de requisitos” é destacada.


Cenário de controlador
Scenario: Auto avaliação não preenchida completamente
    Given o sistema possui as metas  “Entender motivação e conceitos de requisitos”, “Entender motivação e conceitos de testes” e “usar com eficácia um sistema de controle de versão distribuído” cadastradas na planilha de “auto avaliação”
    When o sistema receber o conceito “MANA” em “Entender motivação e conceitos de testes”e  “MA” em “usar com eficácia um sistema de controle de versão distribuído”
    Then o sistema não salvará a planilha de “auto avaliação”
And o sistema retornará uma mensagem de erro
And nova solicitação do stakeholder
Scenario Não há nenhuma discrepância entre o professor e nenhum aluno
    Given que as metas avaliadas são “Entender motivação e conceitos de requisitos”, “Entender motivação e conceitos de testes”, “usar com eficácia um sistema de controle de versão distribuído”, “Definir com qualidade e seguir tarefas, epics e iterações” e “Implementar com qualidade features e cenários”
And a aluna “Larícia Maria” se auto avaliou como  “MPA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de testes”, “MA” em“usar com eficácia um sistema de controle de versão distribuído”, “MA”em  “Definir com qualidade e seguir tarefas, epics e iterações” e “MPA” em“Implementar com qualidade features e cenários”
And o professor  “Paulo Borba” avaliou  “Larícia Mota” como  “MPA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de testes”, “MA” em“usar com eficácia um sistema de controle de versão distribuído”, “MA”em  “Definir com qualidade e seguir tarefas, epics e iterações” e “MPA” em“Implementar com qualidade features e cenários”
    And a aluna  “Pamella Bezerra” se auto avaliou como “MPA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de testes”, “MPA” em“usar com eficácia um sistema de controle de versão distribuído”, “MANA”em  “Definir com qualidade e seguir tarefas, epics e iterações” e “MA” em“Implementar com qualidade features e cenários”
And o professor  “Paulo Borba” avaliou  “Pamella Bezerra” como “MPA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de testes”, “MPA” em“usar com eficácia um sistema de controle de versão distribuído”, “MANA”em  “Definir com qualidade e seguir tarefas, epics e iterações” e “MA” em“Implementar com qualidade features e cenários”
    And a aluna  “Maria Luiza” se auto avaliou como  “MPA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de testes”, “MA” em“usar com eficácia um sistema de controle de versão distribuído”, “MA”em  “Definir com qualidade e seguir tarefas, epics e iterações” e “MPA” em“Implementar com qualidade features e cenários”
And o professor  “Paulo Borba” avaliou  “Maria Luiza” como  “MPA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de testes”, “MA” em“usar com eficácia um sistema de controle de versão distribuído”, “MA”em  “Definir com qualidade e seguir tarefas, epics e iterações” e “MPA” em“Implementar com qualidade features e cenários”
    When o professor  “Paulo Borba” abrir a página de “Discrepâncias”
    Then  “Paulo Borba” verá as estatísticas da turma e uma mensagem indicando que não há discrepâncias
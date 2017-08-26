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
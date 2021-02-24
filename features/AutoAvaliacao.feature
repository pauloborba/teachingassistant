Feature: autoavaliação
	As a usuário estudante no sistema de gerenciamento de metas
    I want to adicionar um conceito de nota para cada meta de conhecimento definida
    so that Eu possa visualizar minhas notas definidas pelos professores e autoavaliações

Scenario: adicionar conceitos na autoavaliação das metas
    Given Eu estou na página de notas
    And Eu vejo que não me autoavaliei na meta “Requisitos 1”
    And Eu vejo que não me autoavaliei na meta “Requisitos 2”
    When Eu clico no botão “Realizar autoavaliação”
    And Eu posso adicionar conceitos às metas
    And Eu seleciono salvar os conceitos
    Then Eu volto para a “Página de Notas” atualizada
    And Eu vejo os conceitos atribuídos às metas

Scenario: adicionar conceitos na autoavaliação das metas
    Given o sistema não possui nenhum conceito de autoavaliação para a aluna Vitória
    When Vitória adiciona o conceito MA para a meta “Requisitos 1”
    Then o conceito MA para a meta “Requisitos 1” é salvo no sistema
    And os conceitos para Vitória foram atualizados, sendo para “Requisitos 1” para MA

Scenario: adicionar um número na autoavaliação das metas
    Given Eu estou na página de autoavaliação
    And Eu vejo que não me autoavaliei na meta “Requisitos 1”
    And Eu vejo que não me autoavaliei na meta “Requisitos 2”
    When Eu adiciono um número no campo de autoavaliação da meta “Requisitos 1”.
    Then Eu vejo uma mensagem de erro relacionada ao tipo de caractere preenchido.
    And Eu continuo na página de autoavaliação.

Scenario: adicionar um número na autoavaliação das metas
    Given o sistema não possui nenhum conceito de autoavaliação para a meta “Requisitos 1” aluna Vitória
    When Vitória adiciona o número 8 como autoavaliação para a meta “Requisitos 1”
    Then o conceito 8 para a meta “Requisitos 1” não é salvo no sistema
    And Vitória não possui conceitos de autoavaliação registrados

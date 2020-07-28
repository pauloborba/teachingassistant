Feature: Auto-Avalia��o
    As a:    Estudante
    I want to: adicionar e enviar minha auto-avalia��o
    So that: eu possa ver a avalia��o do professor e comparar 

GUI:
Scenario: Submetendo auto-avalia��o com sucesso
Given estou na �p�gina de auto-avalia��o�
And todas as 5 metas n�o foram preenchidas
When  adiciono �MA" � �primeira meta�
And adiciono �MPA� � �segunda meta�
And adiciono �MANA� � �terceira meta�
And adiciono �MA� � �quarta meta�
And adiciono �MPA� � �quinta meta�
And pressiono �submeter auto-avalia��o�
Then eu sou redirecionado para a p�gina de�visualiza��o de avalia��es�
And eu posso ver as avalia��es feitas pelo professor
And posso ver as minhas auto-avalia��es tamb�m

Service:
Scenario: Submetendo auto-avalia��o com sucesso
Given o sistema n�o tem armazenado avalia��o de nenhuma das cinco metas 
When  adiciono �MA" � �primeira meta�
And adiciono �MPA� � �segunda meta�
And adiciono �MANA� � �terceira meta�
And adiciono �MA� � �quarta meta�
And adiciono �MPA� � �quinta meta�
And submeto as auto-avalia��es
Then o sistema retorna uma mensagem informando que a auto-avalia��o foi conclu�da com sucesso
And o sistema retorna tamb�m as avalia��es do professor
And o sistema armazena armazena as minhas auto-avalia��es

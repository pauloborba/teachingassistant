Feature: Auto-Avaliação
    As a:    Estudante
    I want to: adicionar e enviar minha auto-avaliação
    So that: eu possa ver a avaliação do professor e comparar 

GUI:
Scenario: Submetendo auto-avaliação com sucesso
Given estou na “página de auto-avaliação”
And todas as 5 metas não foram preenchidas
When  adiciono “MA" à “primeira meta”
And adiciono “MPA” à “segunda meta”
And adiciono “MANA” à “terceira meta”
And adiciono “MA” à “quarta meta”
And adiciono “MPA” à “quinta meta”
And pressiono “submeter auto-avaliação”
Then eu sou redirecionado para a página de”visualização de avaliações”
And eu posso ver as avaliações feitas pelo professor
And posso ver as minhas auto-avaliações também

Service:
Scenario: Submetendo auto-avaliação com sucesso
Given o sistema não tem armazenado avaliação de nenhuma das cinco metas 
When  adiciono “MA" à “primeira meta”
And adiciono “MPA” à “segunda meta”
And adiciono “MANA” à “terceira meta”
And adiciono “MA” à “quarta meta”
And adiciono “MPA” à “quinta meta”
And submeto as auto-avaliações
Then o sistema retorna uma mensagem informando que a auto-avaliação foi concluída com sucesso
And o sistema retorna também as avaliações do professor
And o sistema armazena armazena as minhas auto-avaliações

GUI:
Scenario: Falha ao submeter auto-avaliação
Given estou na “página de auto-avaliação”
And os campos de todas as 5 metas não estão preenchidas
When  adiciono “MA" à “primeira meta”
And adiciono “MPA” à “segunda meta”
And adiciono “MANA” à “terceira meta”
And adiciono “MPA” à “quarta meta”
And pressiono “submeter auto-avaliação”
Then eu permaneço na “página de auto-avaliação”
And mensagem de erro informando que faltou adicionar  auto-avaliação para a meta 5 é exibida na tela


Service:
Scenario: Falha ao submeter auto-avaliação
Given o sistema não tem armazenado avaliação de nenhuma das cinco metas 
When  adiciono “MA" à “primeira meta”
And adiciono “MPA” à “segunda meta”
And adiciono “MANA” à “terceira meta”
And adiciono “MA” à “quarta meta”
And tento submeto as auto-avaliações
Then o sistema retorna uma mensagem de erro informando que nota da meta cinco não foi adicionada com sucesso


Scenario: Lista de discrepância vazia
Given que estou na “página de discrepâncias”
When eu tento ver a “lista de alunos com discrepâncias”
Then me é mostrado uma mensagem indicando que a lista está vazia
And é mostrado que o percentual de alunos com “discrepâncias” é “0%”
And é mostrado que o número de alunos com “discrepâncias” é “0”

Scenario: Lista de discrepância não vazia
Given que estou na “página de discrepâncias”
When eu tento ver a “lista de alunos com discrepâncias”
Then me é mostrado que apenas o aluno “Raul Seixas” tem “discrepância” em sua auto-avaliação
And é mostrado a taxa de discrepância de “Raul seixas”
And é mostrado que o percentual de alunos com “discrepâncias” é “33%”
And é exibido que o número de alunos com “discrepâncias” é “1”.
And é mostrado que o percentual de alunos com “discrepâncias” é “33%”
And é exibido que o número de alunos com “discrepâncias” é “1”.
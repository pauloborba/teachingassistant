Feature: auto-avaliação
As a aluno do centro educacional
I want to preencher completamente e modificar meu preenchimento antes de fazer a confirmação do que coloquei
So that eu possa visualizar corretamente minhas expectativas com as notas recebidas pelo professor sem erros meus.

Cenário de GUI:
Scenario: Preenchendo a auto-avaliação
Given eu estou na página das “avaliações” visualizando a lista de metas “Entender conceitos de requisitos”,  “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” em que posso colocar minha auto-avaliação usando “MA”, “MPA” ou “MANA”
And as notas não estão preenchidas
When eu então preencho minhas metas “Entender conceitos de requisitos” com “MA”, “Especificar requisitos com qualidade” com “MA” e “Entender conceitos de gerência de configuração” com “MA” e seleciono a opção “Confirmar”
Then a página atualiza com meus registros salvos para comparações futuras nas metas mostradas
And na mesma página, poderei ver futuramente a avaliação colocada pelo professor para comparar com as minhas.

Cenário de serviço:
Scenario: salvando o preenchimento da auto-avaliação
Given que  as metas foram preenchidas da seguinte forma: “Entender conceitos de requisitos” com “MA”, “Especificar requisitos com qualidade” com “MA” e “Entender conceitos de gerência de configuração” com “MA” pelo aluno de nome “Robson”
When o aluno “Robson” envia ao sistema por uma opção “Confirmar” para o salvamento da auto-avaliação
Then o sistema faz o armazenamento no banco de dados e atualiza a página com os dados salvos
And agora a página ficará com minha auto-avaliação armazenada assim que abrir.


Cenário de GUI:
Scenario: Preenchendo a auto-avaliação
Given eu estou na página das “avaliações” visualizando a lista de metas “Entender conceitos de requisitos”,  “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” em que posso colocar minha auto-avaliação usando “MA”, “MPA” ou “MANA”
And as notas não estão preenchidas
When eu então preencho minhas metas “Entender conceitos de requisitos” com “MA”, “Especificar requisitos com qualidade” com “MA” e “Entender conceitos de gerência de configuração” eu não preencho e clico no botão “Confirmar”
Then aparece uma página de erro ilustrando o motivo da falha (“ausência de conceitos”) e indicando a falha a ser corrigida que é o preenchimento da meta “Entender conceitos de gerência de configuração”
And não é possível avançar até concluir corretamente todo o preenchimento ou então posso cancelar a ação pelo botão “Cancelar”

Cenário de serviço:
Scenario: salvando o preenchimento da auto-avaliação
Given que  as metas foram preenchidas da seguinte forma: “Entender conceitos de requisitos” com “MA”, “Especificar requisitos com qualidade” com “MA” e “Entender conceitos de gerência de configuração” não foi preenchida pelo aluno chamado “Robson”
When o aluno “Robson” envia ao sistema por um botão “Confirmar” para o salvamento da auto-avaliação
Then o sistema faz uma análise do preenchimento, verifica que contêm falha no preenchimento da meta “Entender conceitos de gerência de configuração”
And indica na tela para preencher corretamente o campo “Entender conceitos de gerência de configuração”
And só posso prosseguir depois que corrigir as falhas.
Then alteracao nova
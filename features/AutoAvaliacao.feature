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
teste

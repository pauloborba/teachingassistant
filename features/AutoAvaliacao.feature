Feature: auto-avaliação
As an aluno registrado no sistema
I want to adicionar conceitos para as minhas metas avaliativas registradas no sistema
So that eu gere uma avaliação autocrítica destinada à posterior análise do professor.

Scenario: adicionar auto-avaliação
Given o sistema tem registradas as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
And não tem registrada a auto-avaliação do aluno “Jéssica Oliveira”
When o aluno “Jéssica Oliveira” atribui como auto-avaliação o conceito “MA” para a meta “Entender conceitos de requisitos”,  “MA” para a meta “Especificar requisitos com qualidade” e “MPA” para a meta “Entender conceitos de gerência de configuração”
Then o sistema registra a auto-avaliação do aluno “Jéssica Oliveira”

Scenario: adicionar auto-avaliação (GUI)
Given eu estou logado no sistema como “aluno” e o login “JessicaOliveira”
And estou na página “Auto-avaliação”
And eu posso ver listadas as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
And eu posso ver os conceitos atribuídos pelo professor a cada uma das metas existentes
When eu seleciono os conceitos “MA” para a meta “Entender conceitos de requisitos”,  “MA” para a meta “Especificar requisitos com qualidade” e “MPA” para a meta “Entender conceitos de gerência de configuração”
And eu seleciono a opção “Salvar”
Then eu posso ver uma mensagem de confirmação
And eu vejo a listagem das metas contendo os conceitos “MA” para as metas “Entender conceitos de requisitos” e “Especificar requisitos com qualidade” e “MPA” para a meta “Entender conceitos de gerência de configuração” 
And eu vejo os conceitos atribuídos pelo professor para cada meta

Scenario: adicionar auto-avaliação (mal sucedido)
Given o sistema tem registradas as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
And não tem registrada a auto-avaliação do aluno “Jéssica Oliveira”
When o aluno “Jéssica Oliveira” atribui como auto-avaliação o conceito “MPA” para a meta “Entender conceitos de requisitos”,  “MA” para a meta “Especificar requisitos com qualidade”
And não atribui um conceito para a meta “Entender conceitos de gerência de configuração”
Then o sistema não registra a auto-avaliação do aluno “Jéssica Oliveira”

Scenario: adicionar auto-avaliação (mal sucedido - GUI)
Given eu estou logado no sistema como “aluno” e o login “JessicaOliveira”
And estou na página “Auto-avaliação”
And eu posso ver listadas as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
And eu posso ver os conceitos atribuídos pelo professor a cada uma das metas existentes
When eu seleciono os conceitos “MA” para a meta “Entender conceitos de requisitos” e “MA” para a meta “Especificar requisitos com qualidade”
And não seleciono um conceito para a meta “Entender conceitos de gerência de configuração”
And eu seleciono a opção “Salvar”
Then eu posso ver uma mensagem de erro
And eu vejo a listagem das metas apenas com os conceitos atribuídos pelo professor a cada uma delas

Scenario: verificar auto-avaliação discrepante (nenhuma discrepância)
Given eu estou logado no sistema como “professor” e o login “PauloBorba”
And estou na página “Alunos”
And eu posso ver uma lista contendo os nomes dos alunos “José Silva”, “Ana Carla” e “Daphne Lima”
When eu seleciono a opção “Listar discrepâncias” 
Then eu posso ver uma mensagem indicando que não há alunos com auto-avaliações discrepantes
And eu vejo a mesma listagem dos nomes dos alunos citados
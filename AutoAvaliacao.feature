Feature: auto-avaliação
Como um estudante
Eu quero ser capaz atribuir conceitos a mim mesmo
De forma a poder registrar as discrepancias entre a minha avaliação e a do professor

[COMMIT PARA A QUESTAO 23A(MASTER)]

GUI: 
Dado que eu estou logado como “aluno”
E eu estou em “página de notas” 
[MODIFICACAO] E tenho metas em que ainda não me auto-avaliei
E preencho o conceito de “requisitos” com “MPA”, “testes” com “MANA” e “refatoração” com “MA”
[MODIFICACAO 2]E eu posso ver os conceitos avaliados pelo professor
Quando eu insiro as auto-avaliações das metas
E seleciono a opção “ENTREGAR TUDO”
Então os conceitos ficam registrados no sistema
E eu posso ver que me conceituei com “MPA” em requisitos, “MANA” em “testes” e “MA” em “refatoração”
E eu posso ver uma mensagem informando que a entrega foi feita com sucesso

[COMMIT PARA QUESTAO 23 A (DISCREPANTES)1]

Serviço:
Dado que eu acesso o sistema como “aluno”
Quando eu envio a auto-avaliação 
Então o sistema retorna uma mensagem de confirmação de preenchimento com sucesso
E insere os conceitos na base de dados

[COMMIT PARA QUESTAO 23 A (DISCREPANTES)2]

Cenário GUI:
Dado que eu estou logado como “aluno”
E eu estou na “página de notas”
E tenho metas em que ainda não me auto-avaliei
E eu posso ver os conceitos avaliados pelo professor
Quando eu insiro “MPA” na meta “requisitos”, “MANA” em “testes” e não preencho o conceito de “refatoração”
E seleciono a opção “ENTREGAR TUDO”
Então eu posso ver uma mensagem na tela informando que a entrega não pôde ser realizada devido à falta de conceitos

Cenário de serviço:
Dado que eu acesso o sistema como “aluno”
E eu tenho metas em que ainda não me auto-avaliei
Quando eu tento enviar as auto-avaliações sem um dos conceitos
Então o servidor retorna uma mensagem de erro devido à ausência do conceito 
E 'passo adicional'

Cenário sem discrepancia:
Dado que estou na “página de notas”
E não há nenhuma discrepância
Quando eu seleciono a opção “Estatísticas de auto-avaliação”
Então eu posso a lista vazia de alunos discrepantes
E posso ver uma mensagem informando o percentual de avaliações discrepantes

Cenário com discrepância:
Dado que estou na “página de notas”
E “Alex” e “Beatriz” se avaliaram sem que houvessem discrepâncias
E “Mário” se avaliou com discrepância
Quando eu seleciono a opção “Estatísticas de auto-avaliação”
Então eu posso ver uma lista de alunos com auto-avaliações discrepantes composta somente por “Mário”
E uma mensagem informando que houve 33% de discrepâncias	
[CORRECAO FIXDISCREPANCIA]
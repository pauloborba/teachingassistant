Feature: auto-avaliação
Como um estudante
Eu quero ser capaz atribuir conceitos a mim mesmo
De forma a poder registrar as discrepancias entre a minha avaliação e a do professor

GUI: 
Dado que eu estou logado como “aluno”
E eu estou em “página de notas” 
[MODIFICACAO] E tenho metas em que ainda não me auto-avaliei
E preencho o conceito de “requisitos” com “MPA”, “testes” com “MANA” e “refatoração” com “MA”
E eu posso ver os conceitos avaliados pelo professor
Quando eu insiro as auto-avaliações das metas
E seleciono a opção “ENTREGAR TUDO”
Então os conceitos ficam registrados no sistema
E eu posso ver que me conceituei com “MPA” em requisitos, “MANA” em “testes” e “MA” em “refatoração”
E eu posso ver uma mensagem informando que a entrega foi feita com sucesso

Serviço:
Dado que eu acesso o sistema como “aluno”
Quando eu envio a auto-avaliação 
Então o sistema retorna uma mensagem de confirmação de preenchimento com sucesso
E insere os conceitos na base de dados


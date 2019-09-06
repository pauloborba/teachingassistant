Feature: Auto avaliação do aluno
As a aluno
I want to atribuir com conceito “MA”, “MPA” ou “MANA” as metas dadas pelo professor
So that me avaliar e talvez ter conhecimento sobre onde eu possa melhorar

Scenario: preenchimento bem sucedido da auto avaliação(GUI)
Given eu estou na página de “Auto Avaliação”
And eu vejo que não tenho nenhum conceito aplicado relacionado às “Metas” em “Auto Avaliação”
When eu adiciono “MA” na metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
And eu salvo os conceitos
//linha adicionada para realização da atividade
Then Eu vejo uma mensagem de preenchimento bem sucedido
And eu estou na página de “Auto Avaliação”
And eu vejo o conceito “MA” relacionado às “Metas” em “Auto Avaliação”

Feature: Auto-avaliação
As a Aluno
I want to me auto-avaliar
So that i can de forma mais rápida e prática pedir revisão de notas


Cenário: preenchimento das metas por completo pelo usuário
GUI:
Given o usuário preencheu todas as metas nos seus espaços correspondentes
When “for confirmada a auto-avaliação”
Then é mostrada uma mensagem dizendo que o sistema foi atualizado

Cenário: recebimento das metas por completo pelo sistema
Controlador:
Given o sistema “recebeu todas as metas disponíveis”
When “os dados forem salvos no sistema”
Then os dados “são salvos no sistema”

GUI:
Cenário: ausência de conceitos no preenchimento das metas
Given o usuário não preencheu todas as metas nos seus espaços correspondentes
When “for confirmada a auto-avaliação”
Then é mostrada uma mensagem de erro falando sobre o ocorrido (espaços vazios)

Controlador:
Cenário: ausência de conceitos no recebimento de metas
Given o sistema não “recebeu todas as metas disponíveis”
When  “os dados forem salvos no sistema”
Then os dados não “são salvos no sistema” (há descarte dos dados)


Cenário: Não há discrepâncias entre autoavaliações e avaliações do professor
Given Nenhum “aluno se auto-avaliou de forma discrepante”
When “A página de resultado da auto-avaliação é atualizada”
Then a quantidade e percentual de alunos mostrados são iguais a “0” e “0%”, respectivamente
And a lista “fica vazia”

Cenário: apenas um aluno (num total de três) apresentou discrepâncias na autoavaliação
Given um “aluno se auto-avaliou de forma discrepante”
And o nome, cpf, log-in e metas discrepantes são respectivamente:”Ana”, “106.676.877-90”, “AS” e “Meta1, Meta2, Meta3”
When “A página de resultado da auto-avaliação é atualizada”
Then a quantidade e percentual de alunos mostrados são iguais a, respectivamente, “1” e “33%”
And os dados do aluno (nome, cpf, log-in e metas discrepantes) são mostrados na lista


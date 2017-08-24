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
Then os dados não “são salvos no sistema” (há descarte dos dados) mudança vaudsauhasuhda

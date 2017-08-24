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

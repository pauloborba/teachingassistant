Feature: Auto-avalia��o
As a Aluno
I want to me auto-avaliar
So that i can de forma mais r�pida e pr�tica pedir revis�o de notas


Cen�rio: preenchimento das metas por completo pelo usu�rio
GUI:
Given o usu�rio preencheu todas as metas nos seus espa�os correspondentes
When �for confirmada a auto-avalia��o�
Then � mostrada uma mensagem dizendo que o sistema foi atualizado

Cen�rio: recebimento das metas por completo pelo sistema
Controlador:
Given o sistema �recebeu todas as metas dispon�veis�
When �os dados forem salvos no sistema�
Then os dados �s�o salvos no sistema�

GUI:
Cen�rio: aus�ncia de conceitos no preenchimento das metas
Given o usu�rio n�o preencheu todas as metas nos seus espa�os correspondentes
When �for confirmada a auto-avalia��o�
Then � mostrada uma mensagem de erro falando sobre o ocorrido (espa�os vazios)

Controlador:
Cen�rio: aus�ncia de conceitos no recebimento de metas
Given o sistema n�o �recebeu todas as metas dispon�veis�
When  �os dados forem salvos no sistema�
Then os dados n�o �s�o salvos no sistema� (h� descarte dos dados) mudan�a vaudsauhasuhda

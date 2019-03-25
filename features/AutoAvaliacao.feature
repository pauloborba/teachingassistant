Auto-Avaliacao do sistema de gerenciamento de metas
Cenarios de preenchimento bem sucedido:

Given que eu estou no menu das notas de um aluno
And ele adicionou uma nota para cada espaço atribuído 
And ele utilizou caracteres válidos
And não deixou espaços em branco
Then O preenchimento foi bem sucedido

Cenarios de preenchimento mal sucedido:

Given que eu estou no menu das notas de um aluno
And ele não adicionou uma nota para cada espaço atribuído 
Or ele não utilizou caracteres válidos
Or deixou espaços em branco
Then O preenchimento foi mal sucedido

Cenarios sem discrepancia:
Given que eu estou no menu das notas de um aluno
And ele adicionou uma nota para cada espaço atribuído 
And ele utilizou caracteres válidos
And não deixou espaços em branco
Then O preenchimento foi bem sucedido sem discrepancias

Cenarios com discrepancia:
Given que eu estou no menu das notas de um aluno
And ele adicionou uma nota para cada espaço atribuído 
And ele utilizou caracteres válidos
And não deixou espaços em branco
And pelo menos 1/3 das notas que ele auto-atribuiu são maiores que as que eu atribuí a ele
Then O preenchimento foi bem sucedido com discrepancias
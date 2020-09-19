Sistema de Gerenciamento de metas de auto-avalia��o 

Scenario: preenchendo auto-avalia��o totalmente
Given eu vejo os conceitos de �MA, MA, MANA� respectivamente atribu�dos pelo professor na mesma p�gina
And estou logado como �Humberto� na p�gina �SGM�
And as auto-avalia��es do Aluno �Humberto� n�o est�o armazenadas no sistema
When eu avalio com �MA�, �MPA�,  respectivamente 2 das 3 metas conceituadas pelo professor
And eu seleciono a op��o de �enviar�
Then eu recebo uma mensagem de sucesso de auto-avalia��o
And eu tenho a op��o de voltar para a p�gina de �SGM�


Scenario preenchendo auto-avalia��o parcialmente
Given eu vejo os conceitos de �MA, MA, MANA� respectivamente atribu�dos pelo professor na mesma p�gina
And estou logado como �Humberto� na p�gina �SGM�
And as auto-avalia��es do Aluno �Humberto� n�o est�o armazenadas no sistema
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
When eu avalio com �MA�, �MPA� respectivamente 2 das 3 metas conceituadas pelo professor
And seleciona a op��o �enviar�
Then eu recebo uma mensagem de erro
And eu tenho a op��o de voltar para a p�gina de �SGM�
And as auto-avalia��es do Aluno "Humberto" ainda n�o est�o armazenadas no sistema


Scenario: an�lise de discrepantes quando n�o h� discrep�ncia
Given Estou logado na p�gina �SGM� como �Professor�
And as auto-avalia��es dos alunos est�o armazenadas no sistema
And �3� �alunos� est�o armazenados no sistema
And os �3� alunos n�o possuem discrep�ncias
When seleciono a op��o �An�lise de discrep�ncia�
Then � mostrado uma lista � � de alunos com discrep�ncia
And � mostrado o total de aluno/s �0� com discrep�ncia
And � mostrado a porcentagem �0%� de alunos discrepantes
testeteste


Scenario: analise de discrepantes quando 3 entre 6 s�o discrepantes
Given Estou logado no sistema como �Professor�
And estou na p�gina �SGM�
And as auto-avalia��es dos alunos est�o armazenadas no sistema
And �6� �alunos� est�o armazenados no sistema
When seleciono a op��o �An�lise de discrep�ncia�
Then � mostrado uma lista �Joao, Roberto, Marcelo � de alunos com discrep�ncia
And � mostrado o total de aluno/s �3� com discrep�ncia
And � mostrado a porcentagem �50%� de alunos discrepantes
And eu vejo a op��o de voltar para a p�gina anterior

Feature: [Auto Avalia��o]
As a [Aluno]
I want to [Atribuir conceitos que eu acho justos �s minhas metas e, ao mesmo tempo, observar os conceitos que o professor me atribuiu]
so that [Eu posso relacionar as avalia��es]

Scenario: Preenchimento correto de Auto Avalia��o (GUI)
Given Eu estou na tela de �auto avalia��o� logado como �Aluno�
And os conceitos dados pelo professor para as metas j� aparecem na tela
When Eu tenho enviar um formul�rio preenchido com todas as avalia��es
Then � exibida uma mensagem de sucesso

Scenario: Preenchimento correto de Auto Avalia��o (Servi�o)
Given O sistema apresenta as avalia��es do professor para as metas �Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de ger�ncia de configura��o, Etc.� do aluno �Saulo Guilhermino�, mas n�o apresenta as auto avalia��es do aluno �Saulo Guilhermino�
When O aluno �Saulo Guilhermino� preenche os campos de avalia��o das metas �Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de ger�ncia de configura��o, Etc.� com as avalia��es �MANA, MPA, MA, MA�  e envia o formul�rio para o servidor
Then O sistema armazena as avalia��es nos campos necess�rios.

Scenario: Preenchimento incompleto de Auto Avalia��o (GUI)
Given Eu estou na tela de �Auto avalia��o� logado como �Saulo Guilhermino�
And as avalia��es do professor para as metas j� aparecem na tela
When Eu tento enviar um formul�rio com um campo n�o preenchido
Then � exibida uma mensagem de erro

Scenario: Preenchimento incompleto de Auto Avalia��o (Servi�o)
Given O sistema apresenta as avalia��es dados pelo professor para as metas  do aluno �Saulo Guilhermino�, mas n�o apresenta as auto-avalia��es do aluno �Saulo Guilhermino�
When O aluno tenta enviar para o servidor as avalia��es um formul�rio com um campo n�o preenchido
Then O sistema n�o armazena as avalia��es enviadas incorretamente
And N�o ocorre qualquer altera��o nas avalia��es já registradas.

Scenario: Visualiza��o de Discrep�ncias sem alunos discrepantes
Given Eu estou logado como �Professor�
And tenho uma turma de apenas 3 alunos
And A aluna �Mariana Cec�lia� tem conceitos �MA, MPA, MPA, MANA, MA� e se auto-avaliou com �MA, MA, MANA, MANA, MPA� 
And O aluno �Jo�o C�sar� tem conceitos �MPA, MPA, MPA, MPA e se auto-avaliou com �MANA, MANA, MANA, MANA�
And O aluno �Jos� Marcos� tem conceitos �MPA, MPA, MA, MANA� e se avaliou com �MPA, MPA, MA, MANA�
When Eu abro a tela de �Discrep�ncias�
Then � exibida uma tela apenas com a quantidade de alunos como �0� 
And a porcentagem � exibida como �0%�

Scenario: Visualização de Discrepâncias de um aluno numa turma de três alunos.
Given Eu estou logado como “Professor”
And tenho uma turma de apenas 3 alunos
And O aluna “João Pedro” tem conceitos “MA, MPA, MPA, MANA, MA” e se auto-avaliou com “MA, MA, MA, MPA, MA” 
And O aluno “José Marcos” tem conceitos “MPA, MPA, MPA, MPA e se auto-avaliou com “MANA, MANA, MANA, MANA”
And O aluno “Igor Daniel” tem conceitos “MPA, MPA, MA, MANA” e se avaliou com “MPA, MPA, MA, MANA”
When Eu abro a tela de “Discrepâncias”
Then É exibida uma tela com a quantidade de alunos como “1”, a porcentagem como “33,3%”, e o nome do aluno que apresentou discrepância em suas avaliações

Scenario: Visualização de Discrepâncias de dois alunos numa turma de três alunos
Given Eu estou logado como “Professor”
And Eu tenho uma turma de apenas 3 alunos
And A aluna “Mariana Cecília” tem conceitos “MA, MPA, MPA, MANA, MA” e se auto-avaliou com “MA, MA, MA, MPA, MA” 
And O aluno “João César” tem conceitos “MPA, MPA, MPA, MPA e se auto-avaliou com “MA, MA, MA, MA”
And O aluno “José Marcos” tem conceitos “MPA, MPA, MA, MANA” e se avaliou com “MPA, MPA, MA, MANA”
When Eu abro a tela de “Discrepâncias”
Then É exibida uma tela com a quantidade de alunos como “2”. a porcentagem como “66,6%”, e os nomes dos alunos que apresentaram discrepâncias em suas avaliações

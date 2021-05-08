Feature: Auto-avalia��o de metas.
As a: Aluno membro de uma institui��o de ensino.
i want to: me auto-avaliar e visualizar as notas que recebi pelo professor em cada meta.
so that: Analisar se a nota que eu esperava receber condiz com a nota que recebi.

GUI based scenario

Scenario: Auto-avaliando todos os conceitos.
Given eu estou na p�gina �Home� logado como �Samuel Miranda� na turma "ESS-2019.2"
And eu vejo que ainda n�o me auto-avaliei
When seleciono a op��o �Avalie-se�
And eu adiciono as notas �MA,MPA ou MANA� em todos os campos de �Nota de auto-avalia��o�
And eu finalizo o cadastro de notas
Then eu visualizo uma mensagem de confirma��o do procedimento
And as notas auto-avaliadas s�o salvas

Service based scenario

Scenario: Auto-avaliando todos os conceitos.
Given o estudante �Samuel Oliveira� est� cadastrado na turma "ESS-2019.2"
And o estudante n�o auto-avaliou-se no sistema de notas
When Ele insere no sistema as notas �MA,MPA ou MANA� de todas as metas propostas para ele avaliar
And ele tenta salvar as notas no sistema
Then todas as notas auto-avaliadas por �Samuel Oliveira� s�o salvas no sistema

-------------------------PREENCHIMENTO MAL SUCEDIDO-----------------------------
GUI based scenario

Scenario: N�o auto-avaliando todos os conceitos.
Given eu estou na p�gina �Home� logado como �Johnny Herbert� na turma "ESS-2019.2"	
And eu vejo que ainda n�o me auto-avaliei
When eu seleciono a op��o �Avalie-se�
And eu adiciono a nota �MA� no campo de �Auto-Avalia��o� na meta de �Requisitos�.
And eu adiciono a nota �MA� no campo de �Nota de auto-avalia��o� na meta de �Ger�ncia de Projetos�.
And eu finalizo o cadastro de notas
Then eu visualizo uma mensagem de erro no procedimento
And as notas n�o s�o salvas no sistema

Service based scenario

Scenario: N�o auto-avaliando todos os conceitos da turma.
Given o estudante �Johnny Herbert� est� cadastrado na turma "ESS-2019.2"
And a estudante �Cristina Rocha� est� cadastrada na turma "ESS-2019.2"
And a estudante "Cristina Rocha" possui a nota "MA" em todas as notas de auto-avalia��o da turma
And o estudante "Johnny Herbert" n�o auto-avaliou-se no sistema de notas
When Ele insere no sistema a nota �MANA� na meta de �Requisitos�
And ele insere no sistema a nota �MPA� na meta de �Ger�ncia de Configura��o�
And ele tenta salvar as notas no sistema
Then as notas auto-avaliadas por �Johnny Herbert� n�o s�o salvas no sistema
And as notas de auto-avalia��o de "Cristina Rocha" continuam salvas no sistema como "MA"
And o estudante "Johnny Herbert" continua cadastrado no sistema
And a estudante "Cristina Rocha" continua cadastrada no sistema


-----------------------------------Discrep�ncia-------------------------------------


Scenario: Nenhum aluno possui discrep�ncia em mais de 25% das metas.
Given eu estou na p�gina �Notas gerais� logado como �Prof. Samuel Miranda�
And a turma possui as metas �Requisitos�, �Ger�ncia de configura��o�, �Ger�ncia de Projetos�, �Arquitetura e linguagem� e �Testes�
And a turma possui "3" alunos
And a turma possui "5" metas para serem atingidas.
And o aluno �Anderson Cesar Bahiano� possui em �Requisitos� nota auto-avaliada �MA� com nota recebida �MPA�, nas demais notas recebidas ele possui �MA� com nota auto-avaliada �MPA�.
And a aluna �Cristina da Silva dos Santos� possui em todas as metas a nota auto-avaliada �MA�, nota recebida �MA�
And o aluno �Johnny Herbert Muniz Nunes� possui em todas as metas a nota auto-avaliada �MNA� , nota recebida �MA�
When eu seleciono a op��o �Listar discrepantes�
Then eu visualizo uma mensagem informando que n�o h� nenhuma discrep�ncia nos alunos da turma.

Scenario: Um aluno possui discrep�ncia em pelo menos 25% das metas
Given eu estou na p�gina �Notas gerais� logado como �Prof. Samuel Miranda�
And a turma possui "3" alunos
And a turma possui "5" metas para serem atingidas.
And o aluno �Anderson Cesar da Silva� possui em �Requisitos� e �Ger�ncia de Configura��o� as notas auto-avaliadas �MA� com nota recebida �MPA�, nas demais notas recebidas ele possui �MA� com nota auto-avaliada �MPA�.
And a aluna �Cristina da Silva de Oliveira� possui em todas as metas a nota auto-avaliada �MPA�, nota recebida �MPA�
And o aluno �Johnny Herbert Muniz Nunes� possui em todas as metas a nota auto-avaliada �MANA� , nota recebida �MA�
When eu seleciono a op��o �Listar discrepantes�
Then eu visualizo que apenas o aluno �Anderson Cesar da Silva� est� na lista de alunos com discrep�ncia nas notas.
And a porcentagem de alunos com notas discrepantes � de "33,3%".

-----------------------------VISUALIZA��O DE DISCREP�NCIA------------------------------

Scenario cen�rio fict�cio para quest�o 15a
Given 
When
Then
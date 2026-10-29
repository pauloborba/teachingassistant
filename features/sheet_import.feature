Feature: Importação de alunos por planilha
As a professor da disciplina "Engenharia de Software e Sistemas"
I want to importar os alunos de uma turma por meio de uma planilha
So that os alunos sejam cadastrados no sistema de forma rápida e correta.

#Serviço
Scenario: Importar planilha de turma de forma correta
Given o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When envio uma planilha contendo os nomes “Norman Osborn” e “Otto Octavius”, seus e-mails “no@cin.ufpe.br” e “oo@cin.ufpe.br” e CPFs “123.433.444-10” e “123.533.444-10”
Then os alunos “Norman Osborn” e “Otto Octavius” são inseridos no sistema
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema.

Scenario: Importar planilha com coluna incorreta
Given o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When envio uma planilha contendo os nomes “Norman Osborn” e “Otto Octavius”, suas matrículas “123” e “543” e CPFs “123.433.444-10” e “123.533.444-10”
Then os alunos “Norman Osborn” e “Otto Octavius” não são inseridos no sistema
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema
And é retornada uma mensagem de erro "COLUNA_INCORRETA".

Scenario: Importar planilha com coluna faltante
Given o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When envio uma planilha contendo os nomes “Norman Osborn” e “Otto Octavius” e seus e-mails “no@cin.ufpe.br” e “oo@cin.ufpe.br”
Then os alunos “Norman Osborn” e “Otto Octavius” não são inseridos no sistema
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema
And é retornada uma mensagem de erro "COLUNA_FALTANTE".

Scenario: Importar planilha com coluna extra
Given o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When envio uma planilha contendo os nomes “Norman Osborn” e “Otto Octavius”, seus e-mails “no@cin.ufpe.br” e “oo@cin.ufpe.br”, CPFs “123.433.444-10” e “123.533.444-10” e telefones “10991234567” e “10919891122”
Then os alunos “Norman Osborn” e “Otto Octavius” não são inseridos no sistema
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema
And é retornada uma mensagem de erro "COLUNA_EXTRA".

Scenario: Importar planilha com dados faltando
Given o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When envio uma planilha contendo os nomes “Norman Osborn” e “Otto Octavius”, seus e-mails “no@cin.ufpe.br” e “oo@cin.ufpe.br” e seus CPFs vazios
Then os alunos “Norman Osborn” e “Otto Octavius” não são inseridos no sistema
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema
And é retornada uma mensagem de erro "DADOS_INCOMPLETOS".

Scenario: Importar planilha com e-mail no formato incorreto
Given o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44”
When envio uma planilha contendo o nome “Norman Osborn”, seu e-mail “no.cin.ufpe.br” e seu CPF “123.433.444-10”
Then o aluno “Norman Osborn” não é inserido no sistema
And o aluno “Mary Jane” permanece cadastrado no sistema
And é retornada uma mensagem de erro "DADOS_INVALIDOS".

Scenario: Importar planilha com CPF no formato incorreto
Given o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44”
When envio uma planilha contendo o nome “Peter Parker”, seu e-mail “pp@cin.ufpe.br” e seu CPF “12345678910”
Then o aluno “Peter Parker” não é inserido no sistema
And o aluno “Mary Jane” permanece cadastrado no sistema
And é retornada uma mensagem de erro "DADOS_INVALIDOS".

Scenario: Importar planilha com aluno já cadastrado
Given o sistema possui o aluno “Gwen Stacy” com e-mail “gs@cin.ufpe.br” e CPF “111.333.222-10”
When envio uma planilha contendo o nome “Gwen Stacy”, seu e-mail “gs@cin.ufpe.br” e seu CPF “111.333.222-10”
Then o aluno “Gwen Stacy” não é duplicado no sistema
And o aluno permanece cadastrado no sistema com o e-mail “gs@cin.ufpe.br” e CPF “111.333.222-10”
And é retornada uma mensagem "ALUNO_JA_CADASTRADO".

Scenario: Importar planilha vazia
Given o sistema possui os alunos “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” e “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When envio uma planilha sem registros de alunos
Then nenhum novo aluno é inserido no sistema
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema
And é retornada uma mensagem de erro "PLANILHA_VAZIA".

Scenario Outline: Importar planilha em formato de arquivo compatível
Given o sistema possui o aluno “Mary Jane” com e-mail "mj@cin.ufpe.br" e CPF “111.222.333-44”
When envio um arquivo <formato> contendo os nomes “Norman Osborn” e “Otto Octavius”, seus e-mails “no@cin.ufpe.br” e “oo@cin.ufpe.br” e CPFs “123.433.444-10” e “123.533.444-10”
Then os alunos “Norman Osborn” e “Otto Octavius” são inseridos no sistema com os respectivos dados
And o aluno “Mary Jane” permanece cadastrado no sistema com o e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44”.

Examples:
| formato |
| CSV     |
| XLSX    |


Scenario Outline: Importar arquivo em formato incompatível
Given o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44”
When envio um arquivo <formato> contendo os nomes “Norman Osborn” e “Otto Octavius”, seus e-mails “no@cin.ufpe.br” e “oo@cin.ufpe.br” e seus CPFs “123.433.444-10” e “123.533.444-10”
Then os alunos “Norman Osborn” e “Otto Octavius” não são inseridos no sistema
And o aluno “Mary Jane” permanece cadastrado no sistema com o e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44”
And é retornada uma mensagem de erro "FORMATO_INCOMPATIVEL".

Examples:
| formato |
| PDF     |
| TXT     |


# GUI
Scenario: Acessar a funcionalidade de importação
Given estou na página de gerenciamento dos alunos da disciplina "ESS 2026.2"
And o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When acesso a opção de importar alunos por planilha
Then é exibida a interface de importação de alunos
And os alunos “Mary Jane” e “Harry Osborn” permanecem exibidos na lista de alunos.

Scenario: Exibir seletor de arquivo
Given estou na interface de importação de alunos
And o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When seleciono a opção para escolher uma planilha
Then é exibida a janela de seleção de arquivos do sistema
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema.

Scenario: Selecionar uma planilha válida
Given estou na interface de importação de alunos
And o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When seleciono um arquivo CSV contendo os alunos “Norman Osborn” e “Otto Octavius”
Then o nome do arquivo selecionado é exibido na interface
And a opção de importar os alunos fica disponível
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema.

Scenario: Importar planilha válida pela interface
Given estou na interface de importação de alunos
And o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
And selecionei uma planilha válida contendo os alunos “Norman Osborn” e “Otto Octavius”
When aciono a opção de importar os alunos
Then é exibida uma mensagem "Planilha de alunas importada corretamente"
And os alunos “Norman Osborn” e “Otto Octavius” são exibidos na lista de alunos
And os alunos “Mary Jane” e “Harry Osborn” permanecem exibidos na lista de alunos.

Scenario: Cancelar a seleção da planilha
Given estou na interface de importação de alunos
And o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
And a janela de seleção de arquivos está aberta
When cancelo a seleção do arquivo
Then retorno para a interface de importação
And nenhuma planilha é selecionada
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema.

Scenario: Tentar importar sem selecionar uma planilha
Given estou na interface de importação de alunos
And o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
And nenhuma planilha foi selecionada
When aciono a opção de importar os alunos
Then a importação não é realizada
And é exibida uma mensagem "Selecione uma planilha antes de importar"
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema.

Scenario: Exibir erro ao selecionar arquivo em formato incompatível
Given estou na interface de importação de alunos
And o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When seleciono um arquivo PDF contendo dados de alunos
Then a importação não é realizada
And é exibida uma mensagem de erro "Formato esperado: CSV ou XLSX"
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema.

Scenario: Exibir erro de validação da planilha
Given estou na interface de importação de alunos
And o sistema possui o aluno “Mary Jane” com e-mail “mj@cin.ufpe.br” e CPF “111.222.333-44” 
And o sistema possui “Harry Osborn” com e-mail “ho@cin.ufpe.br” e CPF “222.333.444-55”
When seleciono uma planilha contendo os alunos “Norman Osborn” e “Otto Octavius” sem a coluna CPF
And aciono a opção de importar os alunos
Then a importação não é realizada
And é exibida a mensagem de erro "Coluna esperada: CPF"
And os alunos “Mary Jane” e “Harry Osborn” permanecem cadastrados no sistema
And os alunos “Norman Osborn” e “Otto Octavius” não são exibidos na lista de alunos.

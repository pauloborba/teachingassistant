Feature: importar alunos
	As a professor responsável pela turma
	I want to ser capaz de importar vários alunos a partir de um arquivo csv
	So that eu possa cadastrar os alunos na turma

Scenario: importar alunos
Given estou na pagina de alunos
When eu escolho o arquivo "Alunos.csv"
Then eu vejo o aluno "Eduardo" com seu CPF "123" na lista de alunos
Then eu vejo o aluno "Luiz" com seu CPF "321" na lista de alunos

Scenario: importar alunos de arquivo inválido
Given estou na pagina de alunos
When eu escolho o arquivo "Alunos.pdf"
Then eu vejo uma mensagem de erro

Scenario: importar alunos de arquivo em branco
Given estou na pagina de alunos
When eu escolho o arquivo "ArquivoVazio.csv"
Then eu vejo uma mensagem de erro

Scenario: importar via csv aluno com cpf já cadastrado
Given estou na pagina de alunos
When eu escolho o arquivo "Alunos.csv" que contém o aluno "Eduardo" de CPF "123" já cadastrado
Then eu vejo uma mensagem de erro
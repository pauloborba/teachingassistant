Feature: importar alunos
	As a professor responsável pela turma
	I want to ser capaz de importar vários alunos a partir de um arquivo csv
	So that eu possa cadastrar os alunos na turma

Scenario: importar alunos 
Given estou na pagina alunos 
When eu escolho o arquivo “Alunos.csv” com os alunos “Pedro” e “José” seguidos de seus e-mails “pdro@cin.ufpe.br” e “jse@cin.ufpe.br”
Then eu vejo os nomes “Pedro” e “José” e com seus e-mails “pdro@cin.ufpe.br” e “jse@cin.ufpe.br”  na lista de alunos cadastrados

Scenario: importar alunos de arquivo inválido 
Given estou na pagina alunos
When eu seleciono o arquivo “Alunos.pdf”
Then eu vejo uma mensagem de erro

Scenario: importar alunos de arquivo em branco
Given estou na pagina alunos 
And eu seleciono “importar alunos” 
And escolho o arquivo “AlunosVazio.csv” que não contém dados
Then eu vejo uma mensagem de erro

Scenario: importar alunos de arquivo com dados invalidos
Given estou na pagina alunos 
And eu seleciono “importar alunos” 
And escolho o arquivo “Alunos.csv” que contém os alunos de nome “1587adijq” e “@fail” e os e-mails “--123]@cin.ufpe.,” e “@78q*”
Then eu vejo uma mensagem de erro
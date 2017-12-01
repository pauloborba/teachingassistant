Feature: As um professor
         I want cadastrar mais de uma avaliacao para uma meta 
		 So that eu possa manter registro dos conceitos que um aluno obteve em cada meta
		

Scenario: cadastro de avaliacao
Given Eu estou na pagina de "Conceitos"
Given eu consigo ver os campos data, avaliacao e meta todos em branco 
Given Ha um aluno de cpf "134.564.653.12" e outro aluno de cpf "638.584.483.11" cadastrados
When eu tento preencher os campos data com "21/02" , avaliação com "prova" e meta com "requisitos"
Then eu posso ver na linha do aluno de cpf "134.564.653.12" na coluna de requisitos o campo em branco para o cadastro de conceitos
Then eu posso ver na linha do aluno de cpf "638.584.483.11" na coluna de requisitos o campo em branco para o cadastro de conceitos

Feature: As um professor
         I want cadastrar mais de uma avaliacao para uma meta 
		 So that eu possa manter registro dos conceitos que um aluno obteve em cada meta
		

Scenario: cadastro de avaliacao
Given Eu estou na pagina de "Conceitos"
Given eu consigo ver os campos data, avaliacao e meta todos em branco
Given Ha um aluno de cpf "683" cadastrado
Given Ha um outro aluno de cpf "134" cadastrado
When eu tento preencher os campos data com "21/02" , avaliação com "prova" e meta com "requisitos"
Then eu posso ver na tela as informações da data "21/02", avaliação "prova" e meta "requisitos"
Then eu posso ver na linha do aluno de cpf "683" na coluna de "requisitos" o campo em branco para o cadastro de conceitos
Then eu tambem posso ver na linha do aluno de cpf "134" na coluna de "requisitos" o campo em branco para o cadastro de conceitos

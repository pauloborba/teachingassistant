Feature: Como um professor
        eu quero importar e exportar conceitos e metas de MPs dos alunos
        Para que eu possa gerar e importar planilhas no formato csv e registrar as metas associadas aos alunos

Scenario: Importação de Planilha de conceitos
	Given: professor “Borba” está na página “Notas dos alunos”
	And: quer preencher o conceito “MP3” que está vazio
	And: vê o botão “importar”
	When: clica no botão “importar”
    And: seleciona o conceito “MP3” para receber a importação
    And: faz upload do arquivo “mp3.csv” ao clicar no botão “upload”
    Then: Um pop-up com um feedback positivo é lançado na sua tela
    And: Volta para a página “Notas dos alunos”
    And: está todos os conceitos da “MP3” preenchidos 

Scenario: Importação de Planilha de conceitos com nota vazia
    Given: professor “Borba” está na página “Notas dos alunos”
    And: quer preencher o conceito “MP3” que está vazio
	And: vê o botão “importar”
	When: clica no botão “importar”
    And: seleciona o conceito “MP3” para receber a importação
    And: faz upload do arquivo “mp3.csv” ao clicar no botão “upload”
    Then: um Warning é lançado na tela
    And: pergunta se ele quer prosseguir mesmo assim com a ação, ou não

Scenario: Importação de Planilha de conceitos em conceito já preenchido
	Given: professor “Borba” está na página “Notas dos alunos”
	And: o conceito “MP3” já está preenchido
	When: clica no botão “importar”
    And: seleciona o conceito “MP3” para receber a importação
    And: faz upload do arquivo “mp4.csv” ao clicar no botão “upload”
    Then: Um warning é lançado na tela
    And: pergunta se ele quer prosseguir com a ação, para substituir pelo novo arquivo

Scenario: Exportação de Planilha de conceitos
	Given: professor “Borba” está na página “Notas dos alunos”
	And: quer gerar uma planilha com o conceito “MP3” para preencher as notas dos alunos
	And: Os seus alunos são “Henrique” e “Fernando”
	When: clica no botão “exportar”
	And: seleciona o conceito “MP3”
	Then: uma planilha é gerada com o nome “MP3.csv”
	And: um feedback positivo é lançado na tela de que foi gerado a planilha
	And: automaticamente inicia o download da Planilha no seu computador
	And: dentro da planilha está os nomes “Henrique”, com nota “vazia”, “Fernando”, com nota “vazia”


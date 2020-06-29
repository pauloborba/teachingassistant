Feature: Auto-avaliação das metas
As a estudante da disciplina
I want to atribuir os conceitos que acredito merecer em cada uma das metas avaliadas
So that eu possa convencer o professor a mudar os conceitos atribuídos por ele e melhorar minha nota final

GUI Scenario: Preenchimento bem sucedido da auto-avaliação
Given eu estou logado no sistema como “Igor Simões”
And estou na página “Auto-Avaliação”
And não há nota na coluna de auto-avaliação para nenhuma meta
When eu realizo a auto-avaliação com notas “MA” em todas as metas
Then eu estou na página “Metas”
And posso ver as notas “MA” na coluna de auto-avaliação em todas as metas

Service Scenario: Preenchimento bem sucedido da auto-avaliação
Given não há notas de auto-avaliação para o usuário “Igor Simões” no sistema
And existem apenas as metas “META 1” e “META 2” no sistema para esse usuário
When o usuário “Igor Simões” realiza sua auto-avaliação com notas “MA” para a “META 1” e “MANA” para a “META 2”
Then o sistema armazenou apropriadamente as notas “MA” e “MANA” para as metas “META 1” e “META 2”, respectivamente, do usuário “Igor Simões” na categoria de auto-avaliação

GUI Scenario: Preenchimento mal sucedido da auto-avaliação
Given eu estou logado no sistema como “Igor Simões”
And estou na página “Auto-Avaliação”
And vejo duas metas “META 1” e “META 2”
And não há nota na coluna de auto-avaliação para nenhuma das metas existentes
When eu tento finalizar a auto-avaliação com nota “MA” para a meta “META 1”
And não defino nota para a meta “META 2”
Then uma mensagem de erro é exibida na tela sobre a falta de nota para alguma meta
And continuo na página de “Auto-Avaliação”

Service Scenario: Preenchimento mal sucedido da auto-avaliação
Given eu estou logado no sistema como “Igor Simões”
And não há notas de auto-avaliação armazenadas no sistema para metas desse usuário
When eu cancelo a auto-avaliação com nota “MA” para todas as metas sem finalizar
Then ainda não há notas de auto-avaliação armazenadas no sistema para metas desse usuário

GUI Scenario: Checagem de discrepância quando não há nenhum aluno discrepante
Given eu estou logado no sistema com um usuário de professor
And estou na página “Gerenciamento de Metas” da turma “Turma ESS”
And vejo 3 alunos na lista de alunos na turma
And não há aluno discrepante
When ativo a função de mostrar apenas alunos com discrepância está ativa
Then vejo que não há alunos com discrepância na lista
And vejo “0” na quantidade de alunos discrepantes
And vejo “0%” na porcentagem de alunos discrepantes
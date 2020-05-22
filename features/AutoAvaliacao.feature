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
When o usuário “Igor Simões” realiza sua auto-avaliação com notas “MANA” para a “META 1” e “MA” para a “META 2”
Then o sistema armazenou apropriadamente as notas “MANA” e “MA” para as metas “META 1” e “META 2”, respectivamente, do usuário “Igor Simões” na categoria de auto-avaliação
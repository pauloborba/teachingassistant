Feature: Auto-avaliação.
As a: Estudante que cursa a disciplina.
I want to: Atribuir um conceito a cada meta avaliada na cadeira.
So that: Eu possa avaliar meu desempenho na disciplina e apresentar isso como feedback.

Scenario: auto-avaliação preenchida com sucesso
Given: As “metas” avaliadas são “Requisitos”, “Gerência de configuração”, “Gerência de projetos”, “Arquitetura e linguagens de aplicações de SaaS” e “Testes” 
And: A “Avaliação” do aluno “Pedro” está armazenada no sistema com os conceitos “MPA”, “MPA”, “MPA”, “MPA” e “MPA” para as “metas” avaliadas.
When: A “Auto-avaliação” de “Pedro” é submetida ao sistema com os conceitos “MA”, “MA”, “MA”, “MA” e “MA” para as “metas” avaliadas.
Then: O sistema armazena “MA”, “MA”, “MA”, “MA” e “MA” como sendo a “Auto-avaliação” de “Pedro”

Scenario: Auto-avaliação preenchida com sucesso GUI
Given: As “metas” avaliadas são “Requisitos”, “Gerência de configuração”, “Gerência de projetos”, “Arquitetura e linguagens de aplicações de SaaS” e “Testes” 
And: Eu loguei no sistema como “Aluno”
And: Eu estou na página “Auto-avaliação” da disciplina “ESS”
And: Eu vejo minha “Avaliação” como sendo “MPA”, “MPA”, “MPA”, “MPA” e “MPA” para as “metas” avaliadas.
When: Eu preencho minha “Auto-avaliação” com os conceitos “MA”, “MA”, “MA”, “MA” e “MA” para as “metas” avaliadas.
And: Eu submeto ao sistema minha “Auto-avaliação” 
Then: eu vejo uma mensagem de sucesso do preenchimento
And: Eu vejo minha “Avaliação” como sendo “MPA”, “MPA”, “MPA”, “MPA” e “MPA” para as “metas” avaliadas.
And: Eu vejo minha “Auto-avaliação” como sendo “MA”, “MA”, “MA”, “MA” e “MA” para as “metas” avaliadas.

Scenario: Preenchimento de auto-avaliação mal sucedido
Given: As “metas” avaliadas são “Requisitos”, “Gerência de configuração”, “Gerência de projetos”, “Arquitetura e linguagens de aplicações de SaaS” e “Testes”
And: A “Avaliação” do aluno “Pedro” está armazenado no sistema com os conceitos “MPA”, “MPA”, “MPA”, “MPA” e “MPA” para as “metas” avaliadas.
When: A “Auto-avaliação” de “Pedro” é submetida ao sistema com os conceitos “MA”, “MA”, “MA”, “-” e “MA” para as “metas” avaliadas.
Then: O sistema não armazena a “Auto-avaliação” de “Pedro”
And: Retorna uma mensagem de erro indicando que todas as “metas” não foram avaliadas

Scenario: Preenchimento de auto-avaliação mal sucedido GUI 
Given: As “metas” avaliadas são “Requisitos”, “Gerência de configuração”, “Gerência de projetos”, “Arquitetura e linguagens de aplicações de SaaS” e “Testes”
And: Eu loguei no sistema como “Aluno”
And: Eu estou na página “Auto-avaliação” da disciplina “ESS”
And: Eu vejo minha “Avaliação” como sendo “MPA”, “MPA”, “MPA”, “MPA” e “MPA” para as “metas” avaliadas.
When: Eu preencho minha “Auto-avaliação” com os conceitos “MA”, “MA”, “MA”, “-” e “MA” para as “metas” avaliadas.
And: Eu submeto ao sistema minha “Auto-avaliação” 
Then: eu vejo uma mensagem de erro indicando que todas as “metas” não foram avaliadas
And: Eu continuo na página de “Auto-avaliação” da disciplina “ESS”
And: Eu vejo minha “Avaliação” como sendo “MPA”, “MPA”, “MPA”, “MPA” e “MPA” para as “metas” avaliadas.
And: Eu vejo minha “Auto-avaliação” como sendo “MA”, “MA”, “MA”, “-” e “MA” para as “metas” avaliadas.


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

Scenario: Visualizar discrepâncias com nenhuma discrepância
Given: A “Avaliação” de “Pedro” está armazenada no sistema com “MANA”, “MPA”, “MA”, “MA” e “MA”
And: A “Auto-avaliação” de “Pedro” está armazenada no sistema com  “MPA”, “MPA”, “MPA”, “MA”, e “MPA”
And: A “Avaliação” de “Maria” está armazenada no sistema com  “MA”, “MA”, “MA”, “MA” e “MA”
And: A “Auto-avaliação” de “Maria” está armazenada no sistema com  “MPA”, “MPA”, “MPA”, “MPA”, e “MPA”
And: A “Avaliação” de “Gabriel” está armazenada no sistema com  “MANA”, “MANA”, “MANA”, “MA” e “MA”
And: A “Auto-avaliação” de “Gabriel” está armazenada no sistema com “MANA”, “MANA”, “MANA”, “MA”, e “MA”
When: O sistema computa as discrepâncias entre “Auto-avaliações” e “Avaliações” dos “Alunos”
Then: O sistema retorna “0” para “Quantidade”
And: O sistema retorna “0%” para “Percentual”
And: O sistema retorna uma “Lista” de “Alunos” vazia

Scenario: Visualizar discrepâncias com nenhuma discrepância GUI
Given: Eu loguei no sistema como “Professor”
And: Eu estou na página de “Auto-avaliação” da turma “ESS”
And: Minha “Avaliação” de “Pedro” é “MANA”, “MPA”, “MA”, “MA” e “MA”
And: A “Auto-avaliação” de “Pedro” é “MPA”, “MPA”, “MPA”, “MA”, e “MPA”
And: Minha “Avaliação” de “Maria” é “MA”, “MA”, “MA”, “MA” e “MA”
And: A “Auto-avaliação” de “Maria” é “MPA”, “MPA”, “MPA”, “MPA”, e “MPA”
And: Minha “Avaliação” de “Gabriel” é “MANA”, “MANA”, “MANA”, “MA” e “MA”
And: A “Auto-avaliação” de “Gabriel” é “MANA”, “MANA”, “MANA”, “MA”, e “MA”
When: Eu seleciono a opção “ver discrepâncias”
Then: Eu vou para a página de “Discrepância”
And: Eu vejo “0” em “Quantidade”
And: Eu vejo “0%” em “Percentual”
And: Eu vejo nenhum “aluno” na “Lista” de auto-avaliações discrepantes

Scenario: Visualizar discrepâncias com uma discrepância
Given: A “Avaliação” de “Pedro” está armazenada no sistema com “MPA”, “MPA”, “MPA”, “MPA” e “MPA”
And: A “Auto-avaliação” de “Pedro” está armazenada no sistema com  MA”, “MA”, “MPA”, “MPA”, e “MPA”
And: A “Avaliação” de “Maria” está armazenada no sistema com  “MA”, “MA”, “MA”, “MA” e “MA”
And: A “Auto-avaliação” de “Maria” está armazenada no sistema com  “MPA”, “MPA”, “MPA”, “MPA”, e “MPA”
And: A “Avaliação” de “Gabriel” está armazenada no sistema com  “MANA”, “MANA”, “MANA”, “MA” e “MA”
And: A “Auto-avaliação” de “Gabriel” está armazenada no sistema com “MANA”, “MANA”, “MANA”, “MA”, e “MA”
When: O sistema computa as discrepâncias entre “Auto-avaliações” e “Avaliações” dos “Alunos”
Then: O sistema retorna “1” para “Quantidade”
And: O sistema retorna “33,33%” para “Percentual”
And: O sistema retorna uma “Lista” de “Alunos” contendo “Pedro”

Scenario: Visualizar discrepâncias com uma discrepância GUI
Given: Eu loguei no sistema como “Professor”
And: Eu estou na página de “Auto-avaliação” da turma “ESS”
And: Minha “Avaliação” de “Pedro” é “MPA”, “MPA”, “MPA”, “MPA” e “MPA”
And: A “Auto-avaliação” de “Pedro” é “MA”, “MA”, “MPA”, “MPA”, e “MPA”
And: Minha “Avaliação” de “Maria” é “MA”, “MA”, “MA”, “MA” e “MA”
And: A “Auto-avaliação” de “Maria” é “MPA”, “MPA”, “MPA”, “MPA”, e “MPA”
And: Minha “Avaliação” de “Gabriel” é “MANA”, “MANA”, “MANA”, “MA” e “MA”
And: A “Auto-avaliação” de “Gabriel” é “MANA”, “MANA”, “MANA”, “MA”, e “MA”
When: Eu seleciono a opção “ver discrepâncias”
Then: Eu vou para a página de “Discrepância”
And: Eu vejo “1” em “Quantidade”
And: Eu vejo “33,33%” em “Percentual”
And: Eu vejo “Pedro” na “Lista” de auto-avaliações discrepantes

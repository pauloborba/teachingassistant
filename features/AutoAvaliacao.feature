Feature: Auto-avaliação
As a Aluno da disciplina
I want to ser capaz de atribuir conceitos auto-avaliativos sobre minhas metas alcançadas durante a disciplina e ser capaz de verificar a avaliação feita pelo professor sobre mim that so possa avaliar meu desempenho durante o curso da disciplina.

Scenario: Submissão de auto-avaliação completa
Given Estou logado no sistema de gerenciamento de metas como aluno "Diogo"
And estou na pagina de "avaliação"
And vejo minha "Meta 1" avaliada pelo professor como "MA"
And vejo minha "Meta 2" avaliada pelo professor como "MPA"
And vejo minha "Meta 3" avaliada pelo professor como "MA"
When eu preencho minha "Meta 1" como "MPA"
And eu preencho minha "Meta 2" como "MA"
And eu preencho minha "Meta 3" como "MA"
And seleciono a opção de "submeter auto-avaliamento"
Then eu vejo uma mensagem de sucesso na submissão

Scenario: Submissão de auto-avaliação completa
Given No sistema está computado o conceito "MA" para a "Meta 1" pelo aluno "Diogo"
And o conceito "MPA" para a "Meta 2" pelo aluno "Diogo"
And o conceito "MA" para a "Meta 3" pelo aluno "Diogo"
And no sistema está armazenado o conceito "MPA" submetido pelo professor para a "meta 1" do aluno "diogo"
And o conceito "MA" submetido pelo professor para a "meta 2" do aluno "diogo"
And o conceito "MA" submetido pelo professor para a "meta 3" do aluno "diogo"
When o aluno "Diogo" solicita a submissão
Then o sistema mostra uma mensagem de sucesso na submissão

Scenario: Submissão de auto-avaliação incompleta
Given Estou logado no sistema de gerenciamento de metas como aluno "Diogo"
And estou na pagina de "avaliação"
And vejo minha "Meta 1" avaliada pelo professor como "MA"
And vejo minha "Meta 2" avaliada pelo professor como "MPA"
And vejo minha "Meta 3" avaliada pelo professor como "MA"
When eu preencho minha "Meta 1" como "MPA"
And eu preencho minha "Meta 2" como "MA"
And eu preencho minha "Meta 3" como ""
And seleciono a opção de "submeter auto-avaliamento"
Then eu vejo uma mensagem de erro de submissão

Scenario: Submissão de auto-avaliação incompleta
Given No sistema está computado o conceito "MA" para a "Meta 1" pelo aluno "Diogo"
And está computado "MPA" para sua "Meta 2"
And está computado "" para sua "Meta 3"
And no sistema está armazenado o conceito "MPA" submetido pelo professor para a "meta 1" de "diogo"
And o conceito "MA" submetido pelo professor para a "meta 2" de "diogo"
And o conceito "MA" submetido pelo professor para a "meta 3" de "diogo"
When "Diogo" solicita a submissão
Then o sistema mostra uma mensagem de erro de submissão


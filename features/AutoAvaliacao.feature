Feature: Autoavaliação
As a estudante
I want to adicionar minha autoavaliação para minhas metas
So that eu possa acompanhar minha evolução nas metas e informar ao professor minha autoavaliação

As a professor
I want to visualizar quantidade, percentual e lista de alunos com autoavaliações discrepantes 
So that eu possa acompanhar a autoavaliação dos alunos

GUI scenario: add self-assessment for learning goals with success
Given I'm logged in as the student 'Joao Vasconcelos'
And I'm at the 'self-assessment' page
And I have 'Entender requisitos, Entender gerência, Especificar requisitos' as my goals
And I've added "MPA, MA, MA" for the assessment of my goals 
When I select the button to send my assessment
Then I see a message of success on the screen

Service scenario: add self-assessment for learning goals with success
Given The student 'Joao Vasconcelos' is stored with 'Entender requisitos, Entender gerência, Especificar requisitos' as goals
When The user 'Joao Vasconcelos' asks the system to store "MPA, MA, MA" as the self-assessment
Then the system returns 'success'
And The student 'Joao Vasconcelos' is stored with "MPA, MA, MA" for the learning goals 'Entender requisitos, Entender gerência, Especificar requisitos' 

GUI scenario: add self-assessment for learning goals with error
Given I'm logged in as the student 'Joao Vasconcelos'
And I'm at the 'self-assessment' page
And I have 'Entender requisitos', 'Entender gerência, and 'Especificar requisitos' as my goals
And I've added "MPA, MA" for the assessment of my goals 
When I select the button to send my assessment
Then I see a message of error on the screen

Service scenario: add self-assessment for learning goals with error
Given The student 'Joao Vasconcelos' is stored with 'Entender requisitos', 'Entender gerência, and 'Especificar requisitos' as goals
When The user 'Joao Vasconcelos' asks the system to store "MPA, MA" as the self-assessment
Then the system returns 'error'
And The student 'Joao Vasconcelos' is stored with 'Entender requisitos', 'Entender gerência, and 'Especificar requisitos' as goals

GUI scenario: ver lista de alunos com autoavaliação discrepante 
Given Estou logado como o professor 'Paulo Borba'
And Estou na página de avaliações
And O aluno 'João Vasconcelos' tem avaliações 'MA, MA, MPA, MPA e MANA' e autoavaliacoes 'MA, MA, MA, MPA, MANA' e a aluna 'Mariana Gomes' tem avaliações 'MA, MA, MA, MPA, MPA' e autoavaliações 'MPA, MPA, MPA, MANA, MANA'
When Seleciono o botão para ver a lista de alunos discrepantes
Then Vejo uma lista vazia com uma mensagem "Não há alunos com autoavaliações discrepantes"

GUI scenario: ver lista de alunos com autoavaliação discrepante 
Given Estou logado como o professor 'Paulo Borba'
And tenho tres alunos
And O aluno 'João Vasconcelos' tem avaliações 'MA, MA, MPA, MPA e MANA' e autoavaliações 'MA, MA, MA, MPA, MANA', a aluna 'Mariana Gomes' tem avaliações 'MA, MA, MA, MPA, MPA' e autoavaliações 'MPA, MPA, MPA, MANA, MANA', o aluno 'Pedro Silva' tem avaliações 'MANA, MPA, MPA' e autoavaliações 'MA, MA, MA'
And Estou na página de avaliações
Then Vejo uma os campos 'quantidade' com o valor '1' e 'porcentagem' com o valor '33%'
When Seleciono o botão para ver a lista de alunos discrepantes
Then Vejo uma lista com o nome 'Pedro Silva'
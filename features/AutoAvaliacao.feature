Feature: Autoavaliação
As a estudante
I want to adicionar minha autoavaliação para minhas metas
So that eu possa acompanhar minha evolução nas metas e informar ao professor minha autoavaliação

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
And The student 'Joao Vasconcelos' is stored with "MPA, MA, MA" for the learning goals 'Entender requisitos, Entender gerência, Especificar requisitos'GUI scenario: add self-assessment for learning goals with error
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
Then The system returns 'error storing incomplete self-assessment'

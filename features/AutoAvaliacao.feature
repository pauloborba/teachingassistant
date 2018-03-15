Feature: Auto-avaliacao
As a aluno 
I want to adicionar nota de auto avaliação para os conceitos (Entender conceitos de requisitos, especificar conceitos de requisitos com qualidade, entender conceitos de gerência de configuração, etc.)
So that Eu posso salvar as notas de auto avaliação para cada um dos conceitos.

Scenario: Realizar avaliação
Given O sistema não tem as notas dos conceitos do aluno “x”
When Tento cadastrar “Entender conceitos de requisitos”,”Especificar conceitos de requisitos com qualidade”, “Entender conceitos de gerência de configuração” com os valores “MA”, “MPA”, “MA” nas metas do aluno “x”
Then O sistema salva a submissão.

Scenario: Realizar auto avaliação sem um dos conceito
Given O sistema não possui as notas dos conceitos do aluno “x”
When O aluno tenta cadastrar nas metas “Entender conceitos de requisitos”,”Especificar conceitos de requisitos com qualidade” com os valores “MA”, “MPA”
Then O sistema rejeita a nova submissão.


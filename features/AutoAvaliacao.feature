Scenario: Realizar avaliação para
Given O sistema não tem as notas dos conceitos do aluno “x”
When Tento cadastrar “Entender conceitos de requisitos”,”Especificar conceitos de requisitos com qualidade”, “Entender conceitos de gerência de configuração” com os valores “MA”, “MPA”, “MA” nas metas do aluno “x”
Then O sistema salva a submissão.


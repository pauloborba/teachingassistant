Feature: Auto-avaliação.
As a: aluno.
I want to: atribuir conceitos a todas as metas dadas em sala de aula.
So that: avaliar o desempenho do aluno pelo próprio aluno.

CONTROLADOR-
Scenario: Dar conceitos as metas.
Given: As metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” ainda estão sem conceitos.
When: O conceito “MA”  for atribuído à meta “Entender conceitos de requisitos”.
And: O conceito “MPA”  for atribuído à meta “Especificar requisitos com qualidade”.
And: O conceito “MANA” for atribuído na meta “Entender conceitos de gerência de configuração”.		
Then: O sistema deve aceitar as atribuições.

GUI-
Scenario: conciliar conceitos a metas.
Given: O aluno “Thiago” está na página de auto-avaliações.
And: O aluno “Thiago” está preenchendo a sua auto-avaliação.
When: O aluno “Thiago” atribuiu o conceito “MA” na meta “Entender conceitos de requisitos”. 
Then: Um sinal de “feito” deve ser exibido.
And: A meta “Entender conceitos de requisitos” tem que ser vista na tela com a nota “MA”.

CONTROLADOR-
Scenario: Usuário faz preenchimento incompleto.
Given: O aluno “Matheus” fez sua auto-avaliação.
And: O aluno “Matheus” atrubuiu as notas “MPA” e “MA” às metas “Entender conceitos de requisitos” e “Entender conceitos de gerência de configuração”, respectivamente.
And: O aluno “Matheus” deixou de preencher a nota na meta “Especificar requisitos com qualidade”.
When: O aluno “Matheus” submeteu sua auto-avaliação para o sistema.
Then: O sistema não armazena a submissão. 
And: O sistema notifica ao aluno “Matheus” porque não armazenou sua auto-avaliação
		
GUI-	
Scenario: Submissão da auto-avaliação vazia.
Given: O aluno “Matheus” fez sua auto-avaliação sem nenhum conceito em nenhuma das metas.
And: A auto-avaliação do aluno “Matheus” não está na lista de auto-avaliações.
When: O aluno “Matheus” enviar sua auto-avaliação.
Then: Uma mensagem de erro deve ser exibida.	
And: A auto-avaliação do aluno “Matheus” não é exibida na lista de auto-avaliações.
And: O aluno "Matheus" será redirecionado para a página de preenchimento da auto-avaliação.

COM DISCREPANCIA-
Scenario: Há discrepância entre os conceitos das metas atribuídos pelos alunos e pelo professor.
Given: O aluno “Matheus” atribuiu os conceitos "MPA, MPA, MA, MPA, MA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração”.
And: O aluno “Thiago” atribuiu os conceitos "MA, MA, MA, MA, MA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração”.
And: O aluno “Lucas” atribuiu os conceitos "MPA, MPA, MA, MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração”.
When: O professor deu os conceitos "MPA, MA, MA ,MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Matheus”.
And: O professor deu os conceitos "MANA, MPA, MPA ,MA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Thiago”.
And: O professor deu os conceitos "MPA, MPA, MA, MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Lucas”.
Then: Uma notificação apareceu para o "professor" indicando que houve discrepância no aluno “Thiago”.

COM DISCREPANCIA-
Scenario: Há discrepância entre os conceitos das metas atribuídos pelos alunos e pelo professor.
Given: O aluno “Matheus” atribuiu os conceitos "MPA, MPA, MA, MPA, MA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração”.
And: O aluno “Thiago” atribuiu os conceitos "MA, MA, MA, MA, MA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração”.
And: O aluno “Lucas” atribuiu os conceitos "MPA, MPA, MA, MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração”.
When: O professor deu os conceitos "MPA, MA, MA ,MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Matheus”.
And: O professor deu os conceitos "MANA, MPA, MPA ,MA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Thiago”.
And: O professor deu os conceitos "MPA, MPA, MA, MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Lucas”.
Then: Uma notificação apareceu para o "professor" indicando que houve discrepância no aluno “Thiago”.

SEM DISCREPANCIA-
Scenario: Nenhuma discrepância entre os conceitos das metas atribuídos pelos alunos e pelo professor.
Given: O aluno “Matheus” atribuiu os conceitos "MPA, MPA, MA, MPA, MA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos” E “Entender conceitos de refatoração”.
And: O aluno “Thiago” atribuiu os conceitos "MPA, MPA, MPA, MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos” E “Entender conceitos de refatoração”.
And: O aluno “Lucas” atribuiu os conceitos "MPA, MPA, MA, MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos” E “Entender conceitos de refatoração”.
When: O professor deu os conceitos "MPA, MPA, MA ,MANA, MA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Matheus”.
And: O professor deu os conceitos "MA, MA, MA ,MA, MA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Thiago”.
And: O professor deu os conceitos "MPA, MPA, MA, MPA, MPA" respectivamente nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de gerência de projetos”, “Entender conceitos de refatoração” para o aluno “Lucas”.
Then: Uma notificação aparece para o "professor" indicando que não houve discrepância.
And: O "Professor" volta à página inicial do sistema
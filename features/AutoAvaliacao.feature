COMO um estudante
EU QUERO poder avaliar meu desenvolvimento na disciplina atribuindo  conceitos a cada uma das metas 
DE FORMA A ampliar meu conhecimento em cada conceito e ter participa��o no valor final da minha nota.

Cenario:preenchimento de auto avaliacao
GIVEN eu estou logado como �Jorge� e eu estou na tela de avalia��o
AND eu consigo ver as avalia��es do professor
WHEN eu atribuo os conceitos �MANA�,�MPA� e �MPA� para as metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� respectivamente e confirmo minha avalia��o
THEN eu consigo ver o resultado final da minha avalia��o e do professor nos requisitos �Entender conceitos de requisitos�, �Especificar requisitos com qualidade� e�Entender conceitos de ger�ncia de configura��o�

Cenario: Preenchimento de auto avalia��o
GIVEN o estudante �Jorge� est� cadastrado
AND possui as avalia��es �MA�,�MA� e�MPA� nas metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� respectivamente
WHEN os conceitos �MA�, �MPA�, �MA� s�o inseridos pelo aluno �Jorge� nas metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� respectivamente
THEN o resultado final das metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� � calculado e exibido.

Cenario: Aluno n�o preenche uma das notas
GIVEN eu estou logado como�Jorge� e estou na tela de auto avalia��o
AND possui as avalia��es �MA�,�MA� e�MPA� nas metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� respectivamente dadas pelo professor.
WHEN eu atribuo �MA� e �MPA� para as metas �Entender conceitos de requisitos�e �Especificar requisitos com qualidade� respectivamente e confirmo minha avalia��o
THEN minha auto avalia��o n�o foi cadastrada e consigo ver uma mensagem de erro

Cenario : uma das auto avalia��es n�o foi fornecida
GIVEN o estudante �Jorge� est� cadastrado
AND possui as avalia��es �MA�,�MA� e�MPA� nas metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� fornecidas pelo professor
WHEN �Jorge� atribui notas �MPA� e �Mana�para �Entender conceitos de requisitos� e  �Especificar requisitos com qualidade�
THEN a avalia��o n�o � computada e � exibida uma mensagem de erro
AND o Jorge pode reiniciar sua avalia��o

Cenario:preenchimento de auto avaliacao sem discrepancia
GIVEN eu estou logado como �Prof. Paulo� e inseri as avalia��es dos alunos
WHEN os alunos inserirem suas auto avalia��es em todos os conceitos
THEN eu recebo uma lista de todos os alunos mostrando  que nenhum cont�m mais de 25% das auto avalia��es superiores �s minhas. 

Cen�rio: Checando uma turma com alunos com discrep�ncia
Given que estou logado no sistema
And na pagina �Lista de Alunos� de uma turma associada a mim
And o aluno �Jorge� cadastrou no sistema �Especificar Requisitos com Qualidade� como �MPA� e �Entender Conceitos de Requisitos� como �MA�
And eu cadastrei as metas �Especificar Requisitos com Qualidade� e �Entender Conceitos de Requisitos� do aluno �Jorge� como �MANA�
And o aluno �Mateus� cadastrou todos os seus conceitos como �MPA� And eu cadastrei todos os conceitos do aluno �Mateus� como �MA�
And o aluno �Nero� cadastrou todos os seus conceitos com �MPA�
And eu cadastrei todos os conceitos do aluno �Nero� como �MPA�
When eu clico em �Listar discrep�ncias�
Then o aluno �Jorge� ir� listar �2 de 5 avalia��es discrepantes(40%)� ao lado de seu nome.
And o aluno �Mateus� ir� listar �Ok� ao lado de seu nome.
And o aluno �Nero� ir� listar �Ok� ao lado de seu nome.


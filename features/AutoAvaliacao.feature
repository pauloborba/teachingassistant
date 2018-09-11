COMO um estudante
EU QUERO poder avaliar meu desenvolvimento na disciplina atribuindo  conceitos a cada uma das metas 
DE FORMA A ampliar meu conhecimento em cada conceito e ter participação no valor final da minha nota.

Cenario:preenchimento de auto avaliacao
GIVEN eu estou logado como “Jorge” e eu estou na tela de avaliação
AND eu consigo ver as avaliações do professor
WHEN eu atribuo os conceitos “MANA”,”MPA” e “MPA” para as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” respectivamente e confirmo minha avaliação
THEN eu consigo ver o resultado final da minha avaliação e do professor nos requisitos “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e“Entender conceitos de gerência de configuração”

Cenario: Preenchimento de auto avaliação
GIVEN o estudante “Jorge” está cadastrado
AND possui as avaliações “MA”,”MA” e”MPA” nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” respectivamente
WHEN os conceitos “MA”, “MPA”, “MA” são inseridos pelo aluno “Jorge” nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” respectivamente
THEN o resultado final das metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” é calculado e exibido.

Cenario: Aluno não preenche uma das notas
GIVEN eu estou logado como“Jorge” e estou na tela de auto avaliação
AND possui as avaliações “MA”,”MA” e”MPA” nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” respectivamente dadas pelo professor.
WHEN eu atribuo “MA” e “MPA” para as metas “Entender conceitos de requisitos”e “Especificar requisitos com qualidade” respectivamente e confirmo minha avaliação
THEN minha auto avaliação não foi cadastrada e consigo ver uma mensagem de erro

Cenario : uma das auto avaliações não foi fornecida
GIVEN o estudante “Jorge” está cadastrado
AND possui as avaliações “MA”,”MA” e”MPA” nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” fornecidas pelo professor
WHEN “Jorge” atribui notas “MPA” e “Mana”para “Entender conceitos de requisitos” e  “Especificar requisitos com qualidade”
THEN a avaliação não é computada e é exibida uma mensagem de erro
AND o Jorge pode reiniciar sua avaliação

Cenario:preenchimento de auto avaliacao sem discrepancia
GIVEN eu estou logado como “Prof. Paulo” e inseri as avaliações dos alunos
WHEN os alunos inserirem suas auto avaliações em todos os conceitos
THEN eu recebo uma lista de todos os alunos mostrando  que nenhum contém mais de 25% das auto avaliações superiores às minhas. 

Cenário: Checando uma turma com alunos com discrepância
Given que estou logado no sistema
And na pagina “Lista de Alunos” de uma turma associada a mim
And o aluno “Jorge” cadastrou no sistema “Especificar Requisitos com Qualidade” como “MPA” e “Entender Conceitos de Requisitos” como “MA”
And eu cadastrei as metas “Especificar Requisitos com Qualidade” e “Entender Conceitos de Requisitos” do aluno “Jorge” como “MANA”
And o aluno “Mateus” cadastrou todos os seus conceitos como “MPA” And eu cadastrei todos os conceitos do aluno “Mateus” como “MA”
And o aluno “Nero” cadastrou todos os seus conceitos com “MPA”
And eu cadastrei todos os conceitos do aluno “Nero” como “MPA”
When eu clico em “Listar discrepâncias”
Then o aluno “Jorge” irá listar “2 de 5 avaliações discrepantes(40%)” ao lado de seu nome.
And o aluno “Mateus” irá listar “Ok” ao lado de seu nome.
And o aluno “Nero” irá listar “Ok” ao lado de seu nome.


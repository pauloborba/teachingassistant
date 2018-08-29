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
THEN a avaliação não é computada e é exibida uma mensagem de erro.


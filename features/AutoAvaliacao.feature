COMO um estudante
EU QUERO poder avaliar meu desenvolvimento na disciplina atribuindo  conceitos a cada uma das metas 
DE FORMA A ampliar meu conhecimento em cada conceito e ter participa��o no valor final da minha nota.

Cenario:preenchimento de auto avaliacao
GIVEN eu estou logado como �Jorge� e eu estou na tela de avalia��o
AND eu consigo ver as avalia��es do professor
WHEN eu atribuo os conceitos �MANA�,�MPA� e �MPA� para as metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� respectivamente e confirmo minha avalia��o
THEN eu consigo ver o resultado final da minha avalia��o e do professor nos requisitos �Entender conceitos de requisitos�, �Especificar requisitos com qualidade� e�Entender conceitos de ger�ncia de configura��o�

modificacao
Cenario: Preenchimento de auto avalia��o
GIVEN o estudante �Jorge� est� cadastrado
AND possui as avalia��es �MA�,�MA� e�MPA� nas metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� respectivamente
WHEN os conceitos �MA�, �MPA�, �MA� s�o inseridos pelo aluno �Jorge� nas metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� respectivamente
THEN o resultado final das metas �Entender conceitos de requisitos�, �Especificar requisitos com qualidade�, �Entender conceitos de ger�ncia de configura��o� � calculado e exibido.

Feature: Auto avaliação do aluno
As a aluno
I want to atribuir com conceito “MA”, “MPA” ou “MANA” as metas dadas pelo professor
So that me avaliar e talvez ter conhecimento sobre onde eu possa melhorar

Scenario: preenchimento bem sucedido da auto avaliação(serviço)
Given o aluno “Evaldo Junior” está armazenado no sistema sem nenhum conceito em metas de aprendizagem
When eu solicito o sistema a armazenar o conceito “MA” nas metas de aprendizagem do aluno “Evaldo Junior”
Then o aluno “Evaldo Junior” tem o conceito “MA” armazenado no sistema como metas de aprendizagem 

Scenario: preenchimento bem sucedido da auto avaliação(GUI)
Given eu estou na página de “Auto Avaliação”
And eu vejo que não tenho nenhum conceito aplicado relacionado às “Metas” em “Auto Avaliação”
When eu adiciono “MA” na metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”
And eu salvo os conceitos
Then Eu vejo uma mensagem de preenchimento bem sucedido
And eu estou na página de “Auto Avaliação”
And eu vejo o conceito “MA” relacionado às “Metas” em “Auto Avaliação”

Scenario: preenchimento mal sucedido da auto avaliação(GUI)
Given eu estou na página de “Auto Avaliação”
And eu vejo que não tenho nenhum conceito aplicado relacionado às “Metas” em “Auto Avaliação”
When eu adiciono “MA” na meta “Entender conceitos de requisitos”
And eu tento salvar o conceito
Then Eu vejo uma mensagem de preenchimento mal sucedido 
And eu estou na página de “Auto Avaliação”
And eu vejo que falta preencher as metas “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração”

Scenario: preenchimento mal sucedido da auto avaliação(serviço)
Given o aluno “Evaldo Junior” está armazenado no sistema sem nenhum conceito em metas de aprendizagem
When o sistema não é capaz de armazenar os conceitos pois está faltando informações e emite uma mensagem de erro
Then o aluno “Evaldo Junior” está armazenado no sistema sem nenhum conceito em metas de aprendizagem 
And o sistema não armazenou as notas //adicionando o passo que pedia na questão

Scenario: nenhum aluno com discrepância acima de 25%
Given eu estou na página de “Auto Avaliações Discrepantes”
And eu vejo que não tem nenhum aluno com discrepância acima de 25%
When eu volto para a página “Auto Avaliações dos Alunos”
Then eu vejo uma lista de alunos e suas discrepâncias
And eu vejo o aluno “Ekko Ferraz” com “Discrepância” de “20%”
And eu vejo a aluna “Lissandra Cartago” com “Discrepância” de “0%”
And eu vejo o aluno “Yasuo Sorie Guedon” com “Discrepância” de “0%”

Scenario: um aluno com discrepância acima de 25%
Given eu estou na página de “Auto Avaliações Discrepantes”
And eu vejo que apenas a aluna “Luxanna Stemmaguarda” está na lista de alunos com discrepância acima de 25%
When eu volto para a página “Auto Avaliações dos Alunos”
Then eu vejo uma lista de alunos e suas discrepâncias
And eu vejo o aluno “Malzahar Vilar” com “Discrepância” de “0%”
And eu vejo a aluna “Riven Carola” com “Discrepância” de “20%”

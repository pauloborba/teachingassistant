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
Feature: atribuir conceitos às minhas metas
    As a aluno
    I want to atribuir um conceito à cada uma das minhas metas
    So that eu possa me avaliar

Scenario: atribuir conceitos às minhas metas com sucesso
Given Estou na página de “autoavaliação”
And Eu vejo que todas as minhas “metas” estão sem os conceitos de     avaliação aplicados
When Eu adiciono “MA” para a “META1”, “MA” para a “META2” e “MPA” para a “META3”
And Eu seleciono a opção “SALVAR”
Then Eu posso ver uma mensagem de sucesso
And Eu estou na página de “autoavaliação”
And Eu posso ver o conceito “MA” aplicado à “META1”, “MA” aplicado à “META2” e “MPA” aplicado à “META3”

Scenario: atribuir conceitos às minhas metas sem sucesso
Given Estou na página de “autoavaliação”
And Eu vejo que todas as minhas “metas” estão sem os conceitos de     avaliação aplicados
When Eu adiciono “MA” para a “META1” e “MA” para a “META2”
And Eu seleciono a opção “SALVAR”
Then Eu posso ver uma mensagem de falha
And Eu estou na página de “autoavaliação”
And Eu posso ver o conceito “MA” aplicado à “META1”, “MA” aplicado à “META2”
And Eu vejo que o conceito para a “META3” está em branco

Scenario: alunos sem discrepância
Given Estou na página de “alunos com autoavaliações discrepantes”
And Eu vejo que não há alunos com “discrepância” maior ou igual a “25%”
When Eu seleciono a opção de voltar à lista de alunos
Then Eu posso ver que o aluno “Marcos Fernandes” tem “discrepância” de “20%”
And Eu posso ver que o aluno “Ricardo Barros” tem “discrepância” de “0%”
And Eu posso ver que o aluno “Laura Souza” tem “discrepância” de “0%”

Scenario: visualizar o percentual de alunos com discrepância
Given Estou na página de “autoavaliação de alunos”
And Eu vejo que o aluno “Lucas Prado” tem “discrepância” de “33,33%”
And Eu vejo que o aluno “Pedro Sampaio” tem “discrepância” de “0%”
And Eu vejo que o aluno “Maria Santos” tem “discrepância” de “0%”
When Eu seleciono a opção de visualizar o percentual de alunos com “discrepância”
Then Eu posso ver o percentual de alunos com “discrepância”

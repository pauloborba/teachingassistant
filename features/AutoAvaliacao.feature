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

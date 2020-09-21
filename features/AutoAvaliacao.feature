Feature: Auto-avaliação
Eu como aluno logado no sistema
Quero poder realizar uma auto-avaliação, avaliando todos os quesitos disponíveis de uma só vez e verificar a avaliação feita pelo professor ou um status de “não disponivel” caso não tenha.
Para que eu possa expressar minha opinião quanto ao meu desempenho na disciplina.

Cenário: preenchimento bem sucedido de uma auto-avaliação
Dado que eu “Gabriel da Paz” estou na tela de “Auto-avaliação”
E eu vejo o quesito “Elicitação de requisitos com qualidade” não preenchido
E eu vejo o quesito “Entender conceitos de requisitos” não preenchido
Quando eu avaliar com “MA” o quesito “Elicitação de requisitos com qualidade”
E avaliar com “MA” o quesito “Entender conceitos de requisitos”
E submeter a auto-avaliação
Então o sistema mostra na tela uma mensagem dizendo que a avaliação foi concluída
E o sistema é redirecionado para a “tela inicial”

Cenário: submissão bem sucedida de formulário de auto-avaliação
Dado que o banco de dados não possui a auto-avaliação do aluno “Gabriel da Paz”
Quando “Gabriel da Paz” preencher com “MA”o quesito “Elicitação de requisitos com qualidade”
E o quesito “Entender conceitos de requisitos” com “MA”
E submeter formulário
Então o sistema salva no banco de dados “Gabriel da Paz” como autor do formulário e “Elicitação de requisitos com qualidade” e “Entender conceitos de requisitos” ambos com o campo de resposta como “MA”

Cenário: preenchimento mal sucedido de uma auto-avaliação
Dado que eu “Gabriel da Paz” estou na tela de “Auto-avaliação”
E eu vejo o quesito “Elicitação de requisitos com qualidade” não preenchido
E eu vejo o quesito “Entender conceitos de requisitos” não preenchido
Quando eu avaliar com “MA” o quesito “Elicitação de requisitos com qualidade”
E o quesito “Entender conceitos de requisitos” não for preenchido
E “Gabriel da Paz” submeter a auto-avaliação
Então o sistema mostra na tela uma mensagem dizendo que não foi possível concluir a avaliação
E o sistema é permanece na tela de “auto-avaliação”
E sinaliza uma mensagem indicando para “Gabriel da Paz” preencher no item “Entender conceitos de requisitos”

Cenário: submissão mal sucedida de formulário de auto-avaliação
Dado que o banco de dados não possui a auto-avaliação do aluno “Gabriel da Paz”
Quando “Gabriel da Paz” preencher com “MA”o quesito “Elicitação de requisitos com qualidade”
E  o quesito “Entender conceitos de requisitos” não for preenchido
E “Gabriel da Paz” submeter formulário
Então o sistema retorna uma mensagem de erro alegando que é necessário preencher o campo “Entender conceitos de requisitos”
E atualiza a página

Cenário: professor visualizando tela de relatório de auto-avaliação sem discrepâncias
Dado que  o professor “João” está na “tela inicial” do sistema
E 1 a aluna Gabriela tem conceito superior ao do professor em 1 de 5 metas (“Elicitação de requisitos com qualidade”)
E o aluno “Pedro” só tem conceitos inferiores ao do professor
E “Joana” só tem conceitos iguais.
Quando o professor “João” solicitar a “tela de relatório de auto-avaliações”
Então no campo “Total de alunos com auto-avaliações discrepantes” terá o número 0, o campo “Porcentagem de alunos com auto-avaliações discrepantes” terá 0%, e a “lista de alunos” estará vazia.

Cenário: professor visualizando tela de relatório de auto-avaliação com discrepâncias
    Dado que  o professor “João” está na “tela inicial” do sistema
    E 1 a aluna Gabriela tem conceito superior ao do professor em 2 de 5 metas, “Elicitação de requisitos com qualidade”, com o campo da aluna “MA” e do professor “João” sendo “MANA”. “Entender conceitos de requisitos” com o campo da aluna “MA” e do professor “João” sendo “MP”.
    E o aluno “Pedro” só tem conceitos inferiores ao do professor
    E a aluna “Joana” só tem conceitos iguais
    Quando o professor “João” solicitar a “tela de relatório de auto-avaliações”
    Então no campo “Total de alunos com auto-avaliações discrepantes” terá o número 1, o campo “Porcentagem de alunos com auto-avaliações discrepantes” terá 33,33%, e a “lista de alunos” terá um nome sendo “1. Gabriela”.

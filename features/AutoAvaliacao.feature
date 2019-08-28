Feature:​ auto-avaliação
    As a​ aluno matriculado em uma turma
    I want to​ ​ auto-avaliar meu desempenho na disciplina
    So that​ o professor e eu possamos ver a diferença entre as opiniões.
    
/* Cenarios de preenchimento bem sucedido da feature auto-avaliacao*/

Scenario:​ Auto-avaliação do aluno
    Given ​ eu estou na página “auto-avaliação do aluno”
    And​ eu estou logado no perfil de “Aluno” com nome “Paulo A.”And​ todas as 3 metas já foram preenchidas por “Paulo B.” que retém perfil “Professor”
    And​ na meta “Entender conceitos de requisitos” o conceito “MA” foi atribuído por “Paulo B.”
    And​ na meta “Especificar requisitos” o conceito “MPA” foi atribuído por “Paulo B.”
    And​ na meta “Entender conceitos de gerência de configuração” o conceito “MA” foi atribuído por “Paulo B.”
    When​ eu informo o conceito “MA” em todas as metas com exceção da meta ”Entender conceitos de requisitos” a qual informei conceito “MPA”
    And​ nenhuma meta ficou não atribuída
    And​ eu confirmo que as metas estão corretas
    Then​ eu vejo uma mensagem de confirmação
    And​ eu estou na página “auto-avaliação do aluno”

Scenario:​ Auto-avaliação do aluno
    Given​ o aluno “Paulo A.” está armazenado no sistema com conceitos “MA,MPA,MA” para as metas
    When ​ eu envio para o sistema as informações “MA,MA,MPA” para conceitos de auto-avaliação do aluno
    Then o sistema retorna um codigo de confirmacao “1”
    And o aluno “Paulo A.” está armazenado no sistema com conceitos “MA,MPA,MA” para as metas e “MA,MA,MPA” para a auto-avaliação das metas
    
/* Cenarios de preenchimento mal sucedido da feauture auto-avaliacao*/

Scenario: ​ Auto-avaliação do aluno com uma meta ausente
    Given ​ eu estou na página “auto-avaliação do aluno”
    And​ eu estou conectado com perfil “Aluno”And​ nas 6 metas os conceitos “MPA,MA,MA,MA,MA,MA” foi atribuído pelo professor ao aluno “Paulo A.”
    When ​ eu informo “MPA, ,MPA,MPA,MPA,MPA” para as metas, deixando a meta “Especificar requisitos com qualidade” em branco
    Then ​ eu estou na página “auto-avaliação do aluno”
    And ​ eu vejo uma mensagem de erro “informando que há metas que não possuem conceitos atribuídos.”

Scenario: Auto-avaliação do aluno com uma meta ausente
    Given​ o aluno “Paulo A.” está armazenado no sistema com conceitos “MA,MPA,MA” para as metas "Entender conceitos de requisitos, Especificar requisitos com qualidade, Entender conceitos de gerência de configuração"
    When ​ eu envio para o sistema as informações “MA,MA, ” para conceitos de auto-avaliação do aluno
    Then o sistema retorna um codigo de erro “2”
    And o aluno “Paulo A.” está armazenado no sistema com conceitos “MA,MPA,MA” para as metas e “ , , ” para a auto-avaliação das metas
    And ***

/* Cenarios de discrepancia*/

Scenario: Auto-avaliação do aluno sem discrepância
	Given eu estou conectado como “Paulo B.” com perfil “Professor”
	And eu estou na página “Avaliação”
	And está matriculado o aluno “Paulo” com metas “MA, MPA, MA,MPA,MA” e auto-avaliação “MA, MA, MA, MPA, MA”
	When eu seleciono a opção discrepância
	Then eu estou na página “Avaliação”
	And eu vejo uma tabela com C1 “quantidade, percentual, *Inicio lista*,*Fim lista*” e C2 “0, 0.0%”

Scenario: Auto-avaliação do aluno com discrepância de 1 entre 3
	Given eu estou conectado como “Paulo B.” com perfil “Professor”
	And eu estou na página “Avaliação”
	And estão matriculados os alunos “Paulo” com metas “MA, MPA, MA,MPA,MA” e auto-avaliação “MA, MA, MA, MPA, MA” , “Pedro” com metas “MPA,MPA,MPA,MPA,MPA” e auto-avaliação “MA, MA, MA, MA, MA” e “Vinicius” com metas ““MA, MA, MA, MA, MA”  e auto-avaliação “MPA,MPA,MPA,MPA,MPA”.
	When eu seleciono a opção discrepância
	Then eu estou na página “Avaliação”
	And eu vejo uma tabela com C1 “quantidade, percentual, *Inicio lista*, Pedro,*Fim lista*” e C2 “1, 33.3%”
	And **
	And ***


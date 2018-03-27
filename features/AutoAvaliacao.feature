Cenário de serviço: todos os conceitos são fornecidos para todas as metas
Given no sistema estão cadastradas as metas A, B, C 
When o usuário fornece os conceitos para MA para A, MPA para B e MA para C
Then o sistema armazena a auto-avaliação do usuário

Cenário de GUI: todos os conceitos são fornecidos para todas as metas
Given o aluno Ted está na página de auto-avaliação
And existem as metas A, B e C
When Ted salva o conceito MA para a meta A, MA para a meta B e MA para a meta C
Then é mostrada uma mensagem de confirmação

Cenário de serviço: ausência de conceitos para uma meta
Given no sistema estão cadastradas as metas A, B, C 
When o usuário fornece os conceitos para MA para A, MPA para B e não especifica o conceito de C
Then o sistema não armazena a auto-avaliação do usuário

Cenário de GUI: ausência de conceitos para uma meta
Given o aluno Ted está na página de auto-avaliação
And existem as metas A, B e C
When Ted salva o conceito MA para a meta A, e não informa nenhum conceito para as metas B e C
Then é mostrada uma mensagem de erro
And não é nenhum conceito na auto-avaliação

Cenário de GUI: não há auto-avaliações discrepantes
Given A aluna Robin Scherbatsky tem os conceitos MPA, MA, MA, MA e MANA nas metas A, B , C, D e E, respectivamente, na avaliação do professor e os conceitos MPA, MA, MA, MA e MPA nas metas A, B, C, D e E respectivamente, da auto-avaliação
And O aluno Ranjit Singh tem os conceitos MA, MPA, MPA, MPA e MA nas metas A, B, C, D e E, respectivamente, na avaliação do professor e os conceitos MPA, MANA, MANA, MANA e MPA nas metas A, B, C, D e E respectivamente, da auto-avaliação
And O aluno Ted Mosby tem os conceitos MA, MA, MA, MPA e MA nas metas A, B , C, D e E, respectivamente, na avaliação do professor e os conceitos MA, MA, MA, MPA e MA nas metas A, B, C, D e E respectivamente, da auto-avaliação
When vou na página “Auto-avaliações discrepantes”
Then é exibido 0 na quantidade de alunos
And 0% no percentual de alunos 
And nenhum aluno é exibido na lista de alunos

Cenário de GUI: discrepância de auto-avaliação
Given O aluno Ted Mosby tem os conceitos MA, MA, MA, MPA e MA nas metas A, B , C, D e E, respectivamente, na avaliação do professor e os conceitos MA, MA, MA, MPA e MA nas metas A, B, C, D e E respectivamente, da auto-avaliação
And O aluno Marshall Eriksen tem os conceitos MPA, MA, MANA, MPA e MA nas metas A, B , C, D e E, respectivamente, na avaliação do professor e os conceitos MPA, MA, MPA, MPA e MA nas metas A, B, C, D e E respectivamente, da auto-avaliação
And A aluna Lily Aldrin tem os conceitos MPA, MA, MPA, MANA e MANA nas metas A, B , C, D e E, respectivamente, na avaliação do professor e os conceitos MPA, MA, MPA, MPA e MPA nas metas A, B, C, D e E respectivamente, da auto-avaliação
When vou na página “Auto-avaliações discrepantes”
Then é exibido 1 na quantidade de alunos
And é exibido 33% no percentual de alunos
And na lista de alunos há o nome de Lily Aldrin

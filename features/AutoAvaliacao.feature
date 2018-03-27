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
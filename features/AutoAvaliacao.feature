Cenário de serviço: todos os conceitos são fornecidos para todas as metas
Given no sistema estão cadastradas as metas A, B, C 
When o usuário fornece os conceitos para MA para A, MPA para B e MA para C
Then o sistema armazena a auto-avaliação do usuário

Cenário de GUI: todos os conceitos são fornecidos para todas as metas
Given o aluno Ted está na página de auto-avaliação
And existem as metas A, B e C
When Ted salva o conceito MA para a meta A, MA para a meta B e MA para a meta C
Then é mostrada uma mensagem de confirmação
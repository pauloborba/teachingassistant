Feature: Auto-Avaliação
	
	As a: Aluno do sistema
	I want to: avaliar o meu desempenho
	So that: eu posso comparar a minha avaliação com a do professor

Cenário de GUI:

Scenario: Aluno se auto-avalia

Given: O aluno “x” está na página de “auto-avaliação”
And: o sistema tem as metas “Entender conceitos de Requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de Gerência de Configuração”
When: O aluno tenta submeter sua avaliação com “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “MA” em “Entender conceitos de Gerência de Configuração”
Then: O aluno “x” pode ver no campo correspondente a sua auto-avaliação “MPA” na célula correspondente a “Entender conceitos de Requisitos”, “MA” na célula correspondente a “Especificar requisitos com qualidade” e “MA” na célula correspondente a “Entender conceitos de Gerência de Configuração”
Cenário de Servico:
Scenario: Autoavaliação bem-sucedida no sistema
Given: O aluno “x” ainda não submeteu sua auto-avaliação
When: O aluno “x” submete sua avaliação com  “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “MA” em “Entender conceitos de Gerência de Configuração”
Then: a auto-avaliação do aluno “x” é gravada no sistema

Cenário de GUI:

Scenario: Tentativa de auto-avaliação incompleta

Given: O aluno “x” está na página de “auto-avaliação”
And: o sistema tem as metas “Entender conceitos de Requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de Gerência de Configuração”
When: O aluno tenta submeter sua avaliação com “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “” em “Entender conceitos de Gerência de Configuração”
Then: O aluno recebe uma mensagem de que a auto-avaliação não foi realizada
And: O aluno permanece na mesma página
Cenário de Serviço:
Scenario: Auto-avaliação já realizada não é repetida
Given: O aluno “x” já submeteu sua auto-avaliação
When: O aluno “x” submete sua avaliação com  “MPA” em “Entender conceitos de Requisitos”, “MA” em “Especificar requisitos com qualidade” e “MA” em “Entender conceitos de Gerência de Configuração”
Then: a auto-avaliação do aluno “x” não é gravada no sistema

Scenario: Sem alunos com discrepância
Given: Eu estou logado como professor, com login “xyz” e senha “1234”
And: O aluno “José” preencheu sua autoavaliação com “MPA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de gerência de configuração”, “MPA” em “Entender motivação e conceitos de gerência de projetos”, “MA” em “Entender motivação e conceitos de testes” e “MA” em “Entender motivação e conceitos de implementação”
And: O aluno “José” foi avaliado com “MANA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de gerência de configuração”, “MPA” em “Entender motivação e conceitos de gerência de projetos”, “MA” em “Entender motivação e conceitos de testes” e “MA” em “Entender motivação e conceitos de implementação”
And: O aluno “Efraim” preencheu sua autoavaliação com “MPA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de gerência de configuração”, “MPA” em “Entender motivação e conceitos de gerência de projetos”, “MPA” em “Entender motivação e conceitos de testes” e “MPA” em “Entender motivação e conceitos de implementação”
And: O aluno “Efraim” foi avaliado com “MA” em “Entender motivação e conceitos de requisitos”, “MA” em “Entender motivação e conceitos de gerência de configuração”, “MA” em “Entender motivação e conceitos de gerência de projetos”, “MA” em “Entender motivação e conceitos de testes” e “MA” em “Entender motivação e conceitos de implementação”
And: O aluno “Eliezer” preencheu sua autoavaliação com “MA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de gerência de configuração”, “MPA” em “Entender motivação e conceitos de gerência de projetos”, “MA” em “Entender motivação e conceitos de testes” e “MA” em “Entender motivação e conceitos de implementação”
And: O aluno “Eliezer” foi avaliado com “MA” em “Entender motivação e conceitos de requisitos”, “MPA” em “Entender motivação e conceitos de gerência de configuração”, “MPA” em “Entender motivação e conceitos de gerência de projetos”, “MA” em “Entender motivação e conceitos de testes” e “MA” em “Entender motivação e conceitos de implementação”
When: Eu entro na pagina “avaliações dos alunos”
Then: Eu posso ver “0” no campo “número de alunos com avaliações discrepantes”, “0%” no campo “percentual de alunos com avaliações discrepantes” e a mensagem “não há alunos com avaliações discrepantes” no campo “lista de alunos com avaliações discrepantes” 



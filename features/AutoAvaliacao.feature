Feature: Auto-avaliação
                   As a aluno ou professor
                   I want to preencher a tabela de avaliação  observando  a avaliação dada pelos alunos e professores ,assim como a  quantidade,percentual e lista  de alunos com discrepância,caso  que ocorre quando a auto avaliação do aluno é maior que a do professor em pelo menos 25% das avaliações
 Eu preenchi so that eu posso receber a mensagem de confirmação Ok se tiver preenchido completamente ou de dados incompletos se não tiver preenchido completamente.

GUI Cenário :auto avaliação bem sucedida
Given o aluno “joão” está na tabela de preenchimento da auto avaliação
When o aluno “joão”  observa a avaliação do professor que são “MANA,MANA,MANA” em “Entender conceitos de requisitos, Especificar requisitos com qualidade, entender conceitos de gerência de configuração” respectivamente
And o aluno preenche a tabela completamente  com “MA,MPA,MPA” nos requisitos respectivos
And o aluno confirma os dados preenchidos na tabela.
Then aparece uma mensagem relatando  que os dados  de auto avaliação    “MA,MPA,MPA” nos requisitos respectivos  foram salvos .
///////////////////////////////
R: Serviço cenários : auto avaliação bem sucedida
Given  o aluno possui suas auto avaliações que são “MA,MPA,MPA” em “Entender conceitos de requisitos, Especificar requisitos com qualidade, entender conceitos de gerência de configuração” respectivamente
When o sistema demonstra que a avaliação do professor foi “MANA,MANA,MANA” nos requisitos respectivos
And o sistema é completamente preenchido com “MA,MPA,MPA” nos requisitos respectivos
And o sistema é confirmado com preenchimento completo
Then o sistema demonstra que dados de auto avaliação “MA,MPA,MPA” nos requisitos respectivos  foram salvos .

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

GUI Cenário :auto avaliação  mal sucedida
Given o aluno “joão” está na tabela de preenchimento da auto avaliação
When  O aluno observa a avaliação do professor que são “MANA,MANA,MANA” em “Entender conceitos de requisitos, Especificar requisitos com qualidade, entender conceitos de gerência de configuração “ respectivamente
And o aluno preenche “MA,MPA” nos dois primeiros requisitos respectivos
And  o alunos não preenche o último requisito respectivamente
And o aluno confirma os dados preenchidos na tabela que está incompleta
Then  aparece uma mensagem relatando  que os dados  de auto avaliação em “entender conceitos de gerência de configuração“  estão faltando
And o sistema não salva dado algum.
////////////////////////////////
R: Serviço cenários : auto-avaliação mal sucedida
Given  a auto avaliação do aluno são “MA,MPA,MPA” em “Entender conceitos de requisitos, Especificar requisitos com qualidade, entender conceitos de gerência de configuração” respectivamente.
When o sistema demonstra que  as notas dadas pelo professor são “MANA,MANA,MANA” nos requisitos de forma respectiva.
And o sistema  foi preenchido com as notas “MA,MPA” nos dois primeiros requisitos respectivos
And o sistema não foi preenchido no último requisito .
And  o sistema é confirmado com preenchimento incompleto
Then o sistema demonstra que faltam dados de auto avaliação em “entender conceitos de gerência de configuração“
And o sistema não salva dado algum.
And o sistema volta a pagina de auto avaliação

Cenário: Atribuir notas 
Given as notas não foram atribuídas ainda para o aluno “Rodrigo Albuquerque”
When o aluno “Rodrigo Albuquerque” atribui a nota “MA” para a meta “Entender conceitos de requisitos”
And atribui a nota “MA” para a meta “Especificar requisitos com qualidade” 
And atribui a nota “MA” para a meta “Entender conceitos de gerência de configuração” 
Then uma mensagem de sucesso é recebida 
And eu consigo ver a nota “MA” para a meta “Entender conceitos de requisitos”.
And eu consigo ver a nota “MA” para a meta “Especificar requisitos com qualidade” 
And eu consigo ver a nota “MA” para a meta “Entender conceitos de gerência de configuração”

Cenário: Atribuir notas
Given as notas não foram atribuídas ainda para o aluno “Rodrigo Albuquerque”
When é atribuída ao aluno “Rodrigo Albuquerque” a nota “MA” para a meta “Entender conceitos de requisitos”
And é atribuida a nota “MA” para a meta “Especificar requisitos com qualidade” 
And é atribuída a nota “MA” para a meta “Entender conceitos de gerência de configuração” 
Then o sistema registrou a nota “MA” para a meta “Entender conceitos de requisitos”.
And a nota “MA” para a meta “Especificar requisitos com qualidade”
And a nota “MA” para a meta “Entender conceitos de gerência de configuração”
Then
Then "X"

Cenário: Atribuir notas
Given as notas não foram atribuídas ainda para o aluno “Rodrigo Albuquerque”
When é atribuída ao aluno “Rodrigo Albuquerque” a nota “MPA” para a meta “Entender conceitos de requisitos”
And é atribuida a nota “MPA” para a meta “Especificar requisitos com qualidade” 
And é atribuída a nota “MPA” para a meta “Entender conceitos de gerência de configuração” 
Then o sistema registrou a nota “MPA” para a meta “Entender conceitos de requisitos”.
And a nota “MPA” para a meta “Especificar requisitos com qualidade”
And a nota “MPA” para a meta “Entender conceitos de gerência de configuração”

Cenário: Visualizar discrepâncias quando há discrepância
Given que as auto-avaliações já foram cadastradas para o aluno “João Silva” como “MA,MA,MPA,MA,MA” para as metas “A,B,C,D,E”
And o professor atribuiu para o aluno “João Silva” as notas “MA,MA,MANA,MANA,MA” para as metas “A,B,C,D,E”
And as auto-avaliações já foram cadastradas para a aluna “Maria Leite” como “MA,MPA,MPA,MA,MA” para as metas “A,B,C,D,E”
And o professor atribuiu para a aluna “Maria Leite” as notas “MANA,MANA,MANA,MANA,MANA” para as metas “A,B,C,D,E”
And as auto-avaliações já foram cadastradas para o aluno “Enzo Filho” como “MA,MPA,MA,MA,MA” para as metas “A,B,C,D,E”
And o professor atribuiu para o aluno “Enzo Filho” as notas “MA,MPA,MA,MA,MA” para as metas “A,B,C,D,E”
When vejo as informações sobre discrepâncias
Then percebo “Quantidade de discrepâncias” como “4"
And “Alunos” como “João Silva”



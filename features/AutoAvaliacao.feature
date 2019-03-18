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



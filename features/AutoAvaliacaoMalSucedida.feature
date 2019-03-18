Cenário: Atribuir notas 
Given as notas não foram atribuídas ainda para o aluno “Rodrigo Albuquerque”
When o aluno “Rodrigo Albuquerque” atribui a nota “MA” para a meta “Entender conceitos de requisitos”
And atribui a nota “MA” para a meta “Especificar requisitos com qualidade” 
And atribui a nota “-” para a meta “Entender conceitos de gerência de configuração” 
Then uma mensagem de erro é vista
And nenhuma nota pode ser vista para a meta “Entender conceitos de requisitos”
And nenhuma nota pode ser vista para a meta “Especificar requisitos com qualidade” 
And nenhuma nota pode ser vista para a meta “Entender conceitos de gerência de configuração”

Cenário: Atribuir notas com falta de uma nota
Given as notas não foram atribuídas ainda para o aluno “Rodrigo Albuquerque”
When é pedido ao sistema para que atribua a “Rodrigo Albuquerque” a nota “MA” para a meta “Entender conceitos de requisitos”
And a nota “MPA” para a meta “Especificar requisitos com qualidade” 
And a nota “-” para a meta “Entender conceitos de gerência de configuração”
Then o sistema não cadastra nenhuma nota para a metas “Entender conceitos de requisitos” 
And não cadastra nenhuma nota para a meta “Especificar requisitos com qualidade” 
And não cadastra nenhuma nota para a meta “Entender conceitos de gerência de configuração”
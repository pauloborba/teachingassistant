Feature: API de Comparação de Desempenho
  Como um sistema cliente
  Eu quero solicitar cálculos de comparação de desempenho entre turmas
  Para que eu possa exibir os dados consolidados para o professor

Scenario: Sucesso na requisição de cálculo de comparação de desempenho
  Given a disciplina "Sistemas Operacionais" está cadastrada no sistema
    And a turma "T1-25.1" possui notas cadastradas no sistema
    And a turma "T2-25.2" possui notas cadastradas no sistema
  When eu solicito ao sistema a comparação da métrica "Média" entre as turmas "T1-25.1" e "T2-25.2" da disciplina "Sistemas Operacionais"
  Then o sistema retorna o status de sucesso
    And o sistema retorna o valor "8.5" para a turma "T1-25.1" no JSON de resposta
    And o sistema retorna o valor "9.2" para a turma "T2-25.2" no JSON de resposta
    And as turmas "T1-25.1" e "T2-25.2" permanecem inalteradas no sistema com suas reRepositoriesspectivas notas

Scenario: Falha na requisição de cálculo de comparação por falta de parâmetros mínimos
  Given a disciplina "Banco de Dados" está cadastrada no sistema
    And a turma "T1-25.1" possui notas cadastradas no sistema
  When eu envio uma requisição de comparação de "Média" informando apenas a disciplina "Banco de Dados" e a turma "T1-25.1"
  Then o sistema rejeita a requisição e retorna um código de erro de requisição inválida
    And o sistema retorna uma mensagem de erro indicando que é necessário fornecer ao menos duas turmas no payload

Scenario: Sucesso na requisição de cálculo de comparação mesmo com turma sem dados cadastrados
  Given a disciplina "Engenharia de Software e Sistemas" está cadastrada no sistema
    And a turma "T1-26.1" possui notas cadastradas no sistema
    And a turma "T2-26.2" está cadastrada no sistema sem notas avaliadas
  When eu solicito ao sistema a comparação da métrica "Média" entre as turmas "T1-26.1" e "T2-26.2" da disciplina "Engenharia de Software e Sistemas"
  Then o sistema retorna o status de sucesso
    And o sistema retorna o valor "8.9" para a turma "T1-26.1" no JSON de resposta
    And o sistema retorna o valor "N/A" para a turma "T2-26.2" no JSON de resposta

Scenario: Falha na requisição de cálculo de comparação ao burlar regras de negócio da GUI
  Given a disciplina "Inteligência Artificial" está cadastrada no sistema
    And a disciplina "Banco de Dados" está cadastrada no sistema
    And a turma "T1" de "Inteligência Artificial" possui notas cadastradas no sistema
    And a turma "T1" de "Banco de Dados" possui notas cadastradas no sistema
  When eu envio um payload de requisição tentando comparar a turma "T1" de "Inteligência Artificial" diretamente com a turma "T1" de "Banco de Dados"
  Then o sistema intercepta a inconsistência e retorna um código de erro de entidade não processável
    And o sistema não realiza nenhum cálculo de métrica
    And o sistema retorna uma mensagem de erro indicando que só é permitida a comparação entre turmas de uma única disciplina

Scenario: Sucesso na requisição de cálculo de comparação ao selecionar múltiplas métricas
  Given a disciplina "Sistemas Operacionais" está cadastrada no sistema
    And a turma "T1-25.1" possui notas cadastradas no sistema
    And a turma "T2-25.2" possui notas cadastradas no sistema
  When eu solicito ao sistema a comparação das métricas "Média" e "Número de aprovados" entre as turmas "T1-25.1" e "T2-25.2" da disciplina "Sistemas Operacionais"
  Then o sistema retorna o status de sucesso
    And o sistema retorna o valor "8.1" para a média da turma "T1-25.1" no JSON de resposta
    And o sistema retorna o valor "9.0" para a média da turma "T2-25.2" no JSON de resposta
    And o sistema retorna o valor "58" para o número de aprovados da turma "T1-25.1" no JSON de resposta
    And o sistema retorna o valor "47" para o número de aprovados da turma "T2-25.2" no JSON de resposta

Scenario: Falha na requisição de cálculo de comparação ao não selecionar métrica alguma
  Given a disciplina "Banco de Dados" está cadastrada no sistema
    And a turma "T1-25.1" possui notas cadastradas no sistema
    And a turma "T2-25.2" possui notas cadastradas no sistema
  When eu envio uma requisição de comparação informando as turmas "T1-25.1" e "T2-25.2" da disciplina "Banco de Dados" sem especificar uma métrica
  Then o sistema rejeita a requisição e retorna um código de erro de requisição inválida
    And o sistema retorna uma mensagem de erro indicando que é necessário selecionar ao menos uma métrica no payload

Scenario: Falha na requisição de cálculo de comparação ao solicitar métrica inválida ou inexistente
  Given a disciplina "Engenharia de Software e Sistemas" está cadastrada no sistema
    And a turma "T1-26.1" possui notas cadastradas no sistema
    And a turma "T2-26.1" possui notas cadastradas no sistema
  When eu envio uma requisição de comparação informando a métrica "Taxa de Evasão" entre as turmas "T1-26.1" e "T2-26.1" da disciplina "Engenharia de Software e Sistemas"
  Then o sistema rejeita a requisição e retorna um código de erro de entidade não processável
    And o sistema retorna uma mensagem de erro indicando que a métrica solicitada não é suportada pelo sistema
    And o sistema retorna o valor "N/A" para a turma "T1-26.1" no JSON de resposta
    And o sistema retorna o valor "N/A" para a turma "T2-26.1" no JSON de resposta

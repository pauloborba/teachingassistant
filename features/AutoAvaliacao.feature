Feature: Auto-avaliação
As a Aluno
I want to atribuir conceitos nas metas avaliadas
So that informar ao professor a minha espectativa

Scenário preenchimento bem sucedido - GUI
Given estou na página de "Auto Avaliação"
When avalio a meta "Requisitos" com "MA"
And avalio a meta "Gerencia" com "MPA"
And envio as metas avaliadas
Then vejo uma mensagem de auto avaliação bem sucedida

Scenario preenchimento bem sucedido - Serviço
Given que o professor avaliou a meta "Requisitos"
And avaliou a meta "Gerencia"
When o aluno avaliar a meta "Requisitos"
And avaliar a meta "Gerencia"
Then essas avaliações serão guardadas no sistema

Scenario preenchimento mal sucedido - GUI
Given estou na página de "Auto Avaliação"
When avalio a meta "Requisitos" com "MMA"
And avalio a meta "Gerencia" com "MA"
And envio as metas avaliadas
Then vejo uma mensagem de auto avaliação mal sucedida

Scenario preenchimento mal sucedido - Serviço
Given que o professor avaliou a meta "Requisitos"
And avaliou a meta "Gerencia"
When o aluno avaliar a meta "Requisitos" com "MMA"
And avaliar a meta "Gerencia" com "MPA"
Then as avaliações do aluno permanacerão inalteradas
And um log de erro será criado

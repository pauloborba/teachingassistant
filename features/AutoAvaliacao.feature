Feature: AutoAvaliacao
As a student I want to add, edit and see my self-evaluation so that I can let my teacher know what I think about my learning development

Scenario: AutoAvaliacao bem sucedida
Given I’m logged in as “Aluno”
And I am at the “Auto-Avaliação” page
And I see no grades added
When I add the grades “MA” for “Elicitar e escrever requisitos”
And I add the grades “MA” for “Usar sistema de controle de versão”
And I add the grades “MA” for “Projetar e implementar features e cenários”
Then I’m at the “Auto-Avaliação” page
And I can see “MA” as grade for “Elicitar e escrever requisitos”
And I can see “MA” as grade for “Usar sistema de controle de versão”
And I can see “MA” as grade for “Projetar e implementar features e cenários”

Scenario: AutoAvaliacao mal sucedida(nota faltando)
Given I’m logged in as “Aluno”
And I am at the “Auto-Avaliação” page
And I see no grades added
When I add the grades “MA” for “Elicitar e escrever requisitos”
And I add the grades “” for “Usar sistema de controle de versão”
And I add the grades “MA” for “Projetar e implementar features e cenários”
Then I’m at the “Auto-Avaliação” page
And I can see an error message about missing grade

Scenario: AutoAvaliacao sem notas discrepantes 
Given I’m logged in as “Aluno”
And I am at the “Auto-Avaliação” page
And I see no self-evaluation grades added
And I see the teacher's grades “MA” for “Elicitar e escrever requisitos”
And I see the teacher's grades “MA” for “Usar sistema de controle de versão”
And I see the teacher's grades “MA” for “Projetar e implementar features e cenários”
When I add the grades “MA” for “Elicitar e escrever requisitos”
And I add the grades “MA” for “Usar sistema de controle de versão”
And I add the grades “MA” for “Projetar e implementar features e cenários”
Then I’m at the “Auto-Avaliação” page
And I can see “MA” as grade for “Elicitar e escrever requisitos”
And I can see “MA” as grade for “Usar sistema de controle de versão”
And I can see “MA” as grade for “Projetar e implementar features e cenários”
And I can see a message about "Nenhuma discrepância detectada"


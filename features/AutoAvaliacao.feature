Given I am logged in as “student” with login “afbe” and password “aredas123”
And I am at the "Self-evaluation" page And I see that the grades are not added yet
When I add the grade “MA” for “Elicitar e escrever com qualidade artefatos de requisitos”, 
And I add the grade “MPA” for  “Usar com eficácia um sistema de controle de versão distribuídos”
And I add the grade “MA” for “participar efetivamente de uma equipe de desenvolvimento”
And I add the grade “MPA” for  “implementar com qualidade testes de unidade, integração e aceitação”
And I add the grade “MA” for “projetar e implementar com qualidade features e cenários”
And I add the grade “MPA” for “identificar e resolver necessidades de fatoração”
Then I’m at the "Grades" page 
And I can see the grades “MA” for “Elicitar e escrever com qualidade artefatos de requisitos”, “MPA” for “Usar com eficácia um sistema de controle de versão distribuídos”, “MA” for “participar efetivamente de uma equipe de desenvolvimento”,  “MPA” for  “implementar com qualidade testes de unidade, integração e aceitação”, “MA” for “projetar e implementar com qualidade features e cenários”

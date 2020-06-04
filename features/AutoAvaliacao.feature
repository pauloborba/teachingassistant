Cardápio Diário.
Cenário 1 (bem-sucedido):
Given algo
and alguinho
When aquilo acontecde
Then eu obtenho isso
And aquilo
And mais aquilo

Cenário 2 (mal-sucedido):
Given algo
and alguinho
When aquilo acontecde
Then eu obtenho isso
And aquilo
And mais aquilo
And adicionando mais um passo adicional

Scenario: there’s a total of 0 students with discrepancies
GUI:
Given I am at the "Discrepâncias" page
When I check the “Total: X alunos”
Then the X displays 0
And there is no students with discrepancies

Scenario: there’s a total of 1 students with discrepancies
GUI:
Given I am at the "Discrepâncias" page
When I check the “Total: X alunos”
Then the X displays 1
And there is one student displaying at the list


Feature : Atendimento Recepção-profissional
As a: Recepcionista
I Want to: adicionar, remover e modificar a agenda de certo profissional
So that: O NASE teria mais controle sobre os seus profissionais

Scenario: adding self evaluation grades.
Given: I am at the “evaluate Incomplete” page.
And: The teacher have already “evaluated before”.
When: I “add grade” to every single goal
Then: I am at the “evaluate Complete” page
And: I can’t evaluate again, but can compare the grades.
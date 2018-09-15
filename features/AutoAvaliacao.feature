Feature: self-evaluation
  As a member of the student body
  I want can assign concepts the goals of the discipline
  So that I can evaluate my own performance

Scenario: Successful note padding
  Given the goals "Entender conceitos de requisitos", "Especificar requisitos com qualidade" and "Entender conceitos de gerência de configuração" are registered in the system
  When I assign the concepts "MA", "MPA" and "MPA" the goals
  Then the concepts will be properly stored in the system.

Scenario: Successful note padding
  Given I am logged in as "Aluno"
  And I am in the "Notas do Aluno" menu
  And the goals "Entender conceitos de requisitos", "Especificar requisitos com qualidade" and "Entender conceitos de gerência de configuração" are properly registered in the system
  When I assign the concepts "MANA", "MPA" and "MPA" the goals
  And I select the "Salvar" option
  Then I see a confirmation message
  And the concepts "MANA", "MPA" and "MPA" are correctly assigned to their respective goals.

Scenario: Unsuccessful note padding
  Given the goals "Entender conceitos de requisitos", "Especificar requisitos com qualidade" and "Entender conceitos de gerência de configuração" are registered in the system
  When I assign the concepts "MA", "MPA" and "" the goals
  Then the concepts will not be stored in the system.

Scenario: Unsuccessful note padding
  Given I am logged in as "Student"
  And I am in the "Student Notes" menu
  And the goals "Entender conceitos de requisitos", "Especificar requisitos com qualidade" and "Entender conceitos de gerência de configuração" are properly registered in the system
  When I assign the concepts "MANA", "" and "" the goals
  And I select the "Save" option
  Then I see a message showing that the "Especificar requisitos com qualidade" and "Entender conceitos de gerência de configuração" goals were not completed
  And another message showing that the concepts were not saved.

Scenario: No self-rated discrepant
  Given I am logged in as "Professor"
  And the goals “Prática”, “Teoria”, “Escrita”, “Programação” and "Linguagens" are registered in the system
  And the page "Lista de avaliações discrepantes" shows an empty list
  And the student "João" evaluated with the concepts "MA", "MA", "MPA", "MA" and "MPA"
  And the student "José" evaluated with the concepts "MANA", "MANA", "MPA", "MPA" and "MANA"
  And the student "Maria" was evaluated with the concepts "MA", "MPA", "MPA", "MA" and "MA"
  And I am in the menu "Conceitos dos Alunos"
  When I evaluate "João" with the concepts "MPA", "MA", "MPA", "MA" and "MPA"
  And I evaluated "José" with the concepts "MA", "MPA", "MA", "MA" and "MPA"
  And I evaluated "Maria" with the concepts "MA", "MPA", "MPA", "MA" and "MA"
  And access through the menu to the page "Lista de avaliações discrepantes"
  Then I see that no name is listed.

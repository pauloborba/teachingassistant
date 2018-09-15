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

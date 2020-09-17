Scenario: Estudante cadastrando sua própria nota com sucesso
Given I am at the “Self-Grades” menu
When I set the grade “MA”for the “Requirements” topic
Then I can see a confirmation message
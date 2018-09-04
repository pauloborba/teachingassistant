Feature: Self-evaluation
    As a Student
    I want to rate myself in all my learning goals and compare with the professor’s evaluation
    So that I can see what to study more

Scenario: Self-Evaluate with concepts
    Given I am logged as a student named “Lucas Cardoso” 
    And I have been evaluated in the learning goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” and “Entender conceitos de gerência de configuração”
    When I evaluate myself with the concept “MPA”, "MA" and "MANA" respectively
    Then the concept “MPA”, "MA" and "MANA" for the specific learning goal stored in the system

Scenario: Self-Evaluate with concepts GUI
    Given I am logged as a student named “Lucas Cardoso” 
    And I am at the “Auto-avaliação” page 
    When I fill the “conceito” field for learning goal “Entender conceito de requisitos”, “Especificar requisitos com qualidade” and “Entender conceitos de gerência de configuração” with concepts "MPA", "MA" and "MANA" respectively
    And I save
    Then the concepts are stored to each specific learning goal in the system
    And I see a confirmation message

Scenario: Self-Evaluate with concepts negative feedback
    Given I am logged as a student named “Lucas Cardoso” 
    And I have been evaluated in the learning goals “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” and “Entender conceitos de gerência de configuração”
    When I evaluate myself with only the concept “MPA” and "MANA" respectively
    Then the concept “MPA”, "MA" are not stored in the system

Scenario: Self-Evaluate with concepts GUI negative feedback
    Given I am logged as a student named “Lucas Cardoso” 
    And I am at the “Auto-avaliação” page 
    When I fill the “conceito” field for learning goal “Entender conceito de requisitos”, “Especificar requisitos com qualidade” and “Entender conceitos de gerência de configuração” with concepts "MPA" and "MA" respectively
    And I save
    Then an error message is displayed
    And I go to "Home" page

Scenario: No Discrepancy detected page GUI
	Given I am logged as professor “Paulo Borba”
	And There are 3 students registered, named “Anderson”, “Alberto” and “Lucas”
	And  “Anderson” has been evaluated with “MPA”, “MPA”, “MPA”, “MPA” and “MPA” and self evaluate himself “MA”, “MPA”, “MPA”, “MPA” and “MPA”
    And  “Alberto” has been evaluated with “MPA”, “MPA”, “MPA”, “MPA” and “MPA” and self evaluate himself “MANA”, “MANA”, “MANA”, “MANA” and “MANA”
    And  “Lucas” has been evaluated with “MPA”, “MPA”, “MPA”, “MPA” and “MPA” and self evaluate himself “MPA”, “MPA”, “MPA”, “MPA” and “MPA”
    When I go to the “Alunos com avaliação discrepante” page
    Then I see no student and the “quantidade” field with “0” and “porcentagem” field with “0%”

    Scenario: Discrepancy detected page GUI
	Given I am logged as professor “Paulo Borba”
	And There are 3 students registered, named “Anderson”, “Alberto” and “Lucas”
	And  “Anderson” has been evaluated with “MPA”, “MPA”, “MPA”, “MPA” and “MPA” and self evaluate himself “MA”, “MA”, “MA”, “MA” and “MA”
    And  “Alberto” has been evaluated with “MPA”, “MPA”, “MPA”, “MPA” and “MPA” and self evaluate himself “MPA”, “MPA”, “MPA”, “MPA” and “MPA”
    And  “Lucas” has been evaluated with “MPA”, “MPA”, “MPA”, “MPA” and “MPA” and self evaluate himself “MPA”, “MPA”, “MPA”, “MPA” and “MPA”
    When I go to the “Alunos com avaliação discrepante” page
    Then I see a list of students containing only “Anderson” and the “quantidade” field with “1” and “porcentagem” field with “33%”

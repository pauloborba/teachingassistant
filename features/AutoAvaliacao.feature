Feature: Self-evaluation
	As a Student
	I want to self assess with concepts that I find consistent with my knowledge in each goal
	So that my grade expectation can be compared to the teacher's assessment.


Scenario: Evaluating yourself
	Given I’m logged as a student at the “Auto-Avaliação” page
	And I see the goals “Entender conceitos de Requisitos”, “Especificar Requisitos com qualidade” to be self-rated
	When I add grade “MA” for goal “Entender conceitos de Requisitos” 
    And “MPA” for goal “Especificar Requisitos com qualidade”
    Then I’m at the “Auto-Avaliação” page
    And I can see a confirmation message
    And I see my assess with the teacher’s assessment.

 Scenario: Evaluating yourself
	Given I’m logged as a student at the “Auto-Avaliação” page
	And I see the goals “Entender conceitos de Requisitos”, “Especificar 
Requisitos com qualidade” to be self-rated
	When I add grade “MA” for goal “Entender conceitos de Requisitos” 
    Then I’m at the “Auto-Avaliação” page
    And I can see the error message “Todas as metas têm que ser avaliadas”
    And I only see the teacher’s assessment on each goal.


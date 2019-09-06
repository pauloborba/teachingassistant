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


Scenario: Analysing discrepant assessments
	Given I’m logged as a teacher at the “Auto-Avaliação do Aluno” page
	And I see the class with  “Caio Marcus” with 1 concept discrepant in 5 
goals
	And “Fabio Queiroz” with none discrepant concepts
	And “Isabela Araújo” with none discrepant concepts
	When I look to the discrepancy rate
	And it is zero percent
Then I’m at the “Auto-Avaliação do Aluno” page
And the assessment is appropriate.


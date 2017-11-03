Feature: As a professor
	 I want to see differences on students' self evalution
	 So that I can manage their learning goals

Scenario: No difference
Given I am at the discrepancias page
Given I can see the student "Pedro" with goals "MANA", "MANA", "MANA", "MANA", "MANA"
And "Pedro" has self-evaluated himself with "MA", "MANA", "MANA", "MANA", "MANA"
And I can see the student "Fulano" with goals "MANA", "MANA", "MANA", "MANA", "MANA"
And "Fulano" has self-evaluated himself with "MANA", "MANA", "MANA", "MANA", "MANA"
And I can see the student "Sicrano" with goals "MANA", "MANA", "MANA", "MANA", "MANA"
And "Sicrano" has self-evaluated himself with "MANA", "MANA", "MANA", "MANA", "MANA"
Then I can see the list alunos discrepantes as empty
And I can see "0" in total de alunos discrepantes
And I can see "0"% in porcentagem de alunos discrepantes

Scenario: Discrepancia 1/3
Given I am at the discrepancias page
Given I can see the student "Pedro" with goals "MANA", "MANA", "MANA", "MANA", "MANA"
And "Pedro" has self-evaluated himself with "MA", "MANA", "MA", "MANA", "MA"
And I can see the student "Fulano" with goals "MANA", "MANA", "MANA", "MANA", "MANA"
And "Fulano" has self-evaluated himself with "MANA", "MANA", "MANA", "MANA", "MANA"
And I can see the student "Sicrano" with goals "MANA", "MANA", "MANA", "MANA", "MANA"
And "Sicrano" has self-evaluated himself with "MANA", "MANA", "MANA", "MANA", "MANA"
Then I can see the list alunos discrepantes with only "Pedro"
And I can see "1" in total de alunos discrepantes
And I can see "33"% in porcentagem de alunos discrepantes
And I can see "DISCREPÂNCIA DETECTADA!!!!!" below the list.
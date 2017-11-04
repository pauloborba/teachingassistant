Feature: As a professor
	 I want to see differences on students' self evalution
	 So that I can manage their learning goals

Scenario: No difference
Given I am at the discrepancias page
Given I can see the student "Pedro" with cpf "666" with goals "MANA", "MANA"
And "Pedro" with cpf "666" has self-evaluated himself with "MANA", "MANA"
And I can see the student "Paulo" with cpf "683" with goals "MANA", "MANA"
And "Paulo" with cpf "683" has self-evaluated himself with "MANA", "MANA"
And I can see the student "Sicrano" with cpf "668" with goals "MANA", "MANA"
And "Sicrano" with cpf "668" has self-evaluated himself with "MANA", "MANA"
And I can see "0" in total de alunos discrepantes
And I can see "0"% in porcentagem de alunos discrepantes

Scenario: Discrepancia 1/3
Given I am at the discrepancias page
Given I can see the student "Pedro" with cpf "666" with goals "MANA", "MANA"
And "Pedro" with cpf "666" has self-evaluated himself with "MA", "MANA"
And I can see the student "Paulo" with cpf "683" with goals "MANA", "MANA"
And "Paulo" with cpf "683" has self-evaluated himself with "MANA", "MANA"
And I can see the student "Sicrano" with cpf "668" with goals "MANA", "MANA"
And "Sicrano" with cpf "668" has self-evaluated himself with "MANA", "MANA"
Then I can see the list alunos discrepantes with "Pedro" with cpf "666" with "!!!!" near it
And I can see "1" in total de alunos discrepantes
And I can see "33"% in porcentagem de alunos discrepantes
And I can see "DISCREPÂNCIA DETECTADA!!!!!" below the list.
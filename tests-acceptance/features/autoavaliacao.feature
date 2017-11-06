Feature: Self assessment
	As a student using the system
	I want to be able to self assess all my goals individually (with the concepts MA, MPA, and MANA) while seeing the concepts attributed to me by my professor 
    So that my self assessment can be recorded.

Scenario: Submit complete self assessment (GUI)
	Given I am at the Autoavaliacao page
	And I have completed my self assessment for the goals Entender conceitos de requisitos, Especificar requisitos com qualidade, and Entender conceitos de gerencia de configuracao with the concepts MA, MPA, and MANA respectively
	When I press the submit button
    Then I can see a confirmation message 

Scenario: Submit incomplete self assessment (GUI)
	Given I am at the Autoavaliacao page
    And I have completed my self assessment for the goals Entender conceitos de requisitos and Especificar requisitos com qualidade with the concepts MA and MPA respectively
	When I press the submit button
	Then I can see an error message
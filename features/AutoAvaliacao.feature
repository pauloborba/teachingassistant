Feature: Self assessment
    As a student using the system
    I want to be able to self assess all my goals individually (with the concepts MA, MPA, and MANA) while seeing the concepts attributed to me by my professor so that after I submit my self assessment it can be stored by the system.

Scenario: Submit complete self assessment (GUI)
    Given The student "Lucas" is at the "Autoavaliação" page
    And "Lucas" has completed his self assessment for the goals "Entender conceitos de requisitos", "Especificar requisitos com qualidade", and "Entender conceitos de gerência de configuração" with the concepts "MA", "MPA", and "MANA" respectively
    When "Lucas" presses the button "Enviar"
Then "Lucas" sees a confirmation message 

Scenario: Submit complete self assessment (Controller)
    Given The student "Lucas" has completed his self assessment for the goals "Entender conceitos de requisitos", "Especificar requisitos com qualidade", and "Entender conceitos de gerência de configuração" with the concepts "MA", "MPA", and "MANA" respectively
    When "Lucas" submits his self assessment
Then The self assessment is properly stored by the system 

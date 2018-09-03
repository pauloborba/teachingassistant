Feature: Self-evaluation
    As a teacher,
    I want to see the grades the students think they deserve in each goal evaluated
    So that I can see how well they think they're doing in the course.

    Scenario: Add self-evaluation successfully (Service)
        Given that there isn’t a self-evaluation stored for student “Guilherme” in the system
        When the system receives the self-evaluation of student “Guilherme”
        Then the self-evaluation of student “Guilherme” is properly stored by the system

    Scenario: Add self-evaluation successfully (GUI)
        Given that I’m at the page "Self-evaluation"
        When I select the “add self-evaluation” option
        And I fill “MPA” to field “Entender conceitos de requisitos”
        And I fill “MPA” to field “Especificar requisito com qualidade”
        And I select the “submit” option
        Then I can see "MPA" in field "Entender conceitos de requisitos" and "MPA" in field "Especificar requisito com qualidade" for student “Guilherme”

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

    Scenario: Add self-evaluation with missing goal (Service)
        Given that there isn’t a self-evaluation stored in the system for student “Guilherme”
        When the system receives the self-evaluation for student "Guilherme" with a missing goal
        Then the self-evaluation of student “Guilherme” isn’t stored by the system

    Scenario: Add self-evaluation with missing goal (GUI)
        Given that I’m at the page "Self-evaluation"
        When I select the “add self-evaluation” option
        And I leave field “Entender conceitos de requisitos” blank
        And I fill “MPA” to field “Especificar requisito com qualidade”
        And I select the “submit” option
        Then I can see a message indicating one or more goals are missing
        And I am redirected to the page "Self-evaluation"

    Scenario: No students have discrepant grades
        Given that I’m at the page "Grades"
        And I see the field "Entender conceitos de requisitos" of self-evaluation of student “Guilherme” is filled with "MPA"
        And I see the field "Entender conceitos de requisitos" of my evaluation for student “Guilherme” is filled “MPA”
        And I see the field "Entender conceitos de requisitos" of self-evaluation of student “Samuel” is filled with “MA”
        And I see the field "Entender conceitos de requisitos" of my evaluation for student “Samuel” is filled with “MA”
        And I see the field "Entender conceitos de requisitos" of self-evaluation of student “Junior” is filled with “MA”
        And I see the field "Entender conceitos de requisitos" of my evaluation for student “Junior” if filled with “MA”
        When I select the “students with discrepant grades” option
        Then I see an empty list of names
        And at line “Total” I see “0”
        And at line “Percentage” I see “0%”

    Scenario: 1 of 2 students have discrepant grades
        Given that I’m at the page "Grades"
        And I see the field "Entender conceitos de requisitos" of self-evaluation of student "Ricardo" is filled with "MA"
        And I see the field "Entender conceitos de requisitos" of my evaluation for student “Ricardo” if filled “MPA”
        And I see the field "Entender conceitos de requisitos" of self-evaluation of student “Samuel” is filled with “MA”
        And I see the field "Entender conceitos de requisitos" of my evaluation for student “Samuel” is filled with “MA”
        When I select the “students with discrepant grades” option
        Then I see the name "Ricardo" at the list of students with discrepant grades
        And at line “Total” I see “1”
        And at line “Percentage” I see “50%”

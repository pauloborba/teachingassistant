Feature: student auto-evaluation
    As a professor responsible for a class
    I want the students to auto-evaluate all the goals graded by the me
    so that I can see a count, percentage and list of students that auto-evaluate at least 25% of the goals with grade greater than those graded by me

    Scenario: student successful auto-evaluation
        Given I am at the “Auto-evaluation” page
        And I have not filled the grades before
        And the professor has graded me “MPA, MPA, MA”
        When I add the grades “MA, MPA, MA”
        And I save the grades
        Then I can see a confirmation message
        And I am redirected to the page I was before

    Scenario: receive student successful auto-evaluation
        Given the student “João Castro” is stored in the system with “MA, MPA, MPA” for the evaluated learning goals and no auto-evaluation grades
        When I send the auto-evaluation grades “MA, MA, MA” to the system
        Then the system returns a successful response
        And the student “João Castro” is stored in the system with “MA, MPA, MPA” for the evaluated learning goals and “MA, MA, MA” for the auto-evaluation grades

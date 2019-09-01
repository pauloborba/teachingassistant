Feature: "auto-avaliação"
As a Student
I want to be able to set my grade in each goal alongside with the teacher’s goal
So that I can compare each grade with the expected

Scenario: concept assignment
Given I am on “Grades” page
And I didn’t have added any grades for “Victor”
When I add my grades (all “MA”)
Then I receive a confirmation
And I am on “Grades” page
And I can see my grades on the list

Scenario: concept assignment
Given no grades have been put for student “Victor”
When all grades have been added for student “Victor” (all “MA”)
Then all grades are properly stored for student “Victor”

Scenario: atribuição dos conceitos mal sucedido por ausência de algum conceito
Given I am on “Grades” page
And I don’t have any grades for “Victor”
When I add my grades (all are “MA”), but forget to add the last one
Then I receive a error message
And I am on “Grades” page
And I don’t have any grades on the list

Scenario: atribuição dos conceitos mal sucedido por ausência de algum conceito
Given no grades have been added for student “Victor”
When all the grades (“MA”) have been added for student “Victor” except the last one
Then a error is sent warning that the grades weren’t well filled
And the grades are not stored
And no grades are stored for "Victor"

Scenario: visualização de nenhuma discrepância
Given I am on “Grades” page
When I select the option “Notas Discrepantes”
Then I receive a message saying no Discrepancies
And I am on “Grades” page

Scenario: visualização de discrepâncias
Given I am on “Grades” page
And there is one student with discrepant grades
When I select the option “Notas Discrepantes”
Then I am on “Discrepâncias”
And I can see one student on the list
And I see a option to go back to "Grades" page

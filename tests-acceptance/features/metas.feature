Feature: As a professor
I want to assign final grades to the students in the course
And that the system automatically calculates the average of the student's final grade with his final grade point average and the student situation at the of the grade
So that I don’t have to do repetitive and extra work to calculate on a separate platform

Scenario: Student with missing grades to fill the final exam note
Given I’m at the grading page
And there’s a registered student called "Rafael Alencar"
When I fill all of Arthur’s grades, except one
Then the field to fill the column "Nota do Exame Final" of "Rafael Alencar" is blocked
And the column field "Situação" shows "Não definida"

Scenario: Student approved by final exam grade success
Given I’m at the grading page
And there’s a registered student called "Rafael Alencar"
And the column field "Média" of "Rafael Alencar" show "6,0"
And the column field "Situação" show "Final"
When I fill the column field "Nota do Exame Final" of "Rafael Alencar" with "5,0"
Then the column field "Média do Exame Final" of "Rafael Alencar" shows "5,5"
And the column field "Situação" change to "Aprovado"

Scenario: Student with average below the final exam criterion
Given I’m at the grading page
And there’s a registered student called "Rafael Alencar"
When the column field "Média" of "Rafael Alencar" show "2,9"
And the column field "Situação" show "Reprovado"
Then the field to fill the column "Nota do Exame Final" of "Rafael Alencar" is blocked

Scenario: Student approved by final exam grade success
Given I’m at the grading page
And there’s a registered student called "Rafael Alencar"
And the column field "Média" of "Rafael Alencar" show "5,0"
And the column field "Situação" show "Final"
When I fill the column field "Nota do Exame Final" of "Rafael Alencar" with "3,0"
Then the column field "Média do Exame Final" of "Rafael Alencar" shows "4,0"
And the column field "Situação" change to "Reprovado Final"
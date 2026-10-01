Feature: Register students grades
  As a professor
  I want to register students grades
  So that I can measure my students' learning by calculating the average of their grades

Scenario: Registering students' grades
  Given I am at the students page
  And I cannot see an average at the end of the students' grades list
  When I try to register the student "Paulo" with grade "6"
  And I try to register the student "Maria" with grade "7.5"
  And I try to register the student "João" with grade "8"
  And I try to register the student "Helena" with grade "7.5"
  Then I can see the students "Paulo", "Maria", "João" and "Helena" with their respective grades on the students page
  And I can see the average "7.5" on the students page

Scenario: Updating a student's grade recalculates the average
  Given I am at the students page
  And I have registered the student "Paulo" with grade "6"
  And I have registered the student "Maria" with grade "7.5"
  And I have registered the student "João" with grade "8"
  And I have registered the student "Helena" with grade "7.5"
  And I can see the average "7.5" on the students page
  When I update the grade of the student "João" to "5"
  Then I can see the average "6.5" on the students page

Scenario: Trying to register a student with an invalid grade
  Given I am at the students page
  And I have registered the student "Paulo" with grade "6"
  And I have registered the student "Maria" with grade "7.5"
  And I can see the average "6.75" on the students page
  When I try to register the student "Carlos" with grade "15"
  Then I can see an error message "Grade must be between 0 and 10"
  And I cannot see the student "Carlos" on the students page
  And I can see the average "6.75" on the students page
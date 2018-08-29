Feature: Self-evaluation
	As a Student
	I want to be able to view the grades given to me by the teacher
	So that I can add my self evaluation accordingly

Scenario: Filling self evaluation grades success
  Given the grades for the user "José" have been filled in the system
  When I try to self evaluate as the user "José"
  Then the self evaluation grades are stored properly

Scenario: Filling self evaluation grades success web
  Given I am at the grades page
  And it shows my grades haven already been filled
  When I select the option to fill the self evaluation
  Then I'm able to self evaluate
  And turn in the self evaluation

Scenario: Grades page with no discrepant student
  Given I am at the discrepant grades page
  And There's 2 students in the class with all the grades filled (regular and self evaluation)
  And student "José" has 20% different higher grades in the self evaluation compared to regular evaluation
  And student "Murilo" have equal grades
  When I look for the metrics of this class
  Then I can see that 0/0% students have discrepant grades

Scenario: Grades page with a single discrepant student
  Given I am at the discrepant grades page
  And There's 3 students with all the grades filled (regular and self evaluation)
  And student "José" has a 40% discrepancy(higher grades) between the regular and self evaluation grades
  When I look for the metrics of this class
  Then I can see that 1/33,33% students have discrepant grades 
  And I can see the name "José" in the list of students with discrepant grades
Feature: Student Data Correlation
	As a professor 
	I want to be able to see correlations between the data from my previous classes
	So that i can be able to spot patterns and, by that, improve my teaching.

Scenario: "Correlation For 0 selected classes":
	Given I am in the page responsible for measuring correlations
	When I select the option to see correlation between multiple variables
	And i dont select a class
	And I select the option responsible for confirming my choices
	Then I see a warning telling me that there are no selected classes
	And the correlations are not presented as natural language statements.

Scenario: "Correlation For 0 selected variables":
	Given I am in the page responsible for measuring correlations
	When I select the option to see correlation between multiple variables
	And i dont select a group of variables
	And I select the option responsible for confirming my choices
	Then I see a warning telling me that there are no selected variables
	And the correlations are not presented as natural language statements.

Scenario: "Correlation For 1 selected class and 2 selected variables" 
	Given I am in the page responsible for measuring correlations
	And The varible "class size", for class "2024.1" is worth 35
	And The variable "Average Student Grade" for class "2024.1" is 5.7
	When I select the option to see correlation between multiple variables
	And I select variables "Class size" and "Average Student Grade"
	And I only select class "2024.1", for checking correlations 
	And I select the option responsible for confirming my choices
	Then I see a warning telling me that one class is not enough for extracting correleations
	And the correlations are not presented as natural language statements.

Scenario: "Correlation for 1 selected variable and 2 selected classes"
	Given I am in the page responsible for measuring correlations
	And The varible "class size", for class "2024.1" is worth 35
	When I select the option to see correlation between multiple variables
	And I select variable "Class size".
	And I select classes "2024.1" and "2024.2" for checking correlations
	And I select the option responsible for confirming my choices
	Then I see a warning telling me that you cannot extract the correlation of a varible with itself
	And the correlations are not presented as natural language statements

Scenario: "Correlation For 2 selected classes and 2 selected variables"
	Given I am in the page responsible for measuring correlations
	And The varible "class size", for class "2024.1" is worth 35
	And The variable "Average Student Grade" for class "2024.1" is 5.7
	And The variable "class size" for class "2024.2" is worth 20
	And The variable "Average Student Grade" for class "2024.2" is 8.7
	When I select the option to see correlation between multiple variables
	And I select variables "Class size" and "Average Student Grade"
	And I select classes "2024.1" and "2024.2" for checking correleations
	And I select the option responsible for confirming my choices
	Then I see a message stating that "Class size" and "average student grade" have a correlation of 16%

Scenario: "Deselecting 1 of the selected classes, having 2 available classes and 2 selected variables"
	Given I am in the page responsible for measuring correlations
	And The variable "Class size" for class "2024.1" is worth 35
	And The variable "Average Student Grade" for class "2024.1" is 5.7
	And The variable "Class size" for class "2024.2" is worth 20
	And The variable "Average Student Grade" for class "2024.2" is 8.7
	And I selected the option to see correlation between multiple variables
	And I selected variables "Class size" and "Average Student Grade"
	And I selected classes "2024.1" and "2024.2"
	And I deselect class "2024.2"
	When I select the option responsible for confirming my choices
	Then I see a warning telling me that one class is not enough for extracting correleations
	And the correlations are not presented as natural language statements.

Scenario: "Deselecting 1 of the selected classes, having 3 available classes and 2 selected variables"
	Given I am in the page responsible for measuring correlations
	And The variable "Class size" for class "2024.1" is worth 35
	And The variable "Average Student Grade" for class "2024.1" is 5.7
	And The variable "Class size" for class "2024.2" is worth 20
	And The variable "Average Student Grade" for class "2024.2" is 8.7
	And The variable "Class size" for class "2024.3" is worth 30
	And The variable "Average Student Grade" for class "2024.3" is 7.0
	And I selected the option to see correlation between multiple variables
	And I selected variables "Class size" and "Average Student Grade"
	And I selected classes "2024.1", "2024.2" and "2024.3"
	And I deselect class "2024.3"
	When I select the option responsible for confirming my choices
	Then I see a message stating that "Class size" and "Average Student Grade" have a correlation of 16%

Scenario: "Deselecting 1 of the selected variables, having 2 available classes and 2 selected variables"
	Given I am in the page responsible for measuring correlations
	And The variable "Class size" for class "2024.1" is worth 35
	And The variable "Average Student Grade" for class "2024.1" is 5.7
	And The variable "Class size" for class "2024.2" is worth 20
	And The variable "Average Student Grade" for class "2024.2" is 8.7
	And I selected the option to see correlation between multiple variables
	And I selected variables "Class size" and "Average Student Grade"
	And I selected classes "2024.1" and "2024.2"
	And I deselect variable "Average Student Grade"
	When I select the option responsible for confirming my choices
	Then I see a warning telling me that you cannot extract the correlation of a variable with itself
	And the correlations are not presented as natural language statements.

Scenario: "Deselecting 1 of the selected variables, having 2 available classes and 3 selected variables"
	Given I am in the page responsible for measuring correlations
	And The variable "Class size" for class "2024.1" is worth 35
	And The variable "Average Student Grade" for class "2024.1" is 5.7
	And The variable "Average Student Self-Evaluation" for class "2024.1" is 8.2
	And The variable "Class size" for class "2024.2" is worth 20
	And The variable "Average Student Grade" for class "2024.2" is 8.7
	And The variable "Average Student Self-Evaluation" for class "2024.2" is 9.2
	And I selected the option to see correlation between multiple variables
	And I selected variables "Class size", "Average Student Grade" and "Average Student Self-Evaluation"
	And I selected classes "2024.1" and "2024.2"
	And I deselect variable "Average Student Grade"
	When I select the option responsible for confirming my choices
	Then I see exactly 1 correlation statement, between "Class size" and "Average Student Self-Evaluation", of 20%
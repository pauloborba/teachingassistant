Feature: auto-avaliação
As a student
I want to self evaluate on each goal
So that i may reflect on my learning and notify the teacher of what i think is a mistake

Scenario:GUI success in submitting a self evaluation
Given I am logged in as student “Pedro”
And I am on the grades page
Then I should see the grades “MA”, “MA”, “MPA” attributed to me by the teacher
And a space to fill in my self evaluation
When I fill in my self evaluation on each of the goals as “MA”, “MA”, “MA”
And I submit the self evaluation
Then i should see a confirmation message
And I should be returned to the grades page, where i can see the self evaluation i submitted below the grades attributed by the teacher

Scenario:server success in submitting a self evaluation
Given that the student “Pedro” is stored in the system
And that his grades are also stored in the the system
When I ask the system to store a completely filled in self evaluation
Then the system returns a success response
And stores the self evaluation


scenarioscnascosanvoansvnoanvonavnxansvoansovnaonojfoajo
And tal coisa que os stakeholders pediram


Scenario: has outliers on self evaluation
Given that I am logged in as a teacher
And that I am on the grades page for a class
And enrolled on that class are the students “Pedro”, “Mariana”, “João"
Then i can see the grades and self evaluation of each student
And i can see a report on the outliers, showing the quantity of outlier students “1”, the percentage of the class that they represent “33%”, and a list of each outlier student “Pedro”
fix1
fix2

commit questão 14 - 1
commit questão 14 - 2
commit questão 14 - 3

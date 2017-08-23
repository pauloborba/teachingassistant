Feature: Student self-evaluation
As a teacher,
I want to have my students grade themselves with a concept for each goal and store them in the system,
So that I may take note of and learn from large discrepancies between my evaluation of the students and their own.

Scenario: successful self-evaluation (GUI)
Given that I am logged in as a student “Lucas”,
and I am on the “Self-evaluation” page,
and there exist only three goals in the system: “A”, “B” and “C”,
When I assign them concepts “MA”, “MPA” and “MANA”, respectively,
and I request the system to turn in my evaluation,
Then I can see a confirmation message,
and I can see the concepts I gave myself for each goal.

Scenario: successful self-evaluation (controller)
Given that there exists a student “Lucas” in the system,
and there exist only three goals in the system: “A”, “B” and “C”,
When student “Lucas” submits his self-evaluation with concepts “MA”, “MPA” and “MANA” for goals “A”, “B” and “C”, respectively,
Then the system stores “Lucas”’ self-evaluation properly.

Scenario: failed self-evaluation due to missing concepts (GUI)
Given that I am logged in as a student “Lucas”,
and I am on the “Self-evaluation” page,
and there exist only three goals in the system: “A”, “B” and “C”,
When I assign concepts “MA” and “MPA” to goals “A” and “B”, respectively, and I assign no concept to “C”,
and I request the system to turn in my evaluation,
Then the system does not store my evaluation,
and I can see an error message requesting me to fill in any missing concepts.

Scenario: failed self-evaluation due to missing concepts (controller)
Given that there exists a student “Lucas” in the system,
and there exist only three goals in the system: “A”, “B” and “C”,
When student “Lucas” submits his self-evaluation with concepts “MA” and  “MPA” for goals “A” and “B”, respectively, 
and the self-evaluation contains no concept for goal “C”,
Then the system does not store “Lucas”’ self-evaluation.
And "Lucas" receives a million dollars from the stakeholders.

Scenario: no student-prejudicial discrepant evaluations (GUI)
Given that there exist only three students in the system: “Fulano”, “Sicrano” and “Beltrano”,
and there exist only five goals in the system: “A”, “B”, “C”, “D” and “E”,
and “Fulano” has received concepts “MA”, ”MA”, ”MA”, ”MA” and “MPA”, respectively, from the teacher,
and “Fulano” has evaluated himself with concepts “MA”, ”MA”, ”MA”, ”MA” and “MA”, respectively,
and “Sicrano” has received concepts “MA”, ”MA”, ”MA”, ”MA” and “MA”, respectively, from the teacher,
and “Sicrano” has evaluated himself with concepts “MPA”, ”MPA”, ”MPA”, ”MPA” and “MPA”, respectively,
and “Beltrano” has received concepts “MA”, ”MA”, ”MA”, ”MA” and “MA”, respectively, from the teacher,
and “Beltrano” has evaluated himself “MA”, ”MA”, ”MA”, ”MA” and “MA”, respectively, from the teacher,
When I view the evaluation discrepancies page,
Then I can see that “0” students (“0%”) had discrepant evaluations,
and the list of students with discrepant evaluations is empty.

Scenario: one student-prejudicial discrepant evaluation out of three (GUI)
Given that there exist only three students in the system: “Fulano”, “Sicrano” and “Beltrano”,
and there exist only three goals in the system: “A”, “B” and “C”,
and “Fulano” has received concepts “MA”, ”MA” and ”MA”, respectively, from the teacher,
and “Fulano” has evaluated himself with concepts “MA”, ”MA” and “MA”, respectively,
and “Sicrano” has received concepts “MA”, ”MA” and ”MA”, respectively, from the teacher,
and “Sicrano” has evaluated himself with concepts “MPA”, ”MPA” and “MPA”, respectively,
and “Beltrano” has received concepts “MPA”, ”MPA” and “MPA”, respectively, from the teacher,
and “Beltrano” has evaluated himself “MA”, ”MA” and “MA”, respectively, from the teacher,
When I view the evaluation discrepancies page,
Then I can see that “1” student (“33%”) had discrepant evaluations,
and the list of students with discrepant evaluations contains “Beltrano”.
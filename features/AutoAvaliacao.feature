As a teacher,
I want to have my students grade themselves with a concept for each goal and store them in the system,
So that I may take note of and learn from large discrepancies between my evaluation of the students and their own.

Given that I am logged in as a student “Lucas”,
and I am on the “Self-evaluation” page,
and there exist only three goals in the system: “A”, “B” and “C”,
When I assign them concepts “MA”, “MPA” and “MANA”, respectively,
and I request the system to turn in my evaluation,
Then I can see a confirmation message,
and I can see the concepts I gave myself for each goal.

Given that there exists a student “Lucas” in the system,
and there exist only three goals in the system: “A”, “B” and “C”,
When student “Lucas” submits his self-evaluation with concepts “MA”, “MPA” and “MANA” for goals “A”, “B” and “C”, respectively,
Then the system stores “Lucas”’ self-evaluation properly.

Given that I am logged in as a student “Lucas”,
and I am on the “Self-evaluation” page,
and there exist only three goals in the system: “A”, “B” and “C”,
When I assign concepts “MA” and “MPA” to goals “A” and “B”, respectively, and I assign no concept to “C”,
and I request the system to turn in my evaluation,
Then the system does not store my evaluation,
and I can see an error message requesting me to fill in any missing concepts.

Given that there exists a student “Lucas” in the system,
and there exist only three goals in the system: “A”, “B” and “C”,
When student “Lucas” submits his self-evaluation with concepts “MA” and  “MPA” for goals “A” and “B”, respectively, 
and the self-evaluation contains no concept for goal “C”,
Then the system does not store “Lucas”’ self-evaluation.


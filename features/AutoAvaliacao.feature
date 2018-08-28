As a student
I want to be able to self evaluate my goals
So that my teacher will be able to see my point of view about them

Given I am at “Self-evaluation” page
And the concepts given by the teacher are shown
When I create a self-evaluation with “MA” filled in for each concept
Then I can see a confirmation message

Given the system has a concept evaluation from professor “Paulo Borba” assigned to student “Lucas Barros” with a value of “MA” for each concept
And the system does not have student’s “Lucas Barros” self-evaluation
When I create a new self-evaluation for “Lucas Barros” with a value of “MA” for each concept
Then the self-evaluation is stored by the system.

Given I am at “Self-evaluation” page
And the concepts given by the teacher are shown
When I create a self-evaluation with “MA” filled in for each concept except the last one, that I left blank
Then I can see a error message

Given the system does not have “Lucas Barros”’s self-evaluation
When I create a new self-evaluation for “Lucas Barros” with a value of “MA” for each concept except the last one, that I left blank
Then the self-evaluation is not stored by the system

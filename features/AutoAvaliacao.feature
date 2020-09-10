Feature: Auto-avaliacao
As a student that is going to use the system
I want to do my auto-evaluation
So that i can keep track in my studies.

Scenario: Successful auto-evaluation
Given im logged as “mamb2”
And im at the “Auto-Avaliacao” page		
When I auto-evaluate myself with grades “MA”, “MPA” and “MANA”
Then i’m at the “Main” page
And I see a successful message

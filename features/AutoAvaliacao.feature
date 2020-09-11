Feature: Auto-avaliacao
As a student that is going to use the system
I want to do my auto-evaluation
So that i can keep track in my studies.

Scenario: Successful auto-evaluation
Given im logged as “Mamb2”
And im at the “Auto-Avaliacao” page		
When I auto-evaluate myself with grades “MA”, “MPA” and “MANA”
Then i’m at the “Main” page
And I see a successful message


Scenario: Unsuccessful auto-evaluation
Given im logged as “mamb2” 
And im ate the “Auto-Avaliacao” page
And i haven’t filled my “Requisitos" goal
When I try to finish my auto-evaluation
Then i’m still the “Auto-Avaliacao” page
And i see an error message
<<<<<<< HEAD
And i can try again
=======

Scenario: No grades discrepancy
Given im logged as “admin”
And im at the “Professor Grades” page
And i see students “Pedro”, “Maria” and “”Manuel”	
When I check the discrepancy I get 
“20%”,”0%”,”0%” (considerei discrepância apenas notas postas maiores que a do professor)
Then i post the grades
And im at the “Main” page
And I see a successful message

Scenario: Grades discrepancy
Given im logged as “admin”
And im at the “Professor Grades” page
And i see students “Pedro”, “Maria” and “”Manuel”	
When I check the discrepancy I get 
“20%”,”40%”,”0%” (considerei discrepância apenas notas postas maiores que a do professor)
Then i ask the system for “Maria”’s goals
And i correct if necessary
And i post the grades
And im at the “Main” page
And I see a successful message

>>>>>>> discrepantes

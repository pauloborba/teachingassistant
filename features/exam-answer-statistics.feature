Feature: Exam answer statistics

  As a professor responsible for a class
  I want to see how my students answered each question and each alternative of an exam
  So that I can identify the content the class did not learn and review it

  Background:
    Given I am logged in as the professor "Paulo Borba", responsible for the class "ESS 2025.1"
    And the exam "Exam 1" of "ESS 2025.1" has only the questions "Q1", "Q2" and "Q3"
    And each question of "Exam 1" has only the alternatives "A", "B", "C" and "D"
    And the correct alternative of "Q1" is "A", of "Q2" is "B" and of "Q3" is "C"

  Scenario: see the hit rate of each question of a corrected exam
    Given the exam "Exam 1" was answered only by the students "Ana Ribeiro", "Bruno Tavares", "Carla Nunes" and "Diego Alves"
    And the answers to "Q1" were "A", "A", "A" and "B"
    And the answers to "Q2" were "B", "D", "D" and "D"
    And the answers to "Q3" were "C", "C", "A" and "D"
    When I open the "Answer statistics" page of "Exam 1"
    Then I see the question "Q1" with "3" correct answers, "1" wrong answer and a hit rate of "75%"
    And I see the question "Q2" with "1" correct answer, "3" wrong answers and a hit rate of "25%"
    And I see the question "Q3" with "2" correct answers, "2" wrong answers and a hit rate of "50%"

  Scenario: see how the answers of a question are distributed among its alternatives
    Given the exam "Exam 1" was answered only by the students "Ana Ribeiro", "Bruno Tavares", "Carla Nunes" and "Diego Alves"
    And the answers to "Q2" were "B", "D", "D" and "D"
    When I open the "Answer statistics" page of "Exam 1"
    And I expand the question "Q2"
    Then I see the alternative "B" of "Q2" chosen by "1" student, marked as the correct alternative
    And I see the alternative "D" of "Q2" chosen by "3" students
    And I see the alternative "A" of "Q2" chosen by "0" students
    And I see the alternative "C" of "Q2" chosen by "0" students

  Scenario: see the report of the questions missed most often
    Given the exam "Exam 1" was answered only by the students "Ana Ribeiro", "Bruno Tavares", "Carla Nunes" and "Diego Alves"
    And the answers to "Q1" were "A", "A", "A" and "B"
    And the answers to "Q2" were "B", "D", "D" and "D"
    And the answers to "Q3" were "C", "C", "A" and "D"
    When I open the "Most missed questions" report of "Exam 1"
    Then I see the questions in the order "Q2", "Q3", "Q1"
    And I see the question "Q2" with "3" wrong answers and the most chosen wrong alternative "D"
    And I see the question "Q3" with "2" wrong answers
    And I see the question "Q1" with "1" wrong answer

  Scenario: see a question that every student answered correctly
    Given the exam "Exam 1" was answered only by the students "Ana Ribeiro" and "Bruno Tavares"
    And the answers to "Q1" were "A" and "A"
    When I open the "Answer statistics" page of "Exam 1"
    Then I see the question "Q1" with "2" correct answers, "0" wrong answers and a hit rate of "100%"
    And I do not see the question "Q1" in the "Most missed questions" report of "Exam 1"

  Scenario: fail to see the statistics of an exam that nobody answered
    Given the exam "Exam 1" was not answered by any student of "ESS 2025.1"
    When I open the "Answer statistics" page of "Exam 1"
    Then I see a message stating that "Exam 1" has no answers to analyse
    And I do not see any hit rate for the questions of "Exam 1"

  Scenario: fail to see the statistics of an exam that does not belong to the class
    Given the exam "Exam 9" does not belong to "ESS 2025.1"
    When I try to open the "Answer statistics" page of "Exam 9"
    Then I see an error message stating that the exam "Exam 9" was not found in "ESS 2025.1"

  Scenario: ignore unanswered questions when computing the hit rate
    Given the exam "Exam 1" was answered only by the students "Ana Ribeiro", "Bruno Tavares" and "Carla Nunes"
    And the answers to "Q3" were "C", "C" and no answer
    When I open the "Answer statistics" page of "Exam 1"
    Then I see the question "Q3" with "2" correct answers, "0" wrong answers and a hit rate of "100%"
    And I see the question "Q3" with "1" student who did not answer it

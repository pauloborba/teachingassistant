@learning-goals
Feature: Learning goals management in Teaching Assistant

  As a professor
  I want to register learning goals for my students
  So that I can track their progress during the course

  Scenario: Registering a learning goal for a student
      Given I am at the learning goals page
      And I cannot see the goal "Read chapter 10" for the student with CPF "683"
      When I try to register the goal "Read chapter 10" for the student with CPF "683"
      Then I can see the goal "Read chapter 10" for the student with CPF "683" in the learning goals list

  Scenario: Marking a learning goal as achieved
      Given I am at the learning goals page
      And I can see the goal "Read chapter 12" for the student with CPF "683" as not achieved
      When I mark the goal "Read chapter 12" for the student with CPF "683" as achieved
      Then I can see the goal "Read chapter 12" for the student with CPF "683" as achieved

  Scenario: Registering a learning goal for a non registered student
      Given I am at the learning goals page
      And I cannot see a student with CPF "999" in the students list
      When I try to register the goal "Read chapter 10" for the student with CPF "999"
      Then I can see the error message "Student not found"

  Scenario: Registering a learning goal with an empty description
      Given I am at the learning goals page
      When I try to register the goal "" for the student with CPF "683"
      Then I can see the error message "Goal description cannot be empty"
      And the goal is not added to the learning goals list

  Scenario: Updating the description of a learning goal
      Given I am at the learning goals page
      And I can see the goal "Read chapter 12" for the student with CPF "683"
      When I update the goal description to "Read chapters 12 and 13" for the student with CPF "683"
      Then I can see the goal "Read chapters 12 and 13" for the student with CPF "683" in the learning goals list

  Scenario: Removing a learning goal
      Given I am at the learning goals page
      And I can see the goal "Read chapter 12" for the student with CPF "683"
      When I remove the goal "Read chapter 12" for the student with CPF "683"
      And I confirm the removal
      Then I cannot see the goal "Read chapter 12" for the student with CPF "683" in the learning goals list

  Scenario: Listing all learning goals of a student
      Given I am at the learning goals page
      When I search for the student with CPF "683"
      Then I can see all learning goals registered for that student

  Scenario: Registering a duplicated learning goal
      Given I am at the learning goals page
      And I can see the goal "Read chapter 12" for the student with CPF "683"
      When I try to register the goal "Read chapter 12" for the student with CPF "683"
      Then I can see the error message "Goal already registered for this student"

  Scenario: Registering a learning goal with a past due date
      Given I am at the learning goals page
      When I try to register the goal "Read chapter 14" with due date "2020-01-01" for the student with CPF "683"
      Then I can see the error message "Due date cannot be in the past"

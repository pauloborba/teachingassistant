Feature: Student's self-assessment in Teaching Assistant

  As a student
  I want to be able to self-assess in tasks and activities
  So I can track my own academic progress

  Scenario: Student performs self-assessment on a task
      Given I am logged into the system as a student
      And I have an assigned task
      When I access the task page
      And I fill in the self-assessment fields
      And I submit my self-assessment
      Then I should see a confirmation that my self-assessment was successfully recorded
      And my self-assessment should be reflected in my task score

  Scenario: Unsuccessful self-assessment submission
      Given I am logged into the system as a student
      And I have an assigned task
      When I access the task page
      And I fill in the self-assessment fields
      But I leave required fields blank or provide invalid data
      And I submit my self-assessment
      Then I should see an error message indicating that the submission is invalid
      And there should be no changes to my previous self-assessment
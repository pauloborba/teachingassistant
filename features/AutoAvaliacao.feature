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


  As a teacher
  I want to review and compare students' self-assessments with my assessments
  So I can track their progress and provide feedback

  Scenario: Student's self-assessment with no discrepancies with teacher's assessment
      Given I am logged into the system as a teacher
      And a student has completed a task
      And I have provided an assessment for the student's task
      When I access the student's task
      And I review their self-assessment
      Then I should see that the student's self-assessment matches my assessment
      And I can provide additional feedback or comments if necessary
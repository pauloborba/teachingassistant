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
      And there should be no changes to my task score


  As a teacher
  I want to review and compare students self-assessments with my assessments
  So I can track their progress and provide feedback

  Scenario: Student's self-assessment with no discrepancies with teacher's assessment
      Given I am logged into the system as a teacher
      And a student has completed a task
      And I have provided an assessment for the student's task
      When I access the student's task
      And I review their self-assessment
      Then I should see that the student's self-assessment matches my assessment
      And I can provide additional feedback or comments if necessary

  Scenario: Student's self-assessment has discrepancies with teacher's assessment
      Given I am logged into the system as a teacher
      And a student has completed a task
      And I have provided an assessment for the student's task
      When I access the student's task
      And review their self-assessment
      Then I should see that the student's self-assessment has discrepancies compared to my assessment
      And I can provide feedback or comments to the student regarding the discrepancies
      And I should be able to update the student's assessment score if necessary
      And the system should record that I have reviewed the student's self-assessment

  Scenario: Viewing the percentage of discrepancy
      Given I am logged into the system as a teacher
      And a student has completed a task
      And I have provided an assessment for the student's task
      And the student has submitted a self-assessment for the same task
      When I access the student's task
      And review both the student's self-assessment and my assessment
      Then I should see a visual representation of the percentage of discrepancy
      And I can easily identify the areas where the assessments differ
      And I can use this information to provide constructive feedback to the student
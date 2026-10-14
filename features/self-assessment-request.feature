Feature: self-assessment request
  As a professor
  I want to request the self-assessment of the students of my class and remind those who have not submitted it yet
  So that all students submit their self-assessment before the deadline

  Scenario: request self-assessment for a class
    Given I am logged in as the professor of the class "ESS 2026.2"
    And the students "Ian Monteiro", "Henrique Xavier" and "Matheus Menezes" are enrolled in the class "ESS 2026.2"
    And the class "ESS 2026.2" has no self-assessment request
    And today is "08/10/2026"
    And I am at the "Self-assessment requests" page of the class "ESS 2026.2"
    When I request the self-assessment of the class "ESS 2026.2" with deadline "20/10/2026"
    Then I see a confirmation message stating that the request was sent to "3" students
    And I see a self-assessment request with deadline "20/10/2026"
    And I see the students "Ian Monteiro", "Henrique Xavier" and "Matheus Menezes" with status "Pending"

  Scenario: send reminder only to students with pending self-assessment
    Given I am logged in as the professor of the class "ESS 2026.2"
    And the class "ESS 2026.2" has a self-assessment request with deadline "20/10/2026"
    And the student "Ian Monteiro" has submitted the self-assessment of all goals of the class "ESS 2026.2"
    And the students "Henrique Xavier" and "Matheus Menezes" have not submitted the self-assessment of the class "ESS 2026.2"
    And today is "15/10/2026"
    And I am at the "Self-assessment requests" page of the class "ESS 2026.2"
    When I send a reminder to the students with pending self-assessment
    Then I see a confirmation message stating that the reminder was sent to "2" students
    And I see the students "Henrique Xavier" and "Matheus Menezes" with status "Pending" and last reminder on "15/10/2026"
    And I see the student "Ian Monteiro" with status "Completed" and no reminder

  Scenario: attempt to send reminder after the deadline
    Given I am logged in as the professor of the class "ESS 2026.2"
    And the class "ESS 2026.2" has a self-assessment request with deadline "20/10/2026"
    And the student "Henrique Xavier" has not submitted the self-assessment of the class "ESS 2026.2"
    And the student "Henrique Xavier" has last reminder on "15/10/2026"
    And today is "21/10/2026"
    And I am at the "Self-assessment requests" page of the class "ESS 2026.2"
    When I try to send a reminder to the students with pending self-assessment
    Then I see an error message stating that the deadline "20/10/2026" has passed
    And I see the student "Henrique Xavier" with status "Pending" and last reminder on "15/10/2026"

  Scenario: attempt to send reminder when all students have submitted
    Given I am logged in as the professor of the class "ESS 2026.2"
    And the class "ESS 2026.2" has a self-assessment request with deadline "20/10/2026"
    And the students "Ian Monteiro", "Henrique Xavier" and "Matheus Menezes" have submitted the self-assessment of all goals of the class "ESS 2026.2"
    And today is "15/10/2026"
    And I am at the "Self-assessment requests" page of the class "ESS 2026.2"
    When I try to send a reminder to the students with pending self-assessment
    Then I see a message stating that there are no students with pending self-assessment
    And I see the students "Ian Monteiro", "Henrique Xavier" and "Matheus Menezes" with status "Completed" and no reminder

  Scenario: reminder is sent only to students with pending self-assessment
    Given the class "ESS 2026.2" has a self-assessment request with deadline "20/10/2026"
    And the student "Ian Monteiro" with email "ian@cin.ufpe.br" has submitted the self-assessment of all goals of the class "ESS 2026.2"
    And the student "Henrique Xavier" with email "henrique@cin.ufpe.br" has not submitted the self-assessment of the class "ESS 2026.2"
    And today is "15/10/2026"
    When I send a reminder for the self-assessment request of the class "ESS 2026.2"
    Then the system sends a reminder email with deadline "20/10/2026" to "henrique@cin.ufpe.br"
    And the system sends no reminder email to "ian@cin.ufpe.br"
    And the system stores a reminder on "15/10/2026" for the student "Henrique Xavier"
    And the student "Ian Monteiro" still has the self-assessment of all goals of the class "ESS 2026.2" stored

  Scenario: request with a past deadline is rejected
    Given the students "Ian Monteiro" and "Henrique Xavier" are enrolled in the class "ESS 2026.2"
    And the class "ESS 2026.2" has no self-assessment request
    And today is "08/10/2026"
    When I request the self-assessment of the class "ESS 2026.2" with deadline "01/10/2026"
    Then the system returns an error message stating that the deadline must be after "08/10/2026"
    And the class "ESS 2026.2" still has no self-assessment request
    And the system sends no self-assessment request email

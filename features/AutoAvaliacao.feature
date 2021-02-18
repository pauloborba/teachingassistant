Auto-Avaliação
    As a student of a subject
    I want to assign the “MA”, “MPA” and “MANA” concepts to my   goals, respecting the maximum discrepancy (25%)
    So that I can generate a feedback to the teacher about my own development

Scenario: Successfully do a self rating
	Given I am a student
	And I’m inside the self rating page
    And I see the ratings of each goal that the teachers of each subject gave to me
    And I see fields of each goal that I need to complete with a self rating
    When I complete each field with “MANA”, “MPA” and “MA”
    And I click on “Send ratings” button
    Then a successful message will be shown in the page
    And the “Send ratings button” won’t be available anymore because I already did that

Scenario: Unsuccessfully do a self rating
	Given I am a student
	And I’m inside the self rating page
    And I see the ratings of each goal that the teachers of each subject gave to me
    And I see fields of each goal that I need to complete with a self rating
    When I complete only some of the fields with “MANA”, “MPA” and “MA”
    And I click on “Send ratings” button
    Then an error message will be shown in the page, telling me that I need to rate every goal
    And the “Send ratings” button will still be available because I need to solve the problem by rating every goal


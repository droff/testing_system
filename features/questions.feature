Feature: Questions
  Background:
    Given App installed
    And I am logged as admin

  Scenario: Create Question with radioInput
    Given I am on "questions new" page
    When I fill in "question_title" with "2 + 2"
    And I fill in "question_score" with "1"
    And I fill in "question_answers_a" with "1"
    And I fill in "question_answers_b" with "2"
    And I fill in "question_answers_c" with "3"
    And I fill in "question_answers_d" with "4"
    And I choose "question_correct_answers_d"
    And I press "Create Question"
    Then I should see "Title: 2 + 2"

  @javascript
  Scenario: Create Question with textInput
    Given I am on "questions new" page
    When I fill in "question_title" with "2 + 2"
    And I fill in "question_score" with "1"
    And I choose "question_qtype_textinput"
    And I fill in "question_correct_answers" with "4"
    And I press "Create Question"
    Then I should see "Score: 1"

  @javascript
  Scenario: Create Question with checkboxInput
    Given I am on "questions new" page
    When I fill in "question_title" with "2 + 2 && 3 * 3"
    And I fill in "question_score" with "4"
    And I choose "question_qtype_checkboxinput"
    And I fill in "question_answers_a" with "4"
    And I fill in "question_answers_b" with "2"
    And I fill in "question_answers_c" with "9"
    And I fill in "question_answers_d" with "12"
    And I check "question_correct_answers_a"
    And I check "question_correct_answers_c"
    And I press "Create Question"
    Then I should see "Title: 2 + 2 && 3 * 3"

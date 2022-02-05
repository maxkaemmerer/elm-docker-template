Feature: Home Page
  Scenario: See the Home Page
    Given I am on page "/"
    Then I see text "Counter: 0" in body
    When I click increment
    When I click increment
    Then I see text "Counter: 2" in body
    When I click decrement
    Then I see text "Counter: 1" in body
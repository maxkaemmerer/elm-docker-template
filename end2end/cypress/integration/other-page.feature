Feature: Other Page
  Scenario: See the Other Page
    Given I am on page "/other-page"
    Then I see text "Other Page Content" in body
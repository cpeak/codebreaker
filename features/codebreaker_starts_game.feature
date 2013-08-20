Feature: code-breaker starts game

  As a code-breaker
  I want to start a game
  So that I can break the code

  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see "Somebody set us up the bomb"
    And I should see "You have no chance to survive. Make your time"
    And I should see "Enter guess:"

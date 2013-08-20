Feature: Codebreaker wins game
  As a codebreaker
  I get a message that I have solved the code

  Scenario: win game
    Given the secret code is "1234"
    When I guess "1234"
    Then I should see "++++"
    And I should see "You have disarmed the bomb"

Feature: code-breaker starts game 
  As a code-breaker 
  I want to start a game 
  So that I can break the code 

    Scenario: start game 
      Given I am not yet playing 
      When I start a new game 
      Then the game should say "Welcome to Mastermind!" 
      And the game should say "Enter guess:" 

    #Scenario: solve game
      #Given I guess the answer correctly
      #When I solve the puzzle
      #Then the game should say "You solved the puzzle!"
      #And the game should end

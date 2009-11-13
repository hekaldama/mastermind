Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  @messenger = StringIO.new
  game = Mastermind::Game.new(@messenger)
  game.start
end

Then /^the game should say "([^\"]*)"$/ do |message|
  @messenger.string.split("\n").should include(message)
end

#Given /^I guess the answer correctly$/ do
  #pending
#end

#When /^I solve the puzzle$/ do
  #pending
#end

#Then /^the game should end$/ do
  #pending
#end

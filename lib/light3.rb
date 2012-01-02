# Light3 -  A game similar to tic-tac-toe.
#
# This is the entry point for light3.

require 'light3/game'

if __FILE__ == $0
  game = Light3::Game.new
  game.play
end

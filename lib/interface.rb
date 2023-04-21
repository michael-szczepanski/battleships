require './lib/game.rb'

# Ideas
# TODO Implement a -1 and +1 board for subs and planes
# TODO implement a maths function that will create an array of ships based on board size
# TODO implement an AI to play against

class Interface
  attr_reader :game

  def initialize()
    @game
  end

  def create_game(players, board_size, ship_sizes)
    @game = Game.new(players, board_size, ship_sizes)
  end
end
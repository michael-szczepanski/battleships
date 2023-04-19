require './lib/game.rb'

class Interface
  def initialize()
    @game
  end

  def create_game(players, board_size, ship_sizes)
    @game = Game.new(players, board_size, ship_sizes)
  end

  def game
    return @game
  end
end
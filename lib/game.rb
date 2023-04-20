require './lib/player.rb'

class Game
  def initialize(players, board_size, ship_sizes)
    @players = create_players(players)
    @board_size = board_size
    @ship_sizes = ship_sizes
  end

  def place_ships()
    @players.each { |player| player.place_ships }
  end

  def create_players(players_count)
    players = []
    players_count.times do
      name = "player"
      players << Player.new(name)
    end
    return players
  end
end
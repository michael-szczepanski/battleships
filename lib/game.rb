require './lib/player.rb'

class Game
  def initialize(players, board_size, ship_sizes)
    @ship_sizes = ship_sizes
    @board_size = board_size
    @players = create_players(players)
  end

  def place_ships()
    @players.each do |player|
      player.place_ships
    end
  end

  def create_players(players_count)
    players = []
    players_count.times do
      name = "player"
      player = Player.new(name, @board_size, @ship_sizes)
      players << player
    end
    return players
  end

  def ship_sizes()
    return @ship_sizes
  end
end
require './lib/player.rb'

class Game
  def initialize(players, board_size, ship_sizes)
    @ship_sizes = ship_sizes
    @board_size = board_size
    @players = create_players(players)
  end

  def place_ships()
    # runs placing methods on each player initialized
    # returns confirmation string
    @players.each do |player|
      player.place_ships
    end
    return "All players have finished placing their ships"
  end

  def create_players(players_count)
    # Creates player objects based on the count provided by the initializer
    # Returns nothing
    players = []
    players_count.times do
      name = "player"
      player = Player.new(name, @board_size, @ship_sizes)
      players << player
    end
    return players
  end
end
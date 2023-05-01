# frozen_string_literal: true

require './lib/player'

class Game
  attr_reader :players

  def initialize(players, board_size, ship_sizes)
    @ship_sizes = ship_sizes
    @board_size = board_size
    @players = create_players(players.to_i)
    @io_handler = IOHandler
  end

  def place_ships
    # TODO: clear terminal after each player is done placing their ships
    # runs placing methods on each player initialized
    # returns confirmation string
    @players.each(&:place_ships)
    'All players have finished placing their ships'
  end

  def create_players(players_count)
    # Creates player objects based on the count provided by the initializer
    # Returns nothing
    players = []
    counter = 1
    players_count.times do
      @io_handler
      name = "player #{counter}"
      player = Player.new(name, @board_size, @ship_sizes)
      players << player
      counter += 1
    end
    players
  end

  def check_for_winner
    # TODO: return a string to signal a player losing the game
    # checks for any players that have no ships left in their array and removes those from the player list

    @players.each do |player|
      next if player.nil?

      @players[@players.index(player)] = nil if player.ships.compact.empty?
    end

    @players.compact.size == 1 ? @players.compact[0] : nil
  end
end

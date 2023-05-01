# frozen_string_literal: true

require './lib/game'

RSpec.describe Game do
  it 'it initializes' do
    players = 2
    board_size = 5
    ship_sizes = [1, 1, 2, 3, 3]
    expect(
      game = Game.new(players, board_size, ship_sizes)
    ).to be
  end

  it 'runs place_ships method correctly' do
    players = 2
    board_size = 5
    ship_sizes = [1, 1, 2, 3, 3]
    game = Game.new(players, board_size, ship_sizes)
    expect(
      game.place_ships
    ).to eq 'All players have finished placing their ships'
  end

  context 'removes players with no ships from the game' do
    it 'all players left alive' do
      players = 2
      board_size = 5
      ship_sizes = [1, 1, 2, 3, 3]
      game = Game.new(players, board_size, ship_sizes)
      game.place_ships
      game.check_for_winner
      expect(
        game.players
      ).to eq [game.players[0], game.players[1]]
    end
    it 'all players dead' do
      players = 2
      board_size = 5
      ship_sizes = [1, 1, 2, 3, 3]
      game = Game.new(players, board_size, ship_sizes)
      game.check_for_winner
      expect(
        game.players
      ).to eq [nil, nil]
    end
    it 'returns the winner if only one player left alive' do
      players = 1
      board_size = 5
      ship_sizes = [1]
      game = Game.new(players, board_size, ship_sizes)
      expect(
        game.check_for_winner
      ).to eq game.players[0]
    end
  end
end

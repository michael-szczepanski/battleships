require './lib/game.rb'

RSpec.describe Game do
  it 'it initializes' do
    players = 2
    board_size = 5
    ship_sizes = [1,1,2,3,3]
    expect(
      game = Game.new(players, board_size, ship_sizes)
    ).to be
  end

  it 'runs place_ships method correctly' do
    players = 2
    board_size = 5
    ship_sizes = [1,1,2,3,3]
    game = Game.new(players, board_size, ship_sizes)
    expect(
      game.place_ships
    ).to eq "All players have finished placing their ships"
  end
end
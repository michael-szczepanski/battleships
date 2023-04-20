require 'game'

RSpec.describe Game do
  it 'runs place_ships method correctly' do
    players = 2
    board_size = 10
    ship_sizes = [1,1,2,3,3]
    game = Game.new(players, board_size, ship_sizes)
    expect(
      game.place_ships
    ).to eq "Placing ships complete"
  end
end
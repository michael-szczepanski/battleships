require 'player'

RSpec.describe Player do
  it 'it initializes' do
    name = "Mike"
    ship_sizes = [1,1,2,3,3]
    board_size = 5
    expect(
      Player.new(name, board_size, ship_sizes)
    ).to be
  end

  it 'place_ship method working correctly' do
    ship_sizes = [1,1,2,3,3]
    name = "Mike"
    board_size = 5
    player = Player.new(name, board_size, ship_sizes)
    expect(
      player.place_ships
    ).to eq []
  end
end
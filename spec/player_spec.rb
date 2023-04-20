require 'player'

RSpec.describe Player do
  it 'it initializes' do
    name = "Mike"
    expect(
      Player.new(name)
    ).to be
  end

  it 'place_ship method working correctly' do
    player = Player.new("Mike")
    expect(
      player.place_ships
    ).to eq []
  end
end
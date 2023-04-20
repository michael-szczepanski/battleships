require './lib/player.rb'

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
    ).to eq "#{name} has finished placing ships."
  end

  it 'draws board correctly' do
    player = Player.new("Mike", 5, [])
    expect(
      player.draw_board
    ).to eq "   A B C D E\n  -----------\n1 | | | | | |\n  -----------\n2 | | | | | |\n  -----------\n3 | | | | | |\n  -----------\n4 | | | | | |\n  -----------\n5 | | | | | |\n  -----------\n"
  end
end
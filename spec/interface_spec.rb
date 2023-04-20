require './lib/interface.rb'

RSpec.describe Interface do
  it 'initializes a game object' do
    interface = Interface.new
    players = 2
    board_size = 5
    ship_sizes = [1,1,2,3,3]
    interface.create_game(players, board_size, ship_sizes)
    expect(interface.game).to be
  end

  it 'initializes place_ship loop' do
    interface = Interface.new
    players = 2
    board_size = 5
    ship_sizes = [1,1,2,3,3]
    interface.create_game(players, board_size, ship_sizes)
    expect(
      interface.game.place_ships
    ).to eq "All players have finished placing their ships"
  end
end
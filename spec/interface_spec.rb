require './lib/interface.rb'

RSpec.describe Interface do
  it 'initializes a game object' do
    io_handler = double :IOHandler
    interface = Interface.new(io_handler)
    players = 2
    board_size = 5
    ship_sizes = [1,1,2,3,3]
    interface.create_game(players, board_size, ship_sizes)
    expect(interface.game).to be
  end

  it 'initializes place_ship loop' do
    io_handler = double :IOHandler
    interface = Interface.new(io_handler)
    players = 2
    board_size = 5
    ship_sizes = [1,1,2,3,3]
    interface.create_game(players, board_size, ship_sizes)
    expect(
      interface.game.place_ships
    ).to eq "All players have finished placing their ships"
  end

  it 'runs the main method to trigger setup' do
    io_handler = double :IOHandler
    player_1_dbl = double :Player

    expect(io_handler).to receive(:prompt_for_player_count)
    expect(io_handler).to receive(:get_player_count).and_return(1)
    expect(io_handler).to receive(:prompt_for_board_size)
    expect(io_handler).to receive(:get_board_size).and_return(5)
    allow(io_handler).to receive(:prompt_for_shot)
    allow(io_handler).to receive(:prompt_for_winner)

    interface = Interface.new(io_handler)
    expect(
      interface.run
    ).to eq "player has won the game!"
  end
end
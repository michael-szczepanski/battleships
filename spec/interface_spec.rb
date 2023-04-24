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

  xit 'runs the main method to trigger setup' do
    io_handler = double :IOHandler
    player_1_dbl = double :Player
    player_2_dbl = double :Player

    expect(io_handler).to receive(:prompt_for_player_count).and_return(2)
    expect(io_handler).to receive(:prompt_for_board_size).and_return(4)
    expect(io_handler).to receive(:prompt_for_commands).and_return("shoot")
    # TODO Implement a way to inject a list of doubles in place of @players in the Interface.Game object
    expect(io_handler).to receive(:prompt_for_shot).with(player_1_dbl)
    # expect(io_handler).to receive(:prompt_for_winner)

    interface = Interface.new(io_handler)
    expect(
      interface.run
    ).to eq "player has won the game!"
  end
end
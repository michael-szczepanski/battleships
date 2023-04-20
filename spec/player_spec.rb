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
    ).to eq "   a b c d e\n  -----------\n1 | | | | | |\n  -----------\n2 | | | | | |\n  -----------\n3 | | | | | |\n  -----------\n4 | | | | | |\n  -----------\n5 | | | | | |\n  -----------\n"
  end

  it 'adds ships to board' do
    player = Player.new("Mike", 3, [2])
    player.place_ships
    expect(
      player.draw_board
    ).to eq "   a b c\n  -------\n1 | | | |\n  -------\n2 | |2|2|\n  -------\n3 | | | |\n  -------\n"
  end

  it 'checks for collisions with stage boundary' do
    player = Player.new("Mike", 3, [2])
    ship = double :Ship, position: [2, "b"], horizontal: true, size: 4
    expect(
      player.check_for_boundary_collisions(ship)
    ).to eq false
  end

  it 'checks for collisions with other ships' do
    player = Player.new("Mike", 3, [2])
    player.place_ships
    ship = double :Ship, position: [2, "b"], horizontal: true, size: 2
    expect(
      player.check_for_ship_collisions(ship)
    ).to eq false
  end

  context 'shoot_at returns correct value' do
    player_1 = Player.new("Mike", 3, [2])
    player_2 = Player.new("Steve", 3, [2])
    player_1.place_ships
    player_2.place_ships

    it 'returns hit if ship is hit' do
      shot_position = [2, "c"]
      expect(
        player_1.shoot_at(player_2, shot_position)
      ).to eq "Hit"
    end

    it 'returns miss if no ship at chose location' do
      shot_position = [2, "a"]
      expect(
        player_1.shoot_at(player_2, shot_position)
      ).to eq "Miss"
    end
  end
end
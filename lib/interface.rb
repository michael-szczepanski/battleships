# frozen_string_literal: true

require './lib/game'

# Ideas
# TODO Implement a -1 and +1 board for subs and planes
# TODO implement a maths function that will create an array of ships based on board size
# TODO implement an AI to play against
# TODO implement a way to see a list of alive players

class Interface
  attr_reader :game

  def initialize(io_handler = IOHandler)
    @io_handler = io_handler
    @game
    @game_finished = false
  end

  def create_game(players, board_size, ship_sizes)
    @game = Game.new(players, board_size, ship_sizes)
  end

  def run
    players = @io_handler.prompt_for_player_count
    board_size = @io_handler.prompt_for_board_size
    ship_sizes = generate_ship_sizes(board_size)
    create_game(players, board_size, ship_sizes)
    @game.place_ships

    until @game_finished
      @game.players.each do |player|
        next if player.nil?

        # This will prompt the player for commands until the player chooses to make a shot at an opponent
        command = false

        # Run the commands list until player decides to shoot at an opponent
        while command != 'shoot'
          command = @io_handler.prompt_for_commands(player)

          case command
          when 'player list'
            @io_handler.display_player_list
          when 'shot history'

          else
            @io_handler.prompt_for_incorrect_command
          end
        end

        # This will process the shot at opponent
        opponent = false
        while opponent == false
          shot = @io_handler.prompt_for_shot(player)
          opponent = find_player(shot[0])
        end
        result = player.shoot_at(opponent, shot[1])
        @io_handler.get_shot_result(player, opponent, result)
        winner = @game.check_for_winner

        # Check if the game has a winner
        next unless winner.is_a?(Player)

        @io_handler.prompt_for_winner(winner)
        @game_finished = true
        return "#{winner.name} has won the game!"
      end
    end
  end

  def generate_ship_sizes(_board_size)
    [1]
  end

  def find_player(name)
    @game.players.each do |player|
      next if player.nil?
      return player if player.name == name
    end
    false
  end
end

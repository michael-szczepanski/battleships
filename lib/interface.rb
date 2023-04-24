require './lib/game.rb'

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

  def run()
    players = @io_handler.prompt_for_player_count
    board_size = @io_handler.prompt_for_board_size
    ship_sizes = generate_ship_sizes(board_size)
    create_game(players, board_size, ship_sizes)
    @game.place_ships
    
    while !@game_finished
      @game.players.each do |player|
        next if player == nil
        
        # This will prompt the player for commands until the player chooses to make a shot at an opponent
        @io_handler.prompt_for_commands(player)
        
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
        if winner.is_a?(Player)
          @io_handler.prompt_for_winner(winner)
          @game_finished = true
          return "#{winner.name} has won the game!"
        end
      end
    end 
  end

  def generate_ship_sizes(board_size)
    return [1]
  end

  def find_player(name)
    @game.players.each do |player|
      next if player == nil
      if player.name == name
        return player
      end
    end
    return false
  end
end
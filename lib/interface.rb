require './lib/game.rb'

# Ideas
# TODO Implement a -1 and +1 board for subs and planes
# TODO implement a maths function that will create an array of ships based on board size
# TODO implement an AI to play against

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
        shot = @io_handler.prompt_for_shot(player)
        result = @game.check_for_winner
        if result.is_a?(Player)
          @io_handler.prompt_for_winner(result)
          @game_finished = true
          return "#{result.name} has won the game!"
        end
      end
    end 
  end

  def generate_ship_sizes(board_size)
    return [1]
  end
end
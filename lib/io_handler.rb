require './lib/game.rb'

class IOHandler
  class << self

    def prompt_for_player_count
      puts "Please enter the player count"
      return get_player_count
    end

    def get_player_count
      number = gets.chomp
      if number == number.to_i.to_s && number.to_i > 0
        return number
      else
        puts "Please enter an integer higher than 0 for player count"
        prompt_for_player_count
      end
    end

    def prompt_for_board_size
      puts "Please enter the size of the board you'd like to play on"
      return get_board_size
    end

    def get_board_size
      number = gets.chomp
      if number == number.to_i.to_s && number.to_i > 3
        return number
      else
        puts "Please enter an integer higher than 3 for board size"
        prompt_for_board_size
      end
    end

    def prompt_for_shot(player)
      puts "Which opponent would you like to shoot at?"
      opponent = gets.chomp
      position = get_shot_position
      return [opponent, position]
    end

    def get_shot_position()
      puts "What position would you like to shoot at? e.g. 1 a"
      position = gets.chomp
      if !position.matches?(/^\d*\s\w$/)
        puts "Position format invalid, please use a '1 a' format"
        get_shot_position
      else
        return position.split(" ")
      end
    end
  end
end
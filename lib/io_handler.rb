# frozen_string_literal: true

require './lib/game'

class IOHandler
  class << self
    def prompt_for_player_count(io = Kernel)
      io.puts 'Please enter the player count'
      get_player_count(io)
    end

    def get_player_count(io = Kernel)
      number = io.gets.chomp
      return number if number == number.to_i.to_s && number.to_i > 1

      io.puts 'Please enter an integer higher than 1 for player count'
      prompt_for_player_count(io)
    end

    def prompt_for_board_size
      puts "Please enter the size of the board you'd like to play on"
      get_board_size
    end

    def get_board_size
      number = gets.chomp
      return number if number == number.to_i.to_s && number.to_i > 3

      puts 'Please enter an integer higher than 3 for board size'
      prompt_for_board_size
    end

    def prompt_for_shot(player, io = Kernel)
      io.puts "#{player.name}: Which opponent would you like to shoot at?"
      opponent = gets.chomp
      position = get_shot_position
      [opponent, position]
    end

    def get_shot_position
      puts 'What position would you like to shoot at? e.g. 1 a'
      position = gets.chomp
      return position.split(' ') if position.match?(/^\d*\s\w$/)

      puts "Position format invalid, please use a '1 a' format"
      get_shot_position
    end

    def prompt_for_winner(player)
      puts "#{player.name} has won the game!"
    end

    def get_shot_result(player, opponent, result)
      puts "#{player} shot at #{opponent} and #{result}"
    end

    def prompt_for_commands(_player)
      # TODO: implement Shot History, list of Players, Shoot
      puts 'What would you like to do?'
      gets.chomp
    end
  end
end

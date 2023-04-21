require './lib/ship.rb'

class Player
  attr_reader :ships, :shot_history

  def initialize(name, board_size, ship_sizes)
    @name = name
    @ship_sizes = ship_sizes
    @ships = []
    @board_size = board_size
    @shot_history = {}
    @board = create_board(board_size)
  end

  def place_ships()
    # iterates through the list of ship sizes and mutates it into
    # a list of Ship objects at correct positions and size
    @ship_sizes.each do |ship_size|
      position = [2,"b"]
      horizontal = true
      # create ship object
      ship = Ship.new(ship_size, position, horizontal)
      # TODO implement method checks for collissions once user input is implemented
      # fail "Collided with ship" if check_for_ship_collisions(ship)
      # fail "Collided with boundary" if check_for_boundary_collisions(ship)
      ship_size.times do
        @board[position[0] - 1][position[1].ord - 97] = ship
        horizontal ? (position[1] = (position[1].ord + 1).chr) : position[0] += 1
      end
      @ships << ship
    end
    return "#{@name} has finished placing ships."
  end

  def create_board(size)
    # Creates and returns an array of nested arrays to make a size x size matrix
    return Array.new(size) { Array.new(size) {" "} }
  end

  def draw_board(board = @board)
    # TODO make a draw a rectangular one
    # TODO mark players own ships as sunk when drawing their own board
    # Draws a board based on the @board variable
    # Returns the board in the form of a string
    offset = board.size.to_s.length + 1 # offset based on the length of longest row number
    board_string = " ".center(offset)
    divider = "#{" ".center(offset)}#{'-' * (board[0].size * 2 + 1)}\n"
    column_counter = 97 # 'a'

    board[0].size.times do
      board_string << " #{column_counter.chr}"
      column_counter += 1
    end

    board_string << "\n#{divider}"

    board.each_with_index do |row, index|
      board_string << "#{(index + 1).to_s.center(offset)}|#{row.join("|")}|\n"
      board_string << divider
    end

    return board_string
  end

  def check_for_ship_collisions(ship)
    # checks if there is an existing ship or if the ship is out of bounds
    # returns true if there are no collisions, or false otherwise
    position = ship.position # [1, "a"]
    horizontal = ship.horizontal
    ship.size.times do
      return false if @board[position[0] - 1][position[1].ord - 97].is_a? Ship
      horizontal ? (position[1] = (position[1].ord + 1).chr) : position[0] += 1
    end
    return true
  end

  def check_for_boundary_collisions(ship)
    # checks if the ship has collided with the boundary of the game field
    # return true if there are no collisions, or false otherwise
    position = ship.position # [1, "a"]
    horizontal = ship.horizontal
    ship.size.times do
      return false if position[0] - 1 >= @board.size
      return false if position[1].ord - 97 >= @board[position[0] - 1].size
      horizontal ? (position[1] = (position[1].ord + 1).chr) : position[0] += 1
    end
    return true
  end

  def shoot_at(player, position)
    # type checks variable at given position on an opponents board
    # returns false if shot has already been taken
    # returns Hit if that variable is a Ship, Miss otherwise
    
    result = player.check_at_position(position)

    if @shot_history[player] == nil
      @shot_history[player] = [{:result=>result, :position=>position}]
    else
      return false if @shot_history[player].include?({:result=>result, :position=>position})
      @shot_history[player] << {:result=>result, :position=>position}
    end

    return result
  end

  def check_at_position(position)
    # type checks variable at given position on self board
    # if hit, decrement from @hit_points and return "Hit" if @hit_points are above 0 or "Sunk" otherwise
    # return "Miss" if there was no ship on that place on the board
    board_position = @board[position[0] - 1][position[1].ord - 97]
    return "Miss" if !board_position.is_a?(Ship)
    board_position.hit_points -= 1
    return board_position.hit_points == 0 ? "Sunk" : "Hit"
  end

  def draw_shot_history(player)
    # TODO update @shot_history so that it can dispplay sunk ships correctly
    history_board = create_board(@board_size)
    @shot_history[player].each do |shot|
      case shot[:result]
      when "Hit"
        history_board[shot[:position][0] - 1][shot[:position][1].ord - 97] = "h"
      when "Miss"
        history_board[shot[:position][0] - 1][shot[:position][1].ord - 97] = "m"
      when "Sunk"
        history_board[shot[:position][0] - 1][shot[:position][1].ord - 97] = "s"
      end
    end
    return "Shots at #{player.to_s}:\n#{draw_board(history_board)}"
  end

  def to_s()
    return @name
  end
end
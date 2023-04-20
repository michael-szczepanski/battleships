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
    # returns true if that variable is a Ship, miss otherwise
    # TODO implement a Sunk value check
    # TODO shoot history
    result = player.check_at_position(position).is_a?(Ship) ? "Hit" : "Miss"

    if @shot_history[player] == nil
      @shot_history[player] = [{:result=>result, :position=>position}]
    else
      @shot_history[player] << {:result=>result, :position=>position}
    end

    return result
  end

  def check_at_position(position)
    # type checks variable at given position on self board and returns it
    return @board[position[0] - 1][position[1].ord - 97]
  end

  def draw_shot_history(player)
    history_board = create_board(@board_size)
    @shot_history[player].each do |shot|
      result = shot[:result]
      history_board[shot[:position][0] - 1][shot[:position][1].ord - 97] = (result == "Hit" ? "H" : "M") 
    end
    return "Shots at #{player.to_s}:\n#{draw_board(history_board)}"
  end

  def to_s()
    return @name
  end
end
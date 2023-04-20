require './lib/ship.rb'

class Player
  def initialize(name, board_size, ship_sizes)
    @name = name
    @ships = ship_sizes
    @board = create_board(board_size)
  end

  def place_ships()
    # iterates through the list of ship sizes and mutates it into
    # a list of Ship objects at correct positions and size
    @ships.map! do |ship_size|
      position = [2,"b"]
      horizontal = true
      # create ship object
      ship = Ship.new(ship_size, position, horizontal)
      ship_size.times do
        @board[position[0] - 1][position[1].ord - 97] = 'S'
        horizontal ? (position[1] = (position[1].ord + 1).chr) : position[0] += 1
      end
      ship_size = ship
    end
    return "#{@name} has finished placing ships."
  end

  def create_board(size)
    # Creates and returns an array of nested arrays to make a size x size matrix
    return Array.new(size) { Array.new(size) {" "} }
  end

  def draw_board()
    # Draws a board based on the @board variable
    # Returns the board in the form of a string
    board_string = "  "
    divider = "  #{'-' * (@board[0].size * 2 + 1)}\n"
    column_counter = 97 # 'a'

    @board[0].size.times do
      board_string << " #{column_counter.chr}"
      column_counter += 1
    end

    board_string << "\n#{divider}"

    @board.each_with_index do |row, index|
      board_string << "#{index + 1} |#{row.join("|")}|\n"
      board_string << divider
    end

    return board_string
  end

  def ships()
    return @ships
  end
end
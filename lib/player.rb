require 'ship'

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
      position = [0,0]
      orientation = "horizontal"
      Ship.new(ship_size, position, orientation)
    end
  end

  def create_board(size)
    # Creates and returns an array of nested arrays to make a size x size matrix
    return Array.new(size, Array.new(size, " "))
  end
end
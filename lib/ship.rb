class Ship
  def initialize(ship_size, position, horizontal)
    @size = ship_size
    @position = position
    @horizontal = true
  end

  def to_s
    return "#{@size}"
  end
end
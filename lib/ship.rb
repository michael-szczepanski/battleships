class Ship
  attr_reader :position, :horizontal, :sizes
  attr_accessor :hit_points 

  def initialize(ship_size, position, horizontal)
    @size = ship_size
    @position = position
    @horizontal = true
    @hit_points = ship_size
  end

  def to_s
    return "#{@size}"
  end
end